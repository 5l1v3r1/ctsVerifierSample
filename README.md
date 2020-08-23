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
     - [sensor library](https://cs.android.com/android/platform/superproject/+/master:cts/tests/sensor/)
     - compatibility-device-util-axt 
