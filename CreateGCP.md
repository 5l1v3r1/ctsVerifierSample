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
   
   ```sudo apt-get -y install python 3.7```
   - Check Python version
   
   ```which python```
2. [Setup environment](https://source.android.com/setup/build/initializing)
    ``` sudo apt-get install git-core gnupg flex bison build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig``` 
3. [Get Repo for source control](https://source.android.com/setup/develop)
   - Make a bin/ directory in home
   
   ``` mkdir ~/bin
   
   ``` PATH=~/bin:$PATH
4. [Download from Android source tree](https://source.android.com/setup/build/downloading)
5. [Build and run CTS](https://source.android.com/compatibility/cts/development)
