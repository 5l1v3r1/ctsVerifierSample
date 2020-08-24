# CTS Verifier Sample App
[CTS Verifier](https://source.android.com/compatibility/cts/verifier) provides tests for APIs and functions that can't be tested on a stationary device without manual input. Currently, you can only build CTS Verifier APK from full Android source. Which takes hours to sync and build. This sample app demonstrates how to un-bundle CTS verifier to build by Android Studio. It also shows how an independent test app may report test results as a CTS verifier report. 

# Feature
- CTS verifier sensor test.
- Generate CTS verifier test report.

# Architecture
- project: Android Studio project files.
- ctsVerifier: The source code, same with that in the [original CTS Verifier](https://cs.android.com/android/platform/superproject/+/master:cts/apps/CtsVerifier/)
- libs: Pre-built library. 
  - Depends on prebuild libs:
     - [cts-sensors-tests](https://cs.android.com/android/platform/superproject/+/master:cts/tests/sensor/Android.mk;bpv=0;bpt=0)
     - [compatibility-device-util-axt](https://cs.android.com/android/platform/superproject/+/master:cts/common/device-side/util-axt/Android.bp?q=compatibility-device-util-axt%20%20&ss=android%2Fplatform%2Fsuperproject)
# Notes
## Create prebuilt libs from Android
1. [Building and running CTS](https://source.android.com/compatibility/cts/development#building-and-running-cts)
2. Build the libaries
  - make j8 cts-sensors-tests compatibility-device-util-axt
  - cp out/target/product/generic_x86_64/obj/JAVA_LIBRARIES/cts-sensors-tests_intermediates/javalib.jar ~/Downloads/cts-sensors-tests.jar
  - cp out/target/product/generic_x86_64/obj/JAVA_LIBRARIES/compatibility-device-util-axt_intermediates/javalib.jar ~/Downloads/compatibility-device-util-axt.jar
# To remove dependencies
- SensorFeaturesDeactivator.java:142: error: cannot find symbol [Settings.Secure.DOZE_ENABLED](https://cs.android.com/android/platform/superproject/+/master:frameworks/base/core/java/android/provider/Settings.java;l=7741?q=Settings.Secure.DOZE_ENABLED&ss=android)
- 


