# Born2BeRoot

The 42 project Born2beroot explores the fundamentals of system administration by inviting us to install and configure a virtual machine with VirtualBox.

You can find lots of tutorials how to install and configure your machine, but here I would like to give some examples of the most important questions during the defence of your project and the breif answers to them from my personal notes. Hope it can help you to clerify some points. The following manual is made for 100% project, without bonuses.


When your machine is complitely installed and configured, I advice you to directly make the signature.txt file (**shasum -> born2beroot.vdi**) and then directly zip the whole project folder. Due to undefined behavior of the goinfre folder try to keep the archive of your project on the external hdd or cloud, and unzip it just before the evaluation. 

-----------------------------------------------------------------------------------------------------------------------------------------------------------

**Q : The interest and basic functioning of the ***Virtual Machine*** ?**

**A** : ***Virtual Machine*** is the virtualisation / emulation of a computer system which provides the functionality of a physical computer. It can virtually imitate different system architecture, allowing execution  of software applaications and operating systems written for another CPU or architectures.

**Q : The difference between ***Aptitude*** and ***Apt*** ?**

**A** : ***Aptitude*** and ***Apt*** are popular tools to handle package managment. Both can deal with all king of activities including installation, removal, search and etc... ***Aptitude*** is vaster in performance and integrates functionalities of ***Apt*** and its other variants including ***apt-mark*** and ***apt-cache***.

**Q : What is ***APPArmor*** ?**

**A** :  ***APPArmor*** is an important security module that allows the system administrator to restrict programs's capabilities and lock down the vulnerable processess.

**Q : How to set password policies and expiration?**

**A** : ***First step*** : change password protection policies. 
Open  ***common-password*** file :  ***sudo nano /etc/pam.d/common-password***, and then add these values into the line:

***password    requisite         pam_pwquality.so retry=3 lcredit =-1 ucredit=-1 dcredit=-1 maxrepeat=3 usercheck=-1 difok=7 enforce_for_root***

Password must containt at least one lowercase : ***lcredit =-1***

Password must containt at least one upperrcase : ***ucredit =-1***

Maximum repeat of the same character : ***maxrepeat=3***

Check if the password contains the user name in some form : ***usercheck=-1 (value should not be zero)*** 

The minimum number of characters that must be different from the old password : ***difok=7***

Same policy for root users : ***enforce_for_root***

***Second Step*** : set the password expiration policy (for new user only).
Open ***login.defs*** file : ***sudo nano /etc/login.defs***

Scroll down till the following lines :

PASS_MAX_DAYS 9999

PASS_MIN_DAYS 0

PASS_WARN_AGE 7

And change the values to :

PASS_MAX_DAYS 30

PASS_MIN_DAYS 2

PASS_WARN_AGE 7

***!!! Rememeber by doing this step, you will only change the password expiration policy for the new user. To change it for the original user and the root follow the next step***

***Third Step*** : set password expiration policy for the original user and the root.

To check the password expiration policy, simply use the command ***chage -l (username)***. You will notice that all the values are still the same.

To change ***PASS_MAX_DAYS*** from ***9999*** to ***30*** (as asked in the subject) : ***sudo chage -m 30 (username)***

To change ***PASS_MIN_DAYS*** from ***0*** to ***2*** (as asked in the subject) : ***sudo chage -M 2 (username)***

Now you can do the same for the root.

**Q : How to change password for any user ?**

**A** : *sudo passwd (username)*

**Q : What is UFW ?**

**A** : ***UFW (Uncomplicated Firewall)*** is a network security device that monitors incoming and out going network traffic and permits to block date packets based on a set of security rules.

**Q : How to check  *UFW* status/see all the rules/ports ?**

**A** : *sudo ufw status*

**Q : How to add new port/rule ?**

**A** : *sudo ufw allow (port number) 

**Q : How to delete port/rule** 

**A** : *sudo ufw delete allow (port number)*

**Q : What is SSH ?**

**A** : *SSH (Secure Shell or Secure Socket Shell)* is a network protocol that gives system administrator  a secure way to access a computer over an unsecured network. 

**Q : How to check SSH status**

**A** : *sudo systemctl status ssh*

**Q : How to connect throw *SSH* ?**

**A** : Open *iTerm (or any other terminal)* and type *ssh username@127.0.0.1 -p (port number)* , for the defence *port number* will be *4242*

**Q : How to check operating system ?**

**A** : *hostnamectl*

**Q : How to check if original user was added to *user42* and *sudo* groups ?**

**A** : *getent group user42/sudo*

**Q : How to create a new user ?**

**A** : *sudo adduser (new user name)*

**Q : How to create a new group ?**

**A** : *sudo groupadd (new group name)*

**Q : How to assign a user to the group ?**

**A** : *sudo usermod -aG (group name) (user name)*

**Q : **

**A** :

