!/usr/bin/env sh

LOGTIME=$(date "+%Y-%m-%d %H:%M:%S")
LOGMINUTE=$(date +"%M")
D_MIN=60

print_log () {
        logger -s $1
}

ping_address () {

        ping -c 1 -W 10 -w 10 $1 >/dev/null
        ret=$?

        if [ $(($LOGMINUTE%$D_MIN)) -eq 0 ]; then

                #echo ping result $ret
                if [ $ret -eq 0 ]; then
                        print_log "[Watchdog] $1: PASS"
                else
                        print_log "[Watchdog] $1: FAILED" true
                        printf "From: MiTang.Server <server@mitang.me>\nSubject: [MiTang Server] Watchdog [$1] is not accessible!\n\nAlert!\n[$1] is not accessible at this moment, please check.\n" | msmtp -a$
                        sleep 1
                fi
        fi
}

# Watch dogs important servers.
ping_address "ds.mitang.me"