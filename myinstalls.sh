#!/bin/bash 

echo "1 - Bash Git Prompt"
echo "2 - My Alias"
echo "3 - x2go"
echo "4 - Java"
echo "5 - Install essential build tools"
echo "6 - lzma Backport"
read -p "Choose Installation:" CINST

case "$CINST" in
        1) echo "Installing Bash Git Prompt"
			sudo apt-get install git
			cd ~
			rm -rf .bash-git-prompt
			git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt
			echo "	GIT_PROMPT_ONLY_IN_REPO=1" >> ~/.bashrc
			echo "	source ~/.bash-git-prompt/gitprompt.sh" >> ~/.bashrc
			echo "	" >> ~/.bashrc
			source ~/.bashrc
            ;;
        2) echo "Installing Alias"
    	    cat ~/bin/alias.txt >> ~/.bashrc
			source ~/.bashrc
            ;;
        3) echo "Installing x2go"
			sudo add-apt-repository ppa:x2go/stable
			sudo apt-get update
			sudo apt-get install x2goserver x2goserver-xsession x2golxdebindings lxde chromium-browser pluma
			;;
        4) echo "Java"
			sudo apt-get purge openjdk-\* icedtea-\* icedtea6-\*
			sudo apt-get update && sudo apt-get install openjdk-7-jdk
            ;;
        5) echo "Install essential build tools"
			sudo apt-get install git ccache automake lzop bison gperf build-essential zip curl zlib1g-dev zlib1g-dev:i386 g++-multilib python-networkx libxml2-utils bzip2 libbz2-dev libbz2-1.0 libghc-bzlib-dev squashfs-tools pngcrush schedtool dpkg-dev liblz4-tool make optipng
			mkdir ~/bin && curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo && chmod a+x ~/bin/repo
            ;;
        6) echo "Install essential build tools"
			sudo apt-get install liblzma-dev python-dev librsync-dev
			sudo pip install backports.ssl_match_hostname
			git clone git://github.com/peterjc/backports.lzma.git
			cd backports.lzma
			sudo python setup.py install
			cd test
			sudo python test_lzma.py
            ;;
        *) echo "Quit!"
            ;;
esac


