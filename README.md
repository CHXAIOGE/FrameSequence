# FrameSequence
animate webp and gif support 

Exported android source code lib FrameSequence as a new project

link below . you can also download the code and write makefile yourself that's quite simple

https://developers.google.com/speed/webp/

Build this project yourself or you can simply download aar in 'package' directory

Well, I do not make it a release version. It's not the code wrote myself actually -_-|||.

But you can use my wrapper Project 'AnimateGraphics' which I will soon upload.

That wrapped a support for framesequence and apng. 

It Use registery to register libs you need. No dependency or prefabs included.

So you can customize your own support.

CustomModify:

You can change the 'BUILD_MODE' tag and 'NENO_ACTIVATE' tag to build aar you need
编译模式:
BUILD_MODE := LITE_MODE
NENO指令优化宏:(默认开启)
NENO_ACTIVATE = true

这个编译选项专门为arm定制，需要使用x86和x64的使用[ALL_MODE] 模式编译
ALL_MODE     -- 编译除（mips64 armeabi mips） 外的所有lib
requirements:
 APP_PLATFORM android-15
 ndk under r16

LITE_MODE    -- （仅编译armv7 忽略64-v8）将使aar整体减小约100k arm64上性能有损失
requirements:
 APP_PLATFORM android-15

BASE_MODE    -- （编译armv7 arm64-v8a）默认模式
 requirements:
 APP_PLATFORM android-15

COMPAT_MODE  -- 兼容模式 兼容老版本armv4, v5 最低支持到android-8 使用这个可以获得最小包体积, 但是性能上有损失
requirements:
 APP_PLATFORM android-15
 ndk under r16

Usage:

    [check support]
    
    FrameSequenceHelper.isSupported(rawImageStream);
    FrameSequenceHelper.isSupported(file);
      
    FrameSequence frameSequence = FrameSequence.decodeStream(rawImageStream);
    FrameSequenceDrawable drawable = new FrameSequenceDrawable(frameSequence);
    drawable.setLoopCount(1);
    drawable.setLoopBehavior(LOOP_FINITE);
    drawable.setOnFinishedListener(new FrameSequenceDrawable.OnFinishedListener() {
        @Override
        public void onFinished(FrameSequenceDrawable frameSequenceDrawable) {
            //do what you need.
        }
    });







