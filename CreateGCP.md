# Build Android on Google Cloud Platform
## Create a Linux VM as a build machine:
- Go to https://console.cloud.google.com/compute/instances
- On the top, click on Create instance
- Select N1 for series, and n1-standard-4 for machine type 
- Scroll down to Boot Disk session and click on Change, change the disk size from 10 to 600 and hit select 
- At Firewall, check both boxes then hit Create.
- To launch VM, click on SSH and it would pop up
## Building Android and CTS
1. Setup Python on VM
   - Install Python
   
   ```sudo apt-get install python```
   - Check Python version
   
   ```which python```
2. [Setup environment](https://source.android.com/setup/build/initializing)

    ``` sudo apt-get install git-core gnupg flex bison build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig``` 
3. [Get Repo for source control](https://source.android.com/setup/develop)
   - Make a bin/ directory in home
   
   ``` mkdir ~/bin``` 
   
   ``` PATH=~/bin:$PATH```
   - Download Repo Launcher and make it executable
   
   ```curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo```

   ```chmod a+x ~/bin/repo```
4. [Download from Android source tree](https://source.android.com/setup/build/downloading)
   - Make a working directory
   
   ```mkdir WORKING_DIRECTORY```
   
   ```cd WORKING_DIRECTORY```
   - Configure Git
   
   ```git config --global user.name "Your Name"```
   
   ```git config --global user.email "you@example.com"```
   - initalize Repo
   
   ```repo init -u https://android.googlesource.com/platform/manifest```
   - Download from Android source tree, N represents thread count
   
   ```repo sync -jN```
5. [Build and run CTS](https://source.android.com/compatibility/cts/development)
   - See [mk_cts.sh](https://github.com/Alwin-Lin/ctsVerifierSample/blob/master/tools/mk_cts.sh) for details
   - It assumes Android source tree is under $HOME/ws/android
   - This will output the following to $HOME/ws/libs
      - cts-sensors-tests compatibility-device-util-axt android.test.base_static
      - cts-sensors-tests.jar
      - compatibility-device-util-axt.jar
      - android.test.base.jar
