# CTS Verifier Sample App
[CTS Verifier](https://source.android.com/compatibility/cts/verifier) provides tests for APIs and functions that can't be tested on a stationary device without manual input. Currently, you can only build CTS Verifier APK from full Android source. Which takes hours to sync and build. This sample app demonstrates how to un-bundle CTS verifier to build by Android Studio. It also shows how an independent test app may report test results as a CTS verifier report. 

# Feature
- CTS verifier sensor test.
- Generate CTS verifier test report.

# Architecture
- project: Android Studio project files.
  - Entry point TestListActivity.
  - Save report by ReportExporter.
  - CTS report [ResultHandler](https://cs.android.com/android/platform/superproject/+/master:test/suite_harness/common/util/src/com/android/compatibility/common/util/ResultHandler.java;l=57?q=ResultHandler&sq=&ss=android)
     - Re-use CTS format, from compatibility-device-util-axt
- ctsVerifier: The source code, same with that in the [original CTS Verifier](https://cs.android.com/android/platform/superproject/+/master:cts/apps/CtsVerifier/)
- libs: Pre-built library. 
  - Depends on prebuild libs:
     - [cts-sensors-tests](https://cs.android.com/android/platform/superproject/+/master:cts/tests/sensor/Android.mk;bpv=0;bpt=0)
     - [compatibility-device-util-axt](https://cs.android.com/android/platform/superproject/+/master:cts/common/device-side/util-axt/Android.bp?q=compatibility-device-util-axt%20%20&ss=android%2Fplatform%2Fsuperproject)
     - [android.test.base_static](https://cs.android.com/android/platform/superproject/+/master:frameworks/base/test-base/Android.bp?q=android.test.base_static&ss=android%2Fplatform%2Fsuperproject)
     
# Notes
## Create prebuilt libs from Android
1. [Building and running CTS](https://source.android.com/compatibility/cts/development#building-and-running-cts)
2. Build the libaries
   - make -j8 cts-sensors-tests compatibility-device-util-axt android.test.base_static
   - cp out/target/product/generic_x86_64/obj/JAVA_LIBRARIES/cts-sensors-tests_intermediates/javalib.jar ~/Downloads/cts-sensors-tests.jar
   - cp out/target/product/generic_x86_64/obj/JAVA_LIBRARIES/compatibility-device-util-axt_intermediates/javalib.jar ~/Downloads/compatibility-device-util-axt.jar
   - cp out/target/product/generic_x86_64/obj/JAVA_LIBRARIES/android.test.base_static_intermediates/javalib.jar ~/Downloads/android.test.base.jar
3. Tests titles are written in manifest.xml, populated by ManifestTestListAdapter

# Refactor
## Unable to save report on user build
Fix: [android:requestLegacyExternalStorage=" true"](https://android.googlesource.com/platform/cts/+/018f43b6addeecf25e11193c9a1244b79a68528f%5E%21/#F0)
- For Android 10 or API > 29 this will have to be present, ignore otherwise

# Unbundleing
These are the depenencies to be worked around and clean up for fully unbundle.
- SensorFeaturesDeactivator.java:142: error: cannot find symbol [Settings.Secure.DOZE_ENABLED](https://cs.android.com/android/platform/superproject/+/master:frameworks/base/core/java/android/provider/Settings.java;l=7741?q=Settings.Secure.DOZE_ENABLED&ss=android)
- cts-sensors-test depends on android.test.AndroidTestCase, which is built in android.test.base_static
- cts-sensors-test and compatibility-device-util-axt both contain org.mockito.plugins.MockMaker, causing error: More than one file was found with OS independent path 'mockito-extensions/org.mockito.plugins.MockMaker'.
  - Open the jar and delete mockito-extensions folder in either one.
- To unbundle pre-built libary

# ToDo 
- Add to send report.
