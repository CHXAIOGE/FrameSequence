ifeq ($(NENO_ACTIVATE), true)
    LOCAL_ARM_NEON = true
    ARCH_ARM_HAVE_NEON = true
    # TODO: Have libjpeg do this
    # APP_CFLAGS := -D__ARM_HAVE_NEON=1
endif

ifeq ($(BUILD_MODE), LITE_MODE)
    APP_ABI := armeabi-v7a
    APP_PLATFORM := android-15
endif

ifeq ($(BUILD_MODE), BASE_MODE)
    APP_ABI := armeabi-v7a arm64-v8a
    APP_PLATFORM := android-15
endif

ifeq ($(BUILD_MODE), ALL_MODE)
    APP_ABI := all
    APP_PLATFORM := android-15
endif

ifeq ($(BUILD_MODE), COMPAT_MODE)
    APP_ABI := armeabi
    APP_PLATFORM := android-8
endif