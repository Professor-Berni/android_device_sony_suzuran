#!/system/bin/sh
# *********************************************************************
# * Copyright 2015 (C) Sony Mobile Communications Inc.                *
# * All rights, including trade secret rights, reserved.              *
# *********************************************************************
#

echo 10000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate
echo 85 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
echo 20000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time
echo 20000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/max_freq_hysteresis

echo 10000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_rate
echo 1248000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/hispeed_freq
echo 40000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/min_sample_time
echo 20000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/max_freq_hysteresis
echo 10000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_slack

exit 0
