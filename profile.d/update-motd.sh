# runs the script on /etc/update-motd.d

motd_shown_file="$HOME/.motd_shown"
hushlogin_file="$HOME/.hushlogin"

if [ ! -e "$hushlogin_file" ] && ! find "$motd_shown_file" -newermt 'today  0:00' 2>/dev/null | grep -q  -m 1 '';  then
    run-parts  --lsbsysinit /etc/update-motd.d
    touch "$motd_shown_file"
    printf "This message is shown once a day. To disable it you can create the\n%s file\n" "$hushlogin_file"
fi
