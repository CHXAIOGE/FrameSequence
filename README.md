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







