export PATH=$HOME/bin:/opt/local/bin:$PATH:~/go/bin:~/Library/Python/3.7/bin

export ANDROID_SDK=$HOME/Library/Android/sdk
if [ -d $ANDROID_SDK ];then
  export PATH=$ANDROID_SDK/platform-tools:$PATH
fi

export EDITOR=/usr/local/bin/nvim

# set the number of open files to be 1024
ulimit -S -n 2048 

# mount the android file image
mountAndroid() { hdiutil attach ~/Documents/android.dmg.sparseimage -mountpoint /Volumes/android; }

# unmount the android file image
umountAndroid() { hdiutil detach /Volumes/android; }

[ -f ~/dotfiles/.alias.zsh ] && source ~/dotfiles/.alias.zsh
