/*Copyright (c) [2019-2020] [Seek Thermal, Inc.]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The Software may only be used in combination with Seek cores/products.

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

package com.onesys.pig_care;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.content.pm.ActivityInfo;
import android.content.res.ColorStateList;
import android.graphics.Typeface;
import android.os.Bundle;
import android.util.Size;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.ColorInt;
import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import com.thermal.seekware.CaptureResult;
import com.thermal.seekware.ColorPalettePicker;
import com.thermal.seekware.SeekCamera;
import com.thermal.seekware.SeekCameraManager;
import com.thermal.seekware.SeekImage;
import com.thermal.seekware.SeekMediaCapture;
import com.thermal.seekware.SeekPreview;
import com.thermal.seekware.SeekUtility;
import com.thermal.seekware.VideoCaptureRequest;

import java.util.Arrays;
import java.util.Objects;

public class SimpleActivity extends AppCompatActivity {
    /* Static Fields */
    private static final String TAG = SimpleActivity.class.getSimpleName();
    private static final @ColorInt
    int PHOTO_CAPTURE_BUTTON_COLOR = 0xFFFFFFFF;
    private static final @ColorInt
    int VIDEO_CAPTURE_BUTTON_COLOR = 0xFFFF0000;
    private static final int MEDIA_CAPTURE_SCALE_FACTOR = 4;
    private static final float PREVIEWS_PER_SCREEN = 5.5f;
    private static final int SHUTTER_SPEED_IN_MILLIS = 500;
    private boolean photo = true;

    private static final SeekCamera.ColorPalette[] luts = {
            SeekCamera.ColorPalette.TYRIAN,
            SeekCamera.ColorPalette.IRON2,
            SeekCamera.ColorPalette.RECON,
            SeekCamera.ColorPalette.BLACK_RECON,
            SeekCamera.ColorPalette.WHITEHOT,
            SeekCamera.ColorPalette.BLACKHOT,
            SeekCamera.ColorPalette.AMBER,
            SeekCamera.ColorPalette.GREEN,
            SeekCamera.ColorPalette.SPECTRA
    };

    private boolean initialized = false;

    private SeekCamera thermalCamera;
    private SeekCameraManager seekCameraManager;
    private SeekPreview seekPreview;
    private SeekMediaCapture seekMediaCapture;
    private SeekUtility.PermissionHandler permissionHandler;
    SimpleOverlay simpleOverlay;
    private ImageButton switchButton;
    private ImageButton captureButton;
    private ImageButton stopButton;
    private TextView videoInfo;
    private ColorPalettePicker colorPalettePicker;
    private ImageView thermalOverlay;

    private SeekCamera.StateCallback stateCallback = new SeekCamera.StateCallbackAdapter() {
        @Override
        public synchronized void onOpened(SeekCamera seekCamera) {
            thermalCamera = seekCamera;
            SeekCamera.Characteristics characteristics = seekCamera.getCharacteristics();

            seekMediaCapture.setSize(characteristics.getHeight() * MEDIA_CAPTURE_SCALE_FACTOR,
                    characteristics.getWidth() * MEDIA_CAPTURE_SCALE_FACTOR);
            seekCamera.createSeekCameraCaptureSession(seekPreview, seekMediaCapture);
        }

        @Override
        public synchronized void onStarted(SeekCamera camera) {
            seekPreview.bringToFront();
        }

        @Override
        public synchronized void onStopped(final SeekCamera seekCamera) {
            thermalOverlay.bringToFront();
        }

        @Override
        public synchronized void onClosed(SeekCamera seekCamera) {
            thermalCamera = null;
            initialized = false;
        }
    };


    /**
     * Lets the PermissionHandler handle the permission callback.
     *
     * @param requestCode  request code associated with callback
     * @param permissions  permissions associated with callback
     * @param grantResults results associated with callback
     */
//    @Override
//    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
//        permissionHandler.onRequestPermissionsResult(requestCode, permissions, grantResults);
//    }
    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        permissionHandler.onRequestPermissionsResult(requestCode, permissions, grantResults);
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
    }



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        //hide the title bar
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        Objects.requireNonNull(getSupportActionBar()).hide();
        super.onCreate(savedInstanceState);

        //show the activity in full screen
        Window window = getWindow();
        window.setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN);
        // keep screen on
        window.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
        setContentView(R.layout.activity_main);

        simpleOverlay = new SimpleOverlay(this);

        setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LOCKED);
        captureButton = findViewById(R.id.capture);
        switchButton = findViewById(R.id.switch_camera_video);
        seekPreview = findViewById(R.id.seek_preview);
        stopButton = findViewById(R.id.stop_record);
        colorPalettePicker = findViewById(R.id.color_lut_picker);
        videoInfo = findViewById(R.id.video_info);
        thermalOverlay = findViewById(R.id.thermal_overlay);
        colorPalettePicker.setVisibility(View.INVISIBLE);
        stopButton.setVisibility(View.INVISIBLE);
        captureButton.setOnLongClickListener(v -> {
            onCaptureLongClicked(v);
            return true;
        });
        seekPreview.initialize(true, simpleOverlay);
        seekPreview.setDetectionMode(SeekPreview.DetectionMode.ALL);
        seekPreview.setStateCallback(new SeekPreview.StateCallbackAdapter() {
            @Override
            public void onFrameAvailable(SeekPreview seekPreview, SeekImage seekImage) {
                if(!initialized){
                    initialized = true;
                    Size size = new Size((int) (seekPreview.getWidth() / PREVIEWS_PER_SCREEN), (int) (seekPreview.getWidth() / PREVIEWS_PER_SCREEN * 4f / 3f));
//                    Typeface typeface = Typeface.createFromAsset(getAssets(), "Gotham Bold Regular.ttf");
                    ColorPalettePicker.LinearConfiguration linearConfiguration = new ColorPalettePicker.LinearConfiguration(getApplicationContext(),
                            Arrays.asList(luts), true, size, new ColorPalettePicker.TextAttributes.Builder().build());
                    colorPalettePicker.initialize(seekImage, linearConfiguration);
                }
                if(seekPreview.getFrameNumber() % 2 == 0 && colorPalettePicker.getVisibility() == View.VISIBLE){
                    colorPalettePicker.update();
                }
                updateVideoInfo();
            }
        });

        seekMediaCapture = new SeekMediaCapture(this, simpleOverlay);
        seekMediaCapture.setStateCallback(new SeekMediaCapture.StateCallbackAdapter() {
            @Override
            public void onPhotoTaken(SeekMediaCapture seekMediaCapture, CaptureResult result) {
                runOnUiThread(() -> {
                    Toast.makeText(getApplicationContext(), "Capture: " + result.filename, Toast.LENGTH_SHORT).show();
                    thermalOverlay.bringToFront();
                    thermalOverlay.animate().alpha(0).setDuration(SHUTTER_SPEED_IN_MILLIS).setInterpolator(new AccelerateDecelerateInterpolator()).setListener(new AnimatorListenerAdapter() {
                        @Override
                        public void onAnimationEnd(Animator animation) {
                            thermalOverlay.setAlpha(1.0f);
                            seekPreview.bringToFront();
                        }
                    }).start();
                });
            }

            @Override
            public void onVideoRecordingStarted(SeekMediaCapture seekMediaCapture, VideoCaptureRequest captureRequest) {
                runOnUiThread(() -> {
                    captureButton.setVisibility(View.INVISIBLE);
                    stopButton.setVisibility(View.VISIBLE);
                    Toast.makeText(getApplicationContext(), "Video Recording Started: " + captureRequest.filename, Toast.LENGTH_SHORT).show();
                });
            }

            @Override
            public void onVideoRecordingEnded(SeekMediaCapture seekMediaCapture, CaptureResult captureResult) {
                runOnUiThread(() -> {
                    captureButton.setVisibility(View.VISIBLE);
                    stopButton.setVisibility(View.INVISIBLE);
                    Toast.makeText(getApplicationContext(), "Video Recording Ended: " + captureResult.filename, Toast.LENGTH_SHORT).show();
                });
            }
        });
        seekCameraManager = new SeekCameraManager(this, null, stateCallback);

        // Create PermissionHandler
        permissionHandler = SeekUtility.PermissionHandler.getInstance();
        SeekUtility.OrientationManager.getInstance().addViews(findViewById(R.id.color_lut), switchButton);
    }

    private void updateVideoInfo(){
        runOnUiThread(() -> {
            if(seekMediaCapture.isRecording()){
                videoInfo.setText(SeekUtility.formatTime(seekMediaCapture.getElapsedTime(), 0, false));
            } else {
                videoInfo.setText("");
            }
        });
    }

    public void onCaptureClicked(View v) {
        if(photo){
            seekMediaCapture.takePhoto();
        } else {
            seekMediaCapture.startRecording();
        }
    }

    /**
     * Called when the stop button is clicked
     *
     * @param v view associated with callback
     */
    public void onStopClicked(View v) {
        seekMediaCapture.stopRecording();
    }

    /**
     * Called when the switch button is clicked
     *
     * @param v view associated with callback
     */
    public void onSwitchClicked(View v) {
        if (photo) {
            switchButton.setBackgroundResource(R.drawable.ic_switch_camera);
            captureButton.setBackgroundTintList(ColorStateList.valueOf(VIDEO_CAPTURE_BUTTON_COLOR));
            photo = false;
        } else {
            switchButton.setBackgroundResource(R.drawable.ic_switch_video);
            captureButton.setBackgroundTintList(ColorStateList.valueOf(PHOTO_CAPTURE_BUTTON_COLOR));
            photo = true;
        }
    }

    /**
     * Called when the color lut button is clicked
     *
     * @param v view associated with callback
     */
    public void onColorLutClicked(View v){
        colorPalettePicker.setVisibility(colorPalettePicker.getVisibility() == View.VISIBLE ? View.INVISIBLE : View.VISIBLE);
    }

    /**
     * Called when the capture button is long clicked
     *
     * @param v view associated with callback
     */
    public void onCaptureLongClicked(View v){
        if(thermalCamera != null){
            thermalCamera.triggerShutter();
            Toast.makeText(getApplicationContext(), "Shutter Triggered", Toast.LENGTH_SHORT).show();
        }
    }
}
