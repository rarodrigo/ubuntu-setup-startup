sudo apt-get update

echo 'installing xclip'
sudo apt-get install xclip -y

echo 'installing curl' 
sudo apt install curl -y

echo 'installing git' 
sudo apt install git -y

echo 'installing Telegram Desktop' 
sudo apt install telegram-desktop -y

echo 'installing Ansible' 
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible

echo "What name do you want to use in GIT user.name?"
echo "For example, mine will be \"rarodrigo\""
read git_config_user_name
git config --global user.name "$git_config_user_name"
clear 

echo "What email do you want to use in GIT user.email?"
echo "For example, mine will be \"rovere.rodrigo@gmail.com\""
read git_config_user_email
git config --global user.email $git_config_user_email
clear

echo "Generating a SSH Key"
ssh-keygen -t rsa -b 4096 -C $git_config_user_email
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub | xclip -selection clipboard

echo 'installing zsh'
sudo apt-get install zsh -y
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s /bin/zsh

export alias pbcopy='xclip -selection clipboard'
export alias pbpaste='xclip -selection clipboard -o'
source ~/.zshrc

echo 'installing KeepassXC'
sudo add-apt-repository ppa:phoerious/keepassxc
sudo apt install keepassxc -y

echo 'installing code'
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https -y
sudo apt-get update
sudo apt-get install code -y # or code-insiders

echo 'installing extensions'
code --install-extension vscoss.vscode-ansible
code --install-extension samuelcolvin.jinjahtml
code --install-extension fabiospampinato.vscode-diff
code --install-extension ms-azuretools.vscode-docker
code --install-extension grapecity.gc-excelviewer
code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
code --install-extension davidanson.vscode-markdownlint
code --install-extension ms-vscode.notepadplusplus-keybindings
code --install-extension ms-python.python
code --install-extension alefragnani.rtf
code --install-extension vscode-icons-team.vscode-icons
code --install-extension redhat.vscode-yaml
code --install-extension ms-vscode-remote.remote-wsl
code --install-extension hashicorp.terraform

echo 'installing spotify' 
snap install spotify

echo 'installing Postman' 
snap install postman

echo 'installing Rambox' 
snap install rambox

echo 'installing Signal-Desktop' 
snap install signal-desktop

echo 'installing Skype' 
snap install skype

echo 'installing VLC Coder' 
snap install vlc

echo 'installing Authy 2FA' 
snap install authy

echo 'installing Notepadqq' 
snap install notepadqq

echo 'installing Brave Browser'
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
source /etc/os-release
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ $UBUNTU_CODENAME main" | sudo tee /etc/apt/sources.list.d/brave-browser-release-${UBUNTU_CODENAME}.list
sudo apt update
sudo apt install brave-keyring brave-browser

echo 'installing Opera Browser'
sudo sh -c 'wget -O - http://deb.opera.com/archive.key | apt-key add -'
sudo sh -c 'echo "deb http://deb.opera.com/opera-stable/ stable non-free" >> /etc/apt/sources.list.d/opera.list'
sudo apt-get update
sudo apt-get install opera-stable

echo 'installing docker' 
sudo apt-get remove docker docker-engine docker.io
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
docker --version

chmod 777 /var/run/docker.sock
docker run hello-world

echo 'installing docker-compose' 
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

echo 'installing Asbru-CM'
curl -s https://packagecloud.io/install/repositories/asbru-cm/asbru-cm/script.deb.sh | sudo bash
sudo apt install asbru-cm -y

echo 'installing Wireshark'
sudo add-apt-repository ppa:wireshark-dev/stable
sudo apt-get update
sudo apt-get install wireshark -y 
sudo usermod -aG wireshark $(whoami)

echo 'installing Dropbox' 
wget https://linux.dropbox.com/packages/ubuntu/dropbox_1.4.0_amd64.deb
sudo dpkg -i dropbox_1.4.0_amd64.deb

echo 'Make cleaning about installation' 
sudo apt autoremove -y
