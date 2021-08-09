
# GOLIAD
### Author: Jonathan Scott  @jonathandata1
![GOLIAD - VPN Service For All](https://i.postimg.cc/Mp3SCmXJ/goliad-vpn.jpg)
### CURRENT VERSION 1.0 - SUPER BETA
> OpenVPN Client that dynamically pulls the latest regional, secure, & most reliable .ovpn configuration files for instant connections without the hassle of searching for a source.

- No Logging
- No Tracing
- No Advertisments
- No Bloatware
- Scrict .ovpn security protocols
- Sourcing comes from Universities, and other OpenVPN supporters around the world
- 100% FREE To Use ALWAYS!
- Goliad NEVER BINDS helping keep your host data secure
- No Configurations Needed
- No Complicated Setup
- 100% customizable for added security, certificates, and more
- Run Goliad and you're now connected

### HOW TO USE
#### Step 1.
	option #1 git clone https://github.com/jonathandata1/Goliad.git
	option #2 download this zip file https://github.com/jonathandata1/Goliad/archive/refs/heads/master.zip
#### Step 2.
	If you chose option #1 cd Goliad
	If you chose option #2 unzip master.zip and open the folder Goliad
#### Step 3.
	Open a terminal run
	If you chose option #1 & #2
	In the terminal type ./goliad.sh
### I will make a video for those that don't have a lot of experience in a terminal
#### Step 4. 
	In the Goliad software press option #1 Connect To VPN
	You will be asked to drag and drop a .ovpn file into the terminal
	Open the Goliad folder and you will see a directory named CONNECTIONS
	Choose any of the files and drag it into your terminal
		This will be a lot cleaner in the next version, if you are reading the code you will see I commented out a lot of dynamic code, but I really wanted to get this out to everyone.
	Once you have done this, then press enter
	You will now be connected to a VPN!
	To check what country you are connected to in your terminal
	curl ipinfo.io 
The .ovpn sources are already download for you because some people's connections may be really slow and this process will take a while

## Sources of Servers (This will happen, I just ran into some blocks when pulling data...oops!)
> The configurations are pulled from vpngate.com mirrors that are updated daily. The .ovpn configurations are pulled from vpngate.com mirrors as to not cause disturbance to vpngate's main servers meant for general single use connections. I actually am not sure if the mirrors are supposed to be used this way, but...it seems like a more respectful way to go. :)

## Dependencies

> ### Openvpn
> #### MacOS
> ##### Make sure you have Homebrew installed first
> **1.** `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

> **2.** `brew install openvpn`

> #### Linux 
> **Option 1:** `brew install openvpn (if you have Homebrew installed)`

> **Option 2:** `sudo apt install openvpn`

> **Option 3:** `sudo yum install -y openvpn`

> ### Peco (Not Needed For Version 1.0 - Beta But Will Be Need In The Future)
> #### MacOS
> **1.** `brew install peco`


> #### Linux

> **Option 1:** `brew install peco (if you have Homebrew installed)`

> **Option 2:** `sudo apt install peco`

> **Option 3:** `go get github.com/peco/peco/cmd/peco`

> ### Lynx
> #### MacOS
> **1.** `brew install lynx`


> #### Linux

> **Option 1:** `brew install lynx (if you have Homebrew installed)`

> **Option 2:** `sudo apt install lynx`

> **Option 3:** `yum install lynx`