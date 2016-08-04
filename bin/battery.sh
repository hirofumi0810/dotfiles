#!/bin/sh
# /usr/bin/pmset -g ps | awk '{ if (NR == 2) print "Batteries:" $2 " Status:" $3 " " $4 " " $5; }' | sed "s/;//g"


# If the current_bat is less than the BATTERY_DANGER,
# output color will be red
BATTERY_DANGER=20


# get_battery returns remaining battery
get_battery() {
    local current_bat percentage
    current_bat="$(pmset -g ps | grep -o '[0-9]\+%' | tr -d '%')"

    # trim dot (e.g., 79.61 -> 79)
    percentage="${current_bat%%.*}"
    if [ -n "$percentage" ]; then
        echo "$percentage%"
    fi
}

# is_charging returns true if the battery is charging
is_charging() {
    pmset -g ps | grep -E "Battery Power|charged" >/dev/null 2>&1
    if [ $? -eq 0  ]; then
        return 1
    else
        return 0
    fi
}

# battery_color_tmux colourizes the battery level for tmux
battery_color_tmux() {
    local percentage
    percentage="${1:-$(get_battery)}"

    if is_charging; then
        [[ -n $percentage ]] && echo "#[fg=colour46]${percentage}#[default]"
    else
        # percentage > BATTERY_DANGER
        if [ "${percentage%%%*}" -ge "$BATTERY_DANGER" ]; then
            echo "#[fg=blue]${percentage}#[default]"
        else
            echo "#[fg=red]${percentage}#[default]"
        fi
    fi
}

# check arguments
for i in "$@"
do
    case "$i" in
        "--tmux")
            battery_color_tmux "$(get_battery)"
            exit $?
            ;;
        -*|--*)
            echo "$i: unknown option" 1>&2
            exit 1
    esac
done
