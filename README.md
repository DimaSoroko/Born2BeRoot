# Born2BeRoot

The 42 project Born2beroot explores the fundamentals of system administration by inviting us to install and configure a virtual machine with VirtualBox.

You can find lots of tutorials how to install and configure your machine, but here I would like to give some examples of the most important questions during the defence of your project and the breif answers to them from my personal notes. Hope it can help you to clerify some points. The following manual is made for 100% project, without bonuses.

When your machine is complitely installed and configured, I advice you to directly make the signature.txt file (*shasum -> born2beroot.vdi*) and then directly zip the whole project folder. Due to undefined behavior of the *goinfre* folder try to keep the archive of your project on the external hdd or cloud, and unzip it just before the evaluation. 

--------------------------------------------------------------------------------------------------------------------------------------------------------
Virtual Machine
--------------------------------------------------------------------------------------------------------------------------------------------------------
**Q : The interest and basic functioning of the *Virtual Machine* ?**

**A** : *Virtual Machine* is the virtualisation / emulation of a computer system which provides the functionality of a physical computer. It can virtually imitate different system architecture, allowing execution  of software applaications and operating systems written for another CPU or architectures.

**Q : The difference between *Aptitude* and *Apt* ?**

**A** : *Aptitude* and *Apt* are popular tools to handle package managment. Both can deal with all king of activities including installation, removal, search and etc... *Aptitude* is vaster in performance and integrates functionalities of *Apt* and its other variants including *apt-mark* and *apt-cache*.

**Q : What is *APPArmor* ?**

**A** :  *APPArmor* is an important security module that allows the system administrator to restrict programs's capabilities and lock down the vulnerable processess.

**Q : How to check operating system ?**

**A** : *hostnamectl*

--------------------------------------------------------------------------------------------------------------------------------------------------------
Password Policies and Expiration
--------------------------------------------------------------------------------------------------------------------------------------------------------
**Q : How to set password policies and expiration?**

**A** : ***First step*** : change password protection policies. 
Open  *common-password* file :  *sudo nano /etc/pam.d/common-password*, and then add these values into the line:

```password    requisite         pam_pwquality.so retry=3 lcredit =-1 ucredit=-1 dcredit=-1 maxrepeat=3 usercheck=-1 difok=7 enforce_for_root```

Password must containt at least one lowercase : ```lcredit =-1```

Password must containt at least one upperrcase : ```ucredit =-1```

Maximum repeat of the same character : ```maxrepeat=3```

Check if the password contains the user name in some form : ```usercheck=-1``` *(value should not be zero)*

The minimum number of characters that must be different from the old password : ```difok=7```

Same policy for root users : ```enforce_for_root```

***Second Step*** : set the password expiration policy (for new user only).
Open *login.defs* file : ```sudo nano /etc/login.defs```

Scroll down till the following lines :
```
PASS_MAX_DAYS 9999

PASS_MIN_DAYS 0

PASS_WARN_AGE 7
```
And change the values to :
```
PASS_MAX_DAYS 30

PASS_MIN_DAYS 2

PASS_WARN_AGE 7
```
*!!! Rememeber by doing this step, you will only change the password expiration policy for the new user. To change it for the original user and for the root follow the next step.*

***Third Step*** : set password expiration policy for the original user and the root.

To check the password expiration policy, simply use the command ***chage -l (username)***. You will notice that all the values are still the same.

To change *PASS_MAX_DAYS* from *9999* to *30* (as asked in the subject) : ```sudo chage -m 30 (user name)```

To change *PASS_MIN_DAYS* from *0* to *2* (as asked in the subject) : ```sudo chage -M 2 (user name)```

Now you can do the same for the root.

**Q : How to change password for any user ?**

**A** : ```sudo passwd (user name)```

--------------------------------------------------------------------------------------------------------------------------------------------------------
UFW
--------------------------------------------------------------------------------------------------------------------------------------------------------
**Q : What is UFW ?**

**A** : *UFW (Uncomplicated Firewall)* is a network security device that monitors incoming and out going network traffic and permits to block date packets based on a set of security rules.

**Q : How to check  *UFW* status/see all the rules/ports ?**

**A** : ```sudo ufw status```

**Q : How to add new port/rule ?**

**A** : ```sudo ufw allow (port number)``` 

**Q : How to delete port/rule** 

**A** : ```sudo ufw delete allow (port number)```

--------------------------------------------------------------------------------------------------------------------------------------------------------
SSH
--------------------------------------------------------------------------------------------------------------------------------------------------------
**Q : What is SSH ?**

**A** : *SSH (Secure Shell or Secure Socket Shell)* is a network protocol that gives system administrator  a secure way to access a computer over an unsecured network. 

**Q : How to check SSH status**

**A** : ```sudo systemctl status ssh```

**Q : How to connect throught *SSH* ?**

**A** : Open *iTerm (or any other terminal)* and type *ssh username@127.0.0.1 -p (port number)* , for the defence *port number* will be *4242*

**Q : How to restart *SSH* ?**

**A** : ```sudo service ssh restart```

--------------------------------------------------------------------------------------------------------------------------------------------------------
Users and Groups
--------------------------------------------------------------------------------------------------------------------------------------------------------

**Q : How to check if original user was added to *user42* and *sudo* groups ?**

**A** : ```getent group user42/sudo```

**Q : How to create a new user ?**

**A** : ```sudo adduser (new user name)```

**Q : How to create a new group ?**

**A** : ```sudo groupadd (new group name)```

**Q : How to assign a user to the group ?**

**A** : ```sudo usermod -aG (group name) (user name)```

**Q : How to delete a user ?**

**A** : ```sudo userdel -r (user name)```

**Q : How to delete a group ?**

**A** : ```sudo groupdel -r (group name)```

--------------------------------------------------------------------------------------------------------------------------------------------------------
Hostname
--------------------------------------------------------------------------------------------------------------------------------------------------------
**Q : How to change the host name ?**

**A** : This should be done in 2 steps.

First type : ```sudo hostnamectl set-hostname (new host name)```. Then open *hosts* file : ```sudo nano /etc/host``` and change the hostname by simply replacing the line with the hostname. Reboot to apply changes : ```sudo reboot```

--------------------------------------------------------------------------------------------------------------------------------------------------------
Partitions
--------------------------------------------------------------------------------------------------------------------------------------------------------
**Q : What is LVM ?**

**A** : *LVM (Logical Volume Managment)* is a form of storage virtualization that allows a very flexible disk space management. *LVM* provides a hifg level view of the disk storage then the traditional view of the disk and partiotions and gives the system administrator much more flexibility in allocating storage to applications and users.

**Q : How to check the partitions of the virtual machine ?**

**A** : ```lsblk```

--------------------------------------------------------------------------------------------------------------------------------------------------------
Sudo
--------------------------------------------------------------------------------------------------------------------------------------------------------
**Q : What is Sudo ?**

**A** : *Sudo (Substitute User and Do)* is a programm that enables users to run programs with the security priviliges of the superuser or any other users.

**Q : How to check sudo status ?**

**A** : ```dpkg -l | grep sudo```

**Q : How to give or remove *sudo* for a user ?**

**A** : ```su - (user name)```

**Q : Where is *sudo.log* is located ?**

**A** : ```cd /var/log/sudo/```

--------------------------------------------------------------------------------------------------------------------------------------------------------
Script and Crontab
--------------------------------------------------------------------------------------------------------------------------------------------------------
**Q : Where is *monitoring.sh* is located**

**A** : ```cd /usr/local/bin/```

**Q : What is crontab ?**

**A** : *Crontab* is a long running process taht executes commands at specific dates and time.

**Q : How to configurate crontab file ?**

**A** : Open crontab file : *crontab -e* , and add the following line at the end of the file :

```*/10 * * * * /usr/local/bin/monitoring.sh | wall```

**Q : How to change cron time to 1 minute ?**

**A** : change *10* to *1* :

```*/1 * * * * /usr/local/bin/monitoring.sh | wall```

**Q : How to stop crontab showing script ?**

**A** : add *#* sign in front of the line :

```#*/10 * * * * /usr/local/bin/monitoring.sh | wall```

--------------------------------------------------------------------------------------------------------------------------------------------------------
Script Example
--------------------------------------------------------------------------------------------------------------------------------------------------------

*Here is an example of the script which was perfectly functional for me:*

```
#!/bin/bash

echo -n '#Architecture: '; uname -a

echo -n "#CPU physical : "; grep -c processor /proc/cpuinfo

echo -n "#vCPU : "; cat /proc/cpuinfo | grep processor | wc -l

echo -n "#Memory Usage: "; free -m | awk 'NR==2{printf "%s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'

echo -n "#Disk Usage: "; df -h | awk '$NF=="/"{printf "%d/%dGB (%s)\n", $3,$2,$5}'

echo -n "#CPU load: "; mpstat | awk 'NR==4 {printf "%.2f%%\n", $6}'

echo -n "#Last boot: "; who -b | awk '{printf "%s %s\n", $3, $4}'

echo -n "#LVM use: "; if cat /etc/fstab | grep -q "/dev/mapper/"; then echo "yes"; else echo "no"; fi

echo -n "#Connexions TCP : ";  netstat -an | grep ESTABLISHED |  wc -l ;

echo -n "#User log : "; who | wc -l

echo -n "#IP : "; hostname -I

echo -n "#MAC : "; ip link show | awk '$1 == "link/ether" {print $2}'

echo -n "#Sudo : "; journalctl -q | grep sudo | grep COMMAND | wc -l
```
--------------------------------------------------------------------------------------------------------------------------------------------------------
                      
                                                        

