systemctl enable ssh;
systemctl start ssh;
service ssh start;
echo "deb https://http.kali.org/kali kali-rolling main contrib non-free" > /etc/apt/sources.list;
apt-get update && apt-get upgrade;

wget https://dl.google.com/go/go1.14.6.linux-amd64.tar.gz;
sudo tar -xvf go1.14.6.linux-amd64.tar.gz;
sudo mv go /usr/local;
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin

sudo apt-get install python3;
sudo apt-get install python3-pip;
pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U 
sudo apt-get install ruby;
sudo apt-get install screen;
sudo apt-get install git;
sudo apt  install awscli -y;
sudo apt install masscan -y;
mkdir /root/.gf
mkdir /root/Tools;
mkdir /root/Recon;
dir=/root/Tools;

aws s3 sync s3://assetnote-wordlists/data/ $dir/assetnote-wordlists --no-sign-request;
go get github.com/Ice3man543/SubOver;
git clone https://github.com/aboul3la/Sublist3r.git $dir/Sublister;
git clone https://github.com/tomnomnom/gf $dir/gf;
git clone https://github.com/danielmiessler/SecLists.git $dir/seclists;
go get -u github.com/tomnomnom/assetfinder;
go get -u github.com/tomnomnom/fff;
go get github.com/tomnomnom/hacks/filter-resolved;
go get github.com/tomnomnom/hacks/waybackurls;
go get -u -v github.com/lukasikic/subzy;
go install -v github.com/lukasikic/subzy;
pip install requests;
GO111MODULE=on go get -u -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei;
git clone https://github.com/projectdiscovery/nuclei-templates $dir/nuclei-templates;
go get github.com/eth0izzle/shhgit;
GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/cmd/subfinder;
GO111MODULE=on go get -u -v github.com/hahwul/dalfox;
go get github.com/ffuf/ffuf;
GO111MODULE=on go get -u -v github.com/lc/gau;
go get -u github.com/tomnomnom/gf;
cp -r /usr/local/go/src/github.com/tomnomnom/gf/examples ~/.gf/;
go get github.com/subfinder/goaltdns;
go get github.com/003random/getJS;
go get -u github.com/jaeles-project/gospider;
GO111MODULE=on go get -u -v github.com/projectdiscovery/httpx/cmd/httpx;
git clone https://github.com/s0md3v/Arjun $dir/Arjun;
git clone https://github.com/pwn0sec/PwnXSS $dir/PwnXSS;
git clone https://github.com/hahwul/XSpear $dir/XSpear;
git clone https://github.com/m4ll0k/SecretFinder $dir/SecretFinder;
git clone https://github.com/s0md3v/Striker $dir/Striker;
git clone https://github.com/devanshbatham/ParamSpider $dir/ParamSpider;
git clone https://github.com/s0md3v/XSStrike $dir/XSStrike;
GO111MODULE=on go get -u -v github.com/projectdiscovery/dnsprobe;
git clone https://github.com/maurosoria/dirsearch $dir/dirsearch;
git clone https://github.com/dwisiswant0/apkleaks $dir/apkleaks;
git clone https://github.com/defparam/smuggler $dir/smuggler;
GO111MODULE=on go get -u -v github.com/projectdiscovery/shuffledns/cmd/shuffledns;
GO111MODULE=on go get -u -v github.com/projectdiscovery/dnsx/cmd/dnsx
GO111MODULE=on go get -u -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder

git clone https://github.com/p4pentest/crtsh $dir/crtsh;
git clone https://github.com/secdec/xssmap $dir/xssmap;
git clone https://github.com/rastating/wordpress-exploit-framework $dir/wordpress-exploit-framework;
git clone https://github.com/1ndianl33t/Gf-Patterns;
mv /root/Gf-Patterns/*.json /root/.gf/;
rm -rf /root/Gf-Patterns;
wget https://raw.githubusercontent.com/devanshbatham/ParamSpider/master/gf_profiles/potential.json;
mv /root/potential.json /root/.gf/;
echo 'source /usr/local/go/src/github.com/tomnomnom/gf/gf-completion.bash' >> ~/.bashrc;

git clone https://github.com/blechschmidt/massdns.git $dir/masscan
make -C $dir/masscan

cp $dir/masscan /bin


echo "
alias sublister=/root/Tools/Sublist3r/sublist3r.py
alias assetfinder=/root/go/bin/./assetfinder
alias dalfox=/root/go/bin/./dalfox
alias ffuf=/root/go/bin/./ffuf
alias gau=/root/go/bin/./gau
alias gf=/root/go/bin/./gf
alias httpx=/root/go/bin/./httpx
alias secretfinder='python3 /root/Tools/SecretFinder/SecretFinder.py'
alias dirsearch='python3 /root/Tools/dirsearch/dirsearch.py -e php,asp,js,aspx,jsp,py,txt,conf,config,bak,backup,swp,old,db,sql -t 300 -u'
alias ip='ifconfig | grep 192'
alias kalifullupdate='sudo apt update && sudo apt full-upgrade -y'
alias profile='nano ~/.bash_profile'
alias sprofile='source ~/.bash_profile'
" >> /root/.bash_profile;

echo "Configure subfinder /root/.config/subfinder/config.yaml"
echo "Add source ~/.bash_profile in .bashrc file"

source /root/.bash_profile
