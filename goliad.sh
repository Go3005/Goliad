#! /bin/bash

# ---------------------------------------------------------------------------------------------
#  Goliad OpenVPN Client
#  Creation Date: 08/08/2021
#
#  Description: OpenVPN client that pulls the most available and trust .ovpn configurations
#  The configurations are pulled from vpngate.com mirrors that are updated daily
#  The .ovpn configurations are pulled from vpngate.com mirrors as to not cause disturbance to
#  vpngate's main servers meant for general single use connections
#  I actually am not sure if the mirrors are supposed to be used this way, but...it seems like a more respectful way to go.
#
#  Author: Jonathan Scott
#
# ---------------------------------------------------------------------------------------------
# Dependencies List
# ---------------------------------------------------------------------------------------------
# Openvpn
# Peco
#
# MacOS
# Make sure you have Homebrew installed first
# 1. /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# 2. brew install openvpn
# 3. brew install peco
# Linux
# Option 1: brew install openvpn (if you have Homebrew installed)
#
# Option 2: sudo apt install openvpn
#
# Option 3: sudo yum install -y openvpn
#
# Peco
# MacOS
# brew install peco
#
# Linux
# Option 1: brew install peco (if you have Homebrew installed)
# Option 2: sudo apt install peco
# Option 3: go get github.com/peco/peco/cmd/peco

# ---------------------------------------------------------------------------------------------
# ADDING SOME COLOR  & EASY FORMATTING TO THE TERMINAL OUTPUT
# ---------------------------------------------------------------------------------------------


    RED='\033[0;31m'
    PURPLE='\033[0;35m'
    YELLOW='\033[1;33m'
    ORANGE='\033[0;33m'
    CYAN='\033[1;36m'
    NC='\033[0m' # No Color

    # FUNCTION TO ADD 1 BLANK ROW JUST BY TYPING space
        space(){

                     echo ""

         }
     # FUNCTION TO ADD 2 BLANK ROWS JUST BY TYPING double_space
         double_space(){

                    echo ""
                    echo ""

         }

# ---------------------------------------------------------------------------------------------
# PERSISTENT VARIABLES - DO NOT REMOVE!!!
# ---------------------------------------------------------------------------------------------

    DIR="$(dirname "$(which "$0")")"

    time_date=$(date +'%a-%h-%d-%Y-%I_%M_%S-%Z')

    # This will allow ctrl c to end the specific option number
    # without having to restart the full app
    # trap ctrl-c and call ctrl_c()


    trap ctrl_c INT

          function ctrl_c() {
            echo
            echo "Ctrl-C Ended the Application"
            # do the jobs
            exit
    }


    pause(){

        read -p "The selected process has completed. Press The 'Enter' Key, and select an option." fackEnterKey
    }

    double_space

    zero="DOWNLOAD NEW OVPN CONFIGS - WARNING!!! THIS WILL TAKE A LONG TIME (10MIN) & DELETE EXISTING CONFIGS!!!"
    zero() {

        printf "%s\n${PURPLE}--------------------------------------------------------------${NC}"
        printf "%s\n${CYAN} ${zero} ${NC}"
        printf "%s\n${PURPLE}--------------------------------------------------------------${NC}"
        double_space
        trap ctrl_c INT

          function ctrl_c() {
            echo
            echo "Ctrl-C Ended the Application"
            # do the jobs
            exit
    }
        method_0(){

            echo "Be Patient!!! If you think the app is frozen its not, when its done you will know and it will go back to the Goliad Menu"
            rm -rf CONNECTIONS
            mkdir -p CONNECTIONS
            cd CONNECTIONS || return

            lynx -dump -listonly "https://www.vpngate.net/en/" | grep "fqdn" | awk -F ' ' '{print $2}' > /tmp/sub1.txt
            while read LINE; do  lynx -dump -listonly  "${LINE}" ; done < /tmp/sub1.txt >/tmp/sub2.txt
            cat /tmp/sub2.txt | grep ".ovpn" | awk -F ' ' '{print $2}'  > /tmp/sub3.txt
            while read LINE;do curl -O "${LINE}"; done</tmp/sub3.txt

       # I am checking for new mirrored addresses so i can then download the .ovpn files
       # These endpoints are updated every 24 hours, but there is no need to create a cronjob locally for this as it would take too many resources
       # Each method automatically checks to see if there is a change with the mirrors
       # If the mirrors have not changed then the download of new configurations will not happen
       # This is important as we don't want to overload the servers with unnecessary queries

       #Source For Mirrors: https://www.vpngate.net/en/sites.aspx

       # I am saving a cleaned up Mirror
       # Output looks like this after cleanup
            # http://202.182.127.177:4218/en/,United States
            # http://103.201.129.50:3260/en/,Japan
            # http://185.222.220.35:34637/en/,Germany
            # http://217.138.212.46:34663/en/,United_Kingdom
            # http://161.202.144.236:56364/en/,United_States
            # http://128.22.166.118:11212/en/,Japan

            ### I'm going to have to come back to this mirror check in V1.2
            ###

#            mirror_check(){
#            curl https://www.vpngate.net/en/sites.aspx |  grep "target='_blank'>" | awk -F "target='_blank'" '{print $2}' | sed -e 's/\<\/a><\/span><\/strong>&nbsp;//g;s/<\/li>//g;s/Mirror location://g;s/)//g;s/>//g;s/( /,/' | sed 's/ /_/' | awk '{$1=$1};1'
#            }
#
#            mirror_check  > mirrors.out
#            mirror_check=$(cat mirrors.out | tr -d '?')
#            MIRRORS="${DIR}"/MIRRORS
#            CONNECTIONS="${DIR}"/CONNECTIONS
#
#            rm -rf "${MIRRORS}"
#                read_pull(){
#                             mkdir -p "${MIRRORS}";
#                             cd "${MIRRORS}"
#
#                # Reading the delimiter from mirrors.out and creating directories for each country - version 2
#                           while IFS=$',' read -r a b
#                             do
#                                 wget  -A "*do_openvpn.aspx*" -r -np -nc -l1 -nd --no-check-certificate -e robots=off "${a}"
#                                 cat * | grep 'public' | grep 'href="/common' | awk -F '<a href="' '{print "https://www.vpngate.net"$2}' | sed 's/">//g' >/tmp/dl.out
#
#
#                             done <../mirrors.out
#                }
#
#                    read_pull
#
#                                 mkdir -p "${CONNECTIONS}";
#                                 cd "${CONNECTIONS}"
#                                 wget -i /tmp/dl.out
#
#                                 #renaming the files so they can work properly when loading in openvpn cli
#                                 for f in "${CONNECTIONS}" ; do mv "$f" "$(echo "$f" | cut -d ';' -f6 | sed 's/%2F//g')";done
#                                 # getting the most reliable connections
#                                 curl https://www.vpngate.net/en/ | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" >/tmp/reliable.out
#                                 mkdir reliable
#                                 ls | ugrep -f /tmp/reliable.out >reliable.txt
#                                 while read LINE; do mv "${LINE}" reliable; done < reliable.txt








                    }
            method_0

        pause

}

    one="Connect To VPN"
    one() {

        printf "%s\n${PURPLE}--------------------------------------------------------------${NC}"
        printf "%s\n${CYAN} ${one} ${NC}"
        printf "%s\n${PURPLE}--------------------------------------------------------------${NC}"
        double_space
        trap ctrl_c INT

          function ctrl_c() {
            echo
            echo "Ctrl-C Ended the Application"
            # do the jobs
            exit
    }
        method_1(){

        echo "Drag and Drop You VPN File Here & Press Enter"


        #vpn=$(ls "${DIR}"/CONNECTIONS | peco)

        read goliad

        sudo openvpn --config "${goliad}" --auth-nocache

        }
            method_1

        pause

}
    ##############################################
    ##############################################
    show_menus() {
      clear

    printf "%s\n${PURPLE}########################################################################################################${NC}"
    printf "%s\n${PURPLE}
                             ██████   ██████  ██      ██  █████  ██████
                            ██       ██    ██ ██      ██ ██   ██ ██   ██
                            ██   ███ ██    ██ ██      ██ ███████ ██   ██
                            ██    ██ ██    ██ ██      ██ ██   ██ ██   ██
                             ██████   ██████  ███████ ██ ██   ██ ██████
    ${NC}"
    printf "%s\n${PURPLE}--------------------------------------------------------------------------------------------------------${NC}"
    printf "%s\n${PURPLE}-------------------------------------- Brought To You By: Jonathan Scott -------------------------------${NC}"
    printf "%s\n${PURPLE}-------------------------------------- Updated On: 8/9/2021 --------------------------------------------${NC}"
    printf "%s\n${PURPLE}-------------------------------------- Version 1.0 -----------------------------------------------------${NC}"
    printf "%s\n${PURPLE}-------------------------------------- OpenVPN Client --------------------------------------------------${NC}"
    printf "%s\n${PURPLE}########################################################################################################${NC}"


    double_space

	  printf "%s\n${PURPLE}--------------------------------------------------------------------------------------------------------${NC}"
    printf "%s\n${YELLOW} Goliad Menu ${NC}"
    printf "%s\n${PURPLE}--------------------------------------------------------------------------------------------------------${NC}"

    double_space


    echo "0. ${zero}"
    echo "1. ${one}"
    echo "2. Exit"

    }
    # Read the user input

    read_options(){
      local choice
      read -p "Enter choice [ 0 - 2 ] " choice
      case ${choice} in

        0) zero ;;
        1) one ;;
        2) exit 0;; #This will exit out of the application
		*) printf "%s\n${RED}Error...Option Not Valid, Please Choose Another${NC}" && sleep 2
	esac


    }

      # ----------------------------------------------
      # Close The Pipes and Stop Transmitting Data
      # ----------------------------------------------
      trap '' SIGINT SIGQUIT SIGTSTP

      # ----------------------------------------------
      # Initialize While Loops For The Main Logic
      # ----------------------------------------------
      while true
      do
        show_menus
        read_options
      done