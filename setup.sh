#!/bin/sh

## Setup script for Dotfiles
CWD=$(pwd)
arg=$1

echo -e "\u001b[32;1mSetting up Dotfiles...\u001b[0m"

if [[ "$arg" == "-i" || "$arg" == "--install" ]]; then
    echo -e "\u001b[37;1m\u001b[4mSelect an option:\u001b[0m"
    echo -e "  \u001b[34;1m1) for npm\u001b[0m"
    echo -e "  \u001b[34;1m2) for Oh-My-Zsh\u001b[0m"
    echo -e "  \u001b[34;1m3) for Powerlevel9K\u001b[0m"
    echo -e "  \u001b[34;1m4) for Custom zsh plugins\u001b[0m"
    echo -e "  \u001b[34;1m5) for HomeBrew stuff\u001b[0m"
    echo -e "  \u001b[31;1m0) to Exit\u001b[0m"

    read option

    case $option in
    "1")echo -e "\u001b[7mInstalling npm...\u001b[0m"
        sh -c "$(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash)"
        sh -c "$(sh system/npm.sh)"
        ;;
    "2")echo -e "\u001b[7mInstalling Oh-My-Zsh...\u001b[0m"
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
        ;;
    "3")echo -e "\u001b[7mInstalling Powerlevel9K...\u001b[0m"
        git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
        ;;
    "4")echo -e "\u001b[7mInstalling Custom zsh plugins ...\u001b[0m"
        cd ~/.oh-my-zsh/custom/plugins
        git clone https://github.com/zsh-users/zsh-autosuggestions
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
        git clone https://github.com/djui/alias-tips.git
        cd $CWD
        ;;

     "5")echo -e "\u001b[7mInstalling HomeBrew stuff ...\u001b[0m"
        if test !$(which brew); then
            /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        fi
        brew update
        brew bundle $CWD/install/BrewFile
        brew bundle $CWD/install/CaskFile
        cd $CWD
        ;;

    "6")echo -e "\u001b[4m\u001b[44mBye\u001b[0m"
        exit 0
        ;;

    *)echo -e "\u001b[31;1mInvalid option entered.\u001b[0m"
        exit 1
        ;;
    esac

    exit 0
fi

echo -e "\u001b[33;1mBacking up old files...\u001b[0m"
mv -iv ~/.zshrc ~/.zshrc.old
mv -iv ~/.gitconfig ~/.gitconfig.old

echo -e "\u001b[36;1mAdding symlinks...\u001b[0m"
ln -sv $CWD/system/.zshrc ~/.zshrc
ln -sv $CWD/git/config ~/.gitconfig

echo -e "\u001b[32;1mDone.\u001b[0m"
