#!/usr/bin/env bash
LC_ALL=C LANG=C;
rofi_command="rofi -theme themes/promptmenu.rasi"

# Options and icons.
yes_text="" no_text="" query="Are you sure?"

# Parse the arguments.
if [[ $# -eq 0 ]]; then
    printf "Usage: \e[100m \e[32mpromptmenu\e[39;100m -y <command> \e[0m\n"
    printf "All the options:
     \e[34mOPTIONAL \e[39;100m [ -o | --yes-text ] <text> \e[0m\n \
    \e[34mOPTIONAL \e[39;100m [ -c | --no-text ] <text> \e[0m\n \
    \e[35mREQUIRED \e[39;100m [ -y | --yes-command ] <command> \e[0m\n \
    \e[34mOPTIONAL \e[39;100m [ -n | --no-command ] <command> \e[0m\n \
    \e[34mOPTIONAL \e[39;100m [ -q | --query ] txt \e[0m"
    exit 1
else
    while [[ $# -ne 0 ]]; do
        case ${1} in
            -o|--yes-text)    [[ -n "$2" ]] && yes_text="$2" || yes_text=""
                              shift
            ;;
            -c|--no-text)     [[ -n "$2" ]] && no_text="$2" || no_text=""
                              shift
            ;;
            -y|--yes-command) [[ -n "$2" ]] && yes_command="$2"
                              shift
            ;;
            -n|--no-command)  [[ -n "$2" ]] && no_command="$2"
                              shift
            ;;
            -q|--query)       [[ -n "$2" ]] && query="$2"
                              shift
            ;;
        esac
        shift
    done
fi

# Variable passed to rofi.
options="${yes_text}\n${no_text}"

# Main.
chosen="$(printf "${options}\n" | ${rofi_command} -p "$query" -dmenu -selected-row 1)"
case "$chosen" in
    "$yes_text") eval "$yes_command"
    ;;
    "$no_text")  eval "$no_command"
    ;;
esac 

exit $?
