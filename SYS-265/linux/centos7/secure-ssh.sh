#secure-ssh.sh
#author Bobleoble
#creates a new ssh user using the $1 parameter
#adds a public key from the local repo or curled from the remote repo
#removes roots ability to ssh in

sudo useradd -m -d /home/$1 -s /bin/bash $1
sudo mkdir -p /home/$1/.ssh
sudo wget -O /home/$1/.ssh/authorized_keys https://raw.githubusercontent.com/Bobleoble/tech-journal/master/SYS-265/linux/public-keys/id_rsa.pub

sudo chmod 700 /home/$1/.ssh
sudo chmod 600 /home/$1/.ssh/authorized_keys
sudo chown -R $1:$1 /home/$1/.ssh
sudo sed -i 's/PermitRootLogon yes/PermitRootLogon no/g' /etc/ssh/sshd_config
