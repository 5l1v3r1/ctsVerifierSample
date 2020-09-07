SECONDS=0
mkdir -p $HOME/ws/libs
cd $HOME/ws/android
source build/envsetup.sh
lunch aosp_x86_64-userdebug
make cts cts-sensors-tests compatibility-device-util-axt android.test.base_static -j8
cp out/target/product/generic_x86_64/obj/JAVA_LIBRARIES/cts-sensors-tests_intermediates/javalib.jar $HOME/ws/libs/sensors-tests.jar
cp out/target/product/generic_x86_64/obj/JAVA_LIBRARIES/compatibility-device-util-axt_intermediates/javalib.jar $HOME/ws/libs/compatibility-device-util-axt.jar
cp out/target/product/generic_x86_64/obj/JAVA_LIBRARIES/android.test.base_static_intermediates/javalib.jar $HOME/ws/libs/android.test.base.jar
echo "Build time $SECONDS seconds"

