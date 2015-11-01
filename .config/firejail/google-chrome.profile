noblacklist /opt/google
noblacklist /run/resolvconf
noblacklist /run/user
blacklist /boot
blacklist /cdrom
blacklist /lost+found
blacklist /media
blacklist /mnt
blacklist /opt/*
blacklist /proc
blacklist /run/*
blacklist /sbin
blacklist /srv
blacklist /sys
blacklist /usr/sbin
blacklist /var
private-dev
private-etc alternatives,chromium-browser,fonts,hosts,localtime,nsswitch.conf,resolv.conf
read-only /bin
read-only /lib
read-only /lib64
read-only /usr
tmpfs /tmp
caps.drop all
seccomp
netfilter
noroot
