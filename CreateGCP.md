# Build Android on Google Cloud Platform
## Create a Linux VM as a build machine:
- Go to https://console.cloud.google.com/compute/instances
- On the top, click on Create instance
- Select N1 for series, and n1-standard-4 for machine type 
- Scroll down to Boot Disk session and click on Change, change the disk size from 10 to 600 and hit select 
- At Firewall, check both boxes then hit Create.
- To launch VM, click on SSH and it would pop up
## Building Android and CTS
1. [Setup environment](https://source.android.com/setup/build/initializing)
   - [Install required packages](https://source.android.com/setup/build/initializing#installing-required-packages-ubuntu-1804)
2. [Get Repo for source control](https://source.android.com/setup/develop)
   - Python and libncurses are needed on VM
   - Install Python 2.7
   
   ```
   sudo apt-get install python
   ```
   - Check Python version
   
   ```
   which python
   ```
   - Insall libncurses 
   
   ``` 
   sudo apt-get install libncurses5
   ```

3. [Download from Android source tree](https://source.android.com/setup/build/downloading)
   - Config Git enviroemnt
   ``` 
   git config --global user.name "Your Name
   git config --global user.email "you@example.com 
   ```
   
  - Downliad from Android source tree  
   ```
   mkdir -p $HOME/ws/android
   cd $HOME/ws/android
   repo init -u https://android.googlesource.com/platform/manifest
   repo sync
   ```
   
4. [Build and run CTS](https://source.android.com/compatibility/cts/development)
   - See [mk_cts.sh](https://github.com/Alwin-Lin/ctsVerifierSample/blob/master/tools/mk_cts.sh) for details
   - It assumes Android source tree is under $HOME/ws/android
   - This will output the following to $HOME/ws/libs
      - cts-sensors-tests compatibility-device-util-axt android.test.base_static
      - cts-sensors-tests.jar
      - compatibility-device-util-axt.jar
      - android.test.base.jar
      
## Createing remote desktop
Remote desktop prevents process from being terminated if the conection is lost.
- [Installing Chrome Remote Desktop on the VM instance](https://cloud.google.com/solutions/chrome-desktop-remote-on-compute-engine#installing_chrome_remote_desktop_on_the_vm_instance)
   - Remote desktop requires python3-minimal on the VM
   ```
   sudo apt install -f --reinstall python3-minimal
   ```
