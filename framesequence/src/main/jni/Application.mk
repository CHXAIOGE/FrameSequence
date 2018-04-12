# aar jvm 版本要求: >= 1_6
# 1.5 版本编译的SDK自行修改[JNI_OnLoad]
# 编译模式选项:
# Android NDK @ndk r16 : Application targets deprecated ABI(s): mips64 armeabi mips
# 使用[ALL_MODE]和[COMPAT_MODE] 编译需要使用ndk r16以下进行编译

# 这个编译选项专门为arm定制，需要使用x86和x64的使用[ALL_MODE] 模式编译
#   ALL_MODE     -- 编译除（mips64 armeabi mips） 外的所有lib
#       requirements:
#           [APP_PLATFORM android-15]
#           [ndk under r16]

#   LITE_MODE    -- （仅编译armv7 忽略64-v8）将使aar整体减小约100k arm64上性能有损失 [APP_PLATFORM android-15]
#       requirements:
#           [APP_PLATFORM android-15]

#   BASE_MODE    -- （编译armv7 arm64-v8a）默认模式 [APP_PLATFORM android-15]
#       requirements:
#           [APP_PLATFORM android-15]

#   COMPAT_MODE  -- 兼容模式 兼容老版本armv4, v5 最低支持到android-8 使用这个可以获得最小包体积, 但是性能上有损失
#       requirements:
#           [APP_PLATFORM android-15]
#           [ndk under r16]

# Setting LOCAL_ARM_NEON will enable -mfpu=neon which may cause illegal
# instructions to be generated for armv7a code. Instead target the neon code
# specifically.

# 编译模式:
BUILD_MODE := LITE_MODE
# NENO指令优化宏:(默认开启)
NENO_ACTIVATE = true

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



