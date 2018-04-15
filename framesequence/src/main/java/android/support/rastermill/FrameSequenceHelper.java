package android.support.rastermill;

import android.support.annotation.NonNull;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

/**
 * Created by zhanglei on 2017/9/11.
 */

public class FrameSequenceHelper {

    public static boolean isSupported(@NonNull File file) throws Exception {
        if (!file.exists()) {
            return false;
        }

        if (!file.isFile()) {
            return false;
        }

        InputStream inputStream = istreamFromFile(file);
        return isSupported(inputStream);
    }

    public static boolean isSupported(@NonNull InputStream inputStream) throws Exception {
        return FrameSequence.isSupport(inputStream);
    }

    private static InputStream istreamFromFile(File f) {
        try {
            return new FileInputStream(f);
        } catch (Exception ignore) {

        }
        return null;
    }

}
