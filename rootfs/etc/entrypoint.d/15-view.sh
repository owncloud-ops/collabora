#!/usr/bin/env bash

declare -x COLLABORA_PER_VIEW_OUT_OF_FOCUS_TIMEOUT
[[ -z "${COLLABORA_PER_VIEW_OUT_OF_FOCUS_TIMEOUT}" ]] && COLLABORA_PER_VIEW_OUT_OF_FOCUS_TIMEOUT="60"

declare -x COLLABORA_PER_VIEW_IDLE_TIMEOUT
[[ -z "${COLLABORA_PER_VIEW_IDLE_TIMEOUT}" ]] && COLLABORA_PER_VIEW_IDLE_TIMEOUT="900"

true
