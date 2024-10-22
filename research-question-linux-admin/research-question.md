# BASIC CONCEPT
## 1. What are the key differences between Linux and other operating systems like Windows and macOS?

The key differences between Linux, Windows, and macOS are:
* Kernel: Linux uses an open-source kernel, while Windows and macOS use proprietary kernels.
* Customization: Linux offers more customization and control, while Windows and macOS are more restrictive.
* Software: Linux primarily uses free, open-source software, while Windows and macOS have a mix of proprietary and open-source options.
* Security: Linux is generally considered more secure due to its open-source nature and fewer targeted attacks compared to Windows.
* User Interface: Windows and macOS have more user-friendly, polished interfaces, while Linux interfaces vary depending on the distribution and desktop environment.
* Licensing: Linux is free and open-source, whereas Windows and macOS require paid licenses.

## 2. Describe the Linux file system hierarchy. What are the purposes of directories like /bin, /etc, and /home?

The Linux file system hierarchy is structured in a tree-like format, with the root directory / at the top. Key directories include:

* /bin: Contains essential user command binaries (programs) like ls, cp, and cat that are needed for basic system functionality.
* /etc: Stores configuration files for the system and installed services, such as network settings and application configs.
* /home: Contains user-specific directories where personal files and user configurations are stored (e.g., /home/username for each user).

## 3. Explain the concept of a Linux distribution. Name at least three popular Linux distributions and their primary uses.
A Linux distribution is a version of the Linux operating system that includes the Linux kernel, system utilities, applications, and package management tailored for specific needs. Each distribution may offer different features, software choices, and user interfaces.

Three popular Linux distributions:

* Ubuntu: User-friendly, great for beginners, and widely used for desktops, servers, and development.
* CentOS: Stable and secure, commonly used in enterprise environments for servers.
* Arch Linux: Lightweight and highly customizable, preferred by advanced users who want full control over their system configuration.

# USER AND FILE MANAGEMENT
## 1. How do you create and manage users and groups in Linux? Provide commands for adding, deleting, and modifying users.

In Linux, you can create, delete, and manage users and groups using specific commands:

### <u>Add a User:</u>

Command: **sudo useradd username**
Create a home directory: **sudo useradd -m username**
Set a password: **sudo passwd username**

### <u>Delete a User:</u>

Command: **sudo userdel username**
Delete user and their home directory: **sudo userdel -r username**

### <u>Modify a User:</u>

Lock a user account: **sudo usermod -L username**
Unlock a user account: **sudo usermod -U username**

### <u>Create a Group:</u>

Command: **sudo groupadd groupname**

### <u>Add a User to a Group:</u>

Command: **sudo usermod -aG groupname username**

### <u>Delete a Group:</u>

Command: **sudo groupdel groupname**

### 2. What are file permissions in Linux? Explain the meaning of rwx and how to change permissions using chmod.

In Linux, file permissions determine who can read, write, or execute a file. Permissions are set for three categories: the owner, the group, and others.

The permissions are represented as:

* r (read): Allows viewing the file's contents.
* w (write): Allows modifying the file.
* x (execute): Allows running the file as a program or script.

For example, rwx means full permissions (read, write, and execute), and rw- means read and write but no execute permission.

Changing permission with **chmod**

#### Numerical Method: Permissions are represented by numbers:

  * r = 4, w = 2, x = 1.
* Combine them for different permission sets (e.g., rwx = 7, rw- = 6).

Example: **chmod 755 filename** gives the owner full permissions (7 = rwx) and group/others read and execute (5 = r-x).

#### Symbolic Method:

* u = user (owner), g = group, o = others, a = all.
* + adds permissions, - removes permissions, and = sets exact permissions.
Example: **chmod u+x filename** adds execute permission for the owner.

## 3. How can you manage file ownership and groups using chown and chgrp commands?
In Linux, you can manage file ownership and group associations using the chown and chgrp commands.

### chown (Change Ownership):

<u>Change the owner of a file or directory:</u>

Command: **sudo chown new_owner filename**
Example: **sudo chown alice file.txt** changes the owner of file.txt to user alice.

<u>Change both owner and group:</u>

Command: **sudo chown new_owner:new_group filename**
Example: **sudo chown alice:devs file.txt** changes the owner to alice and group to devs.

<u>Recursively change ownership for all files in a directory:</u>

Command: **sudo chown -R new_owner directory**

### chgrp (Change Group):
<u>Change the group of a file or directory:</u>

Command: **sudo chgrp new_group filename**
Example: **sudo chgrp devs file.txt** changes the group of file.txt to devs.

Both commands can help control file access by assigning appropriate owners and groups.

# SYSTEM ADMINISTRATION
## 1. What are system services and daemons in Linux? How do you manage them using systemctl?

In Linux, **system services** and **daemons** are background processes that handle tasks like networking, logging, or scheduling. Daemons often start at boot and run without user interaction (e.g., sshd, cron).

You manage them using **systemctl**:

*  <u>Start a service:</u>  **sudo systemctl start service_name**
- <u>Stop a service</u>: **sudo systemctl stop service_name**
- <u>Restart a service</u>: **sudo systemctl restart service_name**
- <u>Enable/Disable a service</u>: **sudo systemctl enable/disable service_name**
- <u>Check service status</u>: **systemctl status service_name**

## 2. Explain how to schedule tasks in Linux using cron and at.
In Linux, you can schedule tasks with cron and at:

* cron: Used for recurring tasks. You define commands in the crontab file that run at specified intervals (e.g., daily, weekly). For example, **0 5 * * * /path/to/script** will run the script every day at 5 AM.

* at: Schedules one-time tasks to run at a specific time. For example, **echo "/path/to/script" | at 5pm** schedules a script to run at 5 PM once.

These tools automate task execution at specific times or intervals.

## 3. What is the purpose of the /etc/fstab file? How do you mount and unmount file systems?

The /etc/fstab file in Linux defines how file systems (like disks or partitions) are automatically mounted at boot. It lists the devices and their mount points, along with options like read/write permissions.

* Mounting a File System:
Command: **sudo mount /dev/device_name /mount/point**
* Unmounting a File System:
Command: **sudo umount /mount/point**

This allows managing file systems and storage devices.

# NETWORKING
## 1. Describe the basic networking commands in Linux such as ifconfig, ip, ping, netstat, and ss.

Here are basic networking commands in Linux:

* ifconfig: Displays or configures network interfaces (deprecated, replaced by **ip**).
* ip: A modern tool to configure and display network interfaces, routes, and IP addresses (e.g., **ip addr show**).
* ping: Sends ICMP echo requests to test connectivity between systems (e.g., **ping google.com**).
* nnetstat: Displays network connections, routing tables, and interface statistics (mostly replaced by **ss**).
* ss: A faster alternative to netstat for displaying socket statistics and network connections.

These commands are essential for monitoring and managing network configurations.

## 2. How do you configure a static IP address in Linux?
Firewalls in Linux control incoming and outgoing network traffic to enhance security.

Using iptables:
iptables is a command-line tool to configure firewall rules.
* Example: **sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT** allows SSH traffic.
* Save rules: **sudo iptables-save > /etc/iptables/rules.v4.**
Using firewalld:

firewalld provides a dynamic, easier-to-manage firewall.
* Allow service: **sudo firewall-cmd --add-service=ssh --permanent**
* Reload rules: **sudo firewall-cmd --reload**

Both tools are used to manage network security by defining which traffic is allowed or blocked.

#  PACKAGE MANAGEMENT
## 1. What are package managers in Linux? Compare apt, yum, and dnf.
Package managers in Linux are tools that automate the installation, updating, and removal of software.

* apt (Advanced Package Tool): Used in Debian-based systems (like Ubuntu). It manages .deb packages.
Command: **sudo apt install package_name**
* yum: Used in CentOS/RHEL 7 and earlier. It manages .rpm packages but is slower compared to dnf.

  Command: **sudo yum install package_name**

* dnf: The next-generation package manager for CentOS/RHEL 8 and Fedora, replacing yum. It has improved performance and dependency resolution.

  Command: **sudo dnf install package_name**

These tools streamline software management in different Linux distributions.

## 2. How do you install, update, and remove packages using a package manager?
Using a package manager in Linux, you can:

<u>Install a package</u>:

apt: **sudo apt install package_name**

yum/dnf: **sudo yum install package_name** or **sudo dnf install package_name**

<u>Update all packages</u>:

apt: **sudo apt update && sudo apt upgrade**
yum/dnf: **sudo yum update** or **sudo dnf update**

<u>Remove a package</u>:

apt: **sudo apt remove package_name**
yum/dnf: **sudo yum remove package_name** or **sudo dnf remove package_name**

These commands handle software installation, updates, and removal.

# MONITORING AND PERFORMANCE
## 1. What tools are available in Linux for monitoring system performance? Describe the use of top, htop, vmstat, and iostat.

In Linux, several tools are available for monitoring system performance:

* top: Displays real-time information about processes, CPU, memory usage, and system load.
* htop: An enhanced, interactive version of top with a user-friendly interface for monitoring processes, CPU, and memory.
* vmstat: Reports on system processes, memory, paging, block I/O, and CPU usage in real-time.
* iostat: Monitors CPU and disk I/O statistics to help analyze system input/output performance.

These tools help in tracking and diagnosing system performance issues.

## 2. How do you check disk usage and availability using commands like df and du?

In Linux, you can check disk usage and availability with:

* df: Displays disk space usage of file systems.

  Example: **df -h** shows disk usage in a human-readable format.
* du: Shows disk usage of files and directories.

  Example: **du -sh /path/to/directory** gives the total size of a directory in a human-readable format.

These commands help monitor available and used disk space.

# SECURITY
## 1. Explain the concept of SSH. How do you set up an SSH server and client in Linux?

SSH (Secure Shell) is a protocol for securely accessing and managing remote systems over a network.

<u>To set up an SSH server</u>:

Install SSH server:
* For Ubuntu/Debian: **sudo apt install openssh-server**
* For CentOS/RHEL: **sudo yum install openssh-server**

<u>Start the SSH service</u>:

* **sudo systemctl start ssh** (Ubuntu/Debian)
* **sudo systemctl start sshd** (CentOS/RHEL)

<u>Enable it on boot</u>:

* **sudo systemctl enable ssh** or **sudo systemctl enable sshd**

<u>To set up an SSH client</u>:

* SSH is usually pre-installed. To connect to a remote server:
  * **ssh username@remote_ip_address**

This allows secure remote access between Linux systems.

## 2. What are SELinux and AppArmor? How do they enhance security in a Linux system?

SELinux (Security-Enhanced Linux) and AppArmor are Linux security modules that enforce access control policies to enhance system security.

* <u>SELinux</u>: Uses mandatory access controls (MAC) to strictly define what resources (files, processes, etc.) each user, program, or service can access. It operates in enforcing, permissive, or disabled modes.

* <u>AppArmor</u>: Uses profile-based access control to restrict program capabilities based on assigned policies. It's simpler and more flexible compared to SELinux but provides similar protections.

Both tools help prevent unauthorized access by confining applications and users to predefined security rules.

# BACKUP AND RECOVERY
## 1. How do you perform backups in Linux? Describe the use of tools like rsync, tar, and dd.

In Linux, backups can be performed using the following tools:

* <u>rsync</u>: Efficiently synchronizes files and directories between locations, locally or remotely.

  * Example: rsync -av /source/ /backup/ copies and syncs /source/ to /backup/.

* tar: Archives files into a compressed format (e.g., .tar.gz).

  * Example: tar -czvf backup.tar.gz /directory/ creates a compressed archive of /directory/.

* dd: Copies and clones entire disks or partitions at a low level.

  * Example: dd if=/dev/sda of=/backup/sda.img creates an image of the /dev/sda disk.

These tools help in creating backups of files, directories, or entire systems.

## 2. What are some strategies for system recovery in case of a failure?

In case of a system failure, some common recovery strategies include:

* Boot from a Live CD/USB: Use a Linux live environment to access and repair the system.
* Restore from Backups: Use backups made with tools like rsync, tar, or dd to restore files or entire systems.
* Repair Bootloader: Use grub or systemd-boot repair commands if the bootloader is corrupted.
* Check Disk and Filesystem: Run fsck to check and repair corrupted file systems.
* Reinstall or Repair Packages: Use package managers to reinstall broken or missing system packages.

These strategies help recover from various system failures.