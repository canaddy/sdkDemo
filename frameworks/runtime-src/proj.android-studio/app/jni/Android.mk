LOCAL_PATH := $(call my-dir)
# --- libBugly.so ---
include $(CLEAR_VARS)
LOCAL_MODULE := bugly_native_prebuilt
LOCAL_SRC_FILES := prebuilt/$(TARGET_ARCH_ABI)/libBugly.so
include $(PREBUILT_SHARED_LIBRARY)
# --- end ---

include $(CLEAR_VARS)

LOCAL_MODULE := cocos2djs_shared

LOCAL_MODULE_FILENAME := libcocos2djs

LOCAL_SRC_FILES := hellojavascript/main.cpp \
                   ../../../Classes/AppDelegate.cpp 

LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../../Classes

LOCAL_STATIC_LIBRARIES := cocos2d_js_static

LOCAL_EXPORT_CFLAGS := -DCOCOS2D_DEBUG=2 -DCOCOS2D_JAVASCRIPT

LOCAL_STATIC_LIBRARIES += bugly_crashreport_cocos_static

LOCAL_STATIC_LIBRARIES += bugly_agent_cocos_static_js

include $(BUILD_SHARED_LIBRARY)


$(call import-module, scripting/js-bindings/proj.android)

$(call import-module,external/bugly)
$(call import-module,external/bugly/js)