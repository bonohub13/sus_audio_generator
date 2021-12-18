#!/bin/sh -eu

check4dependency()
{
    command -v youtube-dl > /dev/null 2>&1 \
        && command -v ffmpeg > /dev/null 2>&1 \
        && command -v sox > /dev/null 2>&1 \
        && return 0 \
        || (echo "Missing neccessary packages for this script to run." \
        && echo "Dependencies:" \
        && echo "\tyoutube-dl" \
        && echo "\tffmpeg" \
        && echo "\tsox") \
        && return 1
}

grab_audio() {
    echo "Grabbing SUS! audio!"
    youtube-dl -x --audio-format flac \
        'https://www.youtube.com/watch?v=tsEWG-VbDAQ'
    ffmpeg -i "$(find -type f -name "*.flac")" -ss 25.2 -to 26.1 og_sus.flac
    echo "Making \"SUS\" longer..."
    for i in `seq 1 10`; do
        [ -f sussy_wussy.flac ] \
            && sox og_sus.flac sussy_wussy.flac sussy_wussy.flac \
            || sox og_sus.flac sussy_wussy.flac
    done

    echo "Done!"

    return 0
}

check4dependency
grab_audio
