#!/usr/bin/env sh

wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep MUTED > /dev/null && echo '{"percentage": 0}' || echo '{"percentage": 100}'
