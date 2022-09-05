# Manual steps

There's some stuff that cannot be automated easily using ansible.

### Install `yay`
Clone the repo: `https://aur.archlinux.org/yay-git.git `
Then `cd yay-git` and `makepkg -si`. I think this doesn't work because it asks for password to install go, so I could try adding it again

```
     - name: Install `yay`
       shell: makepkg -si
       args:
         chdir: /tmp/yay
       become: false
```

### Install `oh-my-zsh`
```
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh install.sh
```

### Install AUR packages
This is error-prone using Ansible because there's a lot of asking for user input.
```
yay -S snapd azure-cli nerd-fonts-noto-sans-mono nerd-fonts-terminus visual-studio-code-bin slack-desktop conky-i3 dia
```
