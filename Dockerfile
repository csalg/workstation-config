# sshd on archlinux
FROM	 archlinux:latest

# Update the repositories
RUN	 pacman -Syy

# Install openssh
RUN	 pacman -S --noconfirm openssh

# Generate host keys
RUN  /usr/bin/ssh-keygen -A

# Add password to root user
RUN	 echo 'root:roottoor' | chpasswd

# Fix sshd
RUN  sed -i -e 's/^UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config
RUN  sed -i -e 's/^#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config

# Expose tcp port
EXPOSE	 22

# Run openssh daemon
CMD	 ["/usr/sbin/sshd", "-D"]
