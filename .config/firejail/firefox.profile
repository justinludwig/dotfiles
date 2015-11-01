noblacklist /run/dbus
noblacklist /run/resolvconf
noblacklist /run/user
noblacklist /var/cache/hald
noblacklist /var/run
blacklist /boot
blacklist /cdrom
blacklist /lost+found
blacklist /media
blacklist /mnt
blacklist /opt
blacklist /proc
blacklist /run/*
blacklist /sbin
blacklist /srv
blacklist /sys
blacklist /usr/sbin
blacklist /var/*
private-dev
private-etc alternatives,firefox,fonts,hosts,localtime,nsswitch.conf,resolv.conf
read-only /bin
read-only /lib
read-only /lib64
read-only /usr
tmpfs /tmp
caps.drop all
seccomp
netfilter
noroot
