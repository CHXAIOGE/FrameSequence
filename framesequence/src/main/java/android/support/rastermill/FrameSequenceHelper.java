package android.support.rastermill;

import android.support.annotation.NonNull;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

/**
 * Created by zhanglei on 2017/9/11.
 */

public class FrameSequenceHelper {

    public static boolean isSupported(@NonNull File file) {
        if (!file.exists()) {
            return false;
        }

        if (!file.isFile()) {
            return false;
        }

        InputStream inputStream = istreamFromFile(file);
        return inputStream != null && isSupported(inputStream);
    }

    public static boolean isSupported(@NonNull InputStream inputStream) {
        FrameSequence frameSequence = null;
        try {
            frameSequence = FrameSequence.decodeStream(inputStream);
        } catch (Exception ignore) {

        }

        if(frameSequence == null) {
            return false;
        }

        int frameCount = 0;
        try {
            frameCount = frameSequence.getFrameCount();
        } catch (Throwable ignore) {

        }
        return frameCount > 0;
    }

    private static InputStream istreamFromFile(File f) {
        try {
            return new FileInputStream(f);
        } catch (Exception ignore) {

        }
        return null;
    }

}
