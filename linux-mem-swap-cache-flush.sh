#!/usr/bin/sh

# Flush Linux pagecache, dentrie & inode (cache)
# Reswaping 0B

MIN_MEMORY=78643200 # Reswap only if there is free RAM (75MB)
#PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
#PATH=/bin:/sbin:$PATH

# Flush pagecache + reswaping 0B:
(sync && echo 1 > /proc/sys/vm/drop_caches; if [ "`grep MemFree /proc/meminfo | grep -Eo '[0-9]+'`" -gt "$MIN_MEMORY" ]; then (swapoff -a && swapon -a); fi)

# Flush dentrie и inode (cache) + reswaping 0B:
# (sync && echo 2 > /proc/sys/vm/drop_caches; if [ "`grep MemFree /proc/meminfo | grep -Eo '[0-9]+'`" -gt "$MIN_MEMORY" ]; then (swapoff -a && swapon -a); fi)

# Flush pagecache, dentrie & inode (cache) + reswaping 0B:
# (sync && echo 3 > /proc/sys/vm/drop_caches; if [ "`grep MemFree /proc/meminfo | grep -Eo '[0-9]+'`" -gt "$MIN_MEMORY" ]; then (swapoff -a && swapon -a); fi)
