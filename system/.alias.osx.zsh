# Copy pwd to clipboard

alias cpwd="pwd|tr -d '\n'|pbcopy"

alias cask="brew cask"

alias chrome="open -a ~/Applications/Google\ Chrome.app"
alias firefox="open -a ~/Applications/Firefox.app"

alias afk="open /System/Library/CoreServices/ScreenSaverEngine.app"

# Reload native apps
alias killfinder="killall Finder"
alias killdock="killall Dock"
alias killmenubar="killall SystemUIServer NotificationCenter"
alias killos="killfinder && killdock && killmenubar"

# Kill all tabs and free that memory
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"
alias displays="system_profiler SPDisplaysDataType"
alias cpu="sysctl -n machdep.cpu.brand_string"
