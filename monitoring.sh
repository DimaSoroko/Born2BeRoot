{\rtf1\ansi\ansicpg1252\cocoartf1671\cocoasubrtf600
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww17160\viewh12220\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 #!/bin/bash\
echo -n '#Architecture: '; uname -a\
\
echo -n "#CPU physical : "; grep -c processor /proc/cpuinfo\
\
echo -n "#vCPU : "; cat /proc/cpuinfo | grep processor | wc -l\
\
echo -n "#Memory Usage: "; free -m | awk 'NR==2\{printf "%s/%sMB (%.2f%%)\\n", $3,$2,$3*100/$2 \}'\
\
echo -n "#Disk Usage: "; df -h | awk '$NF=="/"\{printf "%d/%dGB (%s)\\n", $3,$2,$5\}'\
\
echo -n "#CPU load: "; mpstat | awk 'NR==4 \{printf "%.2f%%\\n", $6\}'\
\
echo -n "#Last boot: "; who -b | awk '\{printf "%s %s\\n", $3, $4\}'\
\
echo -n "#LVM use: "; if cat /etc/fstab | grep -q "/dev/mapper/"; then echo "yes"; else echo "no"; fi\
\
echo -n "#Connexions TCP : ";  netstat -an | grep ESTABLISHED |  wc -l ;\
\
echo -n "#User log : "; who | wc -l\
\
echo -n "#IP : "; hostname -I\
\
echo -n "#MAC : "; ip link show | awk '$1 == "link/ether" \{print $2\}'\
\
echo -n "#Sudo : "; journalctl -q | grep sudo | grep COMMAND | wc -l}