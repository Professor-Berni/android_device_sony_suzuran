#!/system/bin/sh
# *********************************************************************
# * Copyright 2015 (C) Sony Mobile Communications Inc.                *
# * All rights, including trade secret rights, reserved.              *
# *********************************************************************
#

echo 60 > /proc/sys/kernel/sched_small_task
echo 90 > /proc/sys/kernel/sched_downmigrate
echo 9 > /proc/sys/kernel/sched_upmigrate_min_nice
echo 30 > /proc/sys/kernel/sched_init_task_load
echo 1 > /sys/devices/system/cpu/cpu4/core_ctl/min_cpus
# Setting b.L per-core scheduler parameters
for i in {0,1,2,3}
do
	echo 5 > /sys/devices/system/cpu/cpu$i/sched_mostly_idle_nr_run
	echo 60 > /sys/devices/system/cpu/cpu$i/sched_mostly_idle_load
	echo 960000 > /sys/devices/system/cpu/cpu$i/sched_mostly_idle_freq
	echo 0 > /sys/devices/system/cpu/cpu$i/sched_prefer_idle
done
for i in {4,5,6,7}
do
	echo 3 > /sys/devices/system/cpu/cpu$i/sched_mostly_idle_nr_run
	echo 20 > /sys/devices/system/cpu/cpu$i/sched_mostly_idle_load
	echo 0 > /sys/devices/system/cpu/cpu$i/sched_mostly_idle_freq
	echo 0 > /sys/devices/system/cpu/cpu$i/sched_prefer_idle
done

exit 0
