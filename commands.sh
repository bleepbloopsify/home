

function notify {
    osascript -e 'display notification "'"$@"'" with title "Terminal" sound name "Frog"'
}
