alias sudo='su -c'
alias sysrw='
mount -o rw,remount /system
mount -o rw,remount /'

alias sysro='
mount -o ro,remount /system
mount -o ro,remount /'


HOME=/efs/ssh
TERM=linux
TERMINFO=/etc/terminfo/
ANDROID_ROOT=/system

export HOME TERM TERMINFO ANDROID_ROOT

alias ssu='umount /sdcard/home/sshfs'
alias ssx='sshfs sub77@10.42.0.1:/ sshfs/ -o IdentityFile=/efs/ssh/id_rsa'

 # This is the ~/.mkshrc file I use on my Debian machines

# check if this is really mksh  # {((
case $KSH_VERSION in
*MIRBSD\ KSH*) ;;
*) return 0 ;;
esac                            # }

# source the system-wide mkshrc file
[[ -s /etc/mkshrc ]] && . /etc/mkshrc

# I want to set my own prompt
PS1="\${PWD#${HOME%/*}/}$ "

: put your local alias/function definitions, patches, etc. here
alias ls='ls -F'
export PAGER="most"


alias mntssh='
if [ ! -f /mnt/sshfs ]; then
 sysrw
    mkdir /mnt/sshfs
 sysro
fi
 sshfs sub77@192.168.178.36:/ /mnt/sshfs/'

alias mntp2='
if [ ! -f /mnt/mmc1p2 ]; then
 sysrw
    mkdir /mnt/mmc1p2
 sysro
fi
 mount -t f2fs /dev/block/mmcblk1p2 /mnt/mmc1p2/'

alias mntp3='
if [ ! -f /mnt/mmc1p3 ]; then
 sysrw
    mkdir /mnt/mmc1p3
 sysro
fi
 mount -t ext4 /dev/block/mmcblk1p3 /mnt/mmc1p3/'



: make sure this is the last line, to ensure a good return code 




