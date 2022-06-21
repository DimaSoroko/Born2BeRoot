# Born2BeRoot

The 42 project Born2beroot explores the fundamentals of system administration by inviting us to install and configure a virtual machine with VirtualBox.

You can find lots of tutorials how to install and configure your machine, but here I would like to give some examples of the most important questions during the defence of your project and the breif answers to them from my personal notes. Hope it can help you to clerify some points. The following manual is made for 100% project, without bonuses.


When your machine is complitely installed and configured, I advice you to directly make the signature.txt file (**shasum -> born2beroot.vdi**) and then directly zip the whole project folder. Due to undefined behavior of the goinfre folder try to keep the archive of your project on the external hdd or cloud, and unzip it just before the evaluation. 

-----------------------------------------------------------------------------------------------------------------------------------------------------------

**Q** : The interest and basic functioning of the ***Virtual Machine*** ?

**A** : ***Virtual Machine*** is the virtualisation / emulation of a computer system which provides the functionality of a physical computer. It can virtually imitate different system architecture, allowing execution  of software applaications and operating systems written for another CPU or architectures.

**Q** : The difference between ***Aptitude*** and ***Apt*** ?

**A** : ***Aptitude*** and ***Apt*** are popular tools to handle package managment. Both can deal with all king of activities including installation, removal, search and etc... ***Aptitude*** is vaster in performance and integrates functionalities of ***Apt*** and its other variants including ***apt-mark*** and ***apt-cache***.

**Q** : What is ***APPArmor*** ?

**A** :  ***APPArmor*** is an important security module that allows the system administrator to restrict programs's capabilities and lock down the vulnerable processess.

**Q** : How to set password policies?

**A** : First open  ***common-password*** file :  ***sudo nano /etc/pam.d/common-password***, then change following line.


**Q** :

**A** :
