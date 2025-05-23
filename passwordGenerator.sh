#!/bin/bash

# Color definitions
RED='\033[0;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
MAGENTA='\033[1;35m'
NC='\033[0m'

# Banner
echo -e "${GREEN}┌──────────────────────────────────────────────┐${NC}"
echo -e "${GREEN}│${NC}      ${YELLOW}🔐 PASSWORD GENERATOR 9000 🔐${NC}           ${GREEN}│${NC}"
echo -e "${GREEN}│${NC}     ${CYAN}The last password you'll ever need${NC}       ${GREEN}│${NC}"
echo -e "${GREEN}└──────────────────────────────────────────────┘${NC}"
echo -e "${RED}💀 Weak passwords will be terminated.${NC}"
echo -e "${YELLOW}🛡️  Entropy level: OVER 9000!${NC}"
echo

# Inputs
read -p "$(echo -e "${CYAN}📏 Enter desired password length: ${NC}")" length
read -p "$(echo -e "${CYAN}🔢 How many passwords to generate? ${NC}")" count

# Validation
if ! [[ "$length" =~ ^[0-9]+$ && "$count" =~ ^[0-9]+$ && "$length" -ge 8 && "$length" -le 64 ]]; then
  echo -e "${RED}❌ Please enter valid numbers. Length must be between 8 and 64.${NC}"
  exit 1
fi

# Generate passwords
echo -e "\n${MAGENTA}🔧 Generating $count password(s) of length $length...${NC}"
passwords=()

for i in $(seq 1 "$count"); do
    pwd=$(openssl rand -base64 48 | cut -c1-"$length")
    passwords+=("$pwd")
    echo -e "${YELLOW}$i.${NC} ${GREEN}$pwd${NC}"
done

# Choose preferred password
echo
read -p "$(echo -e "${CYAN}👉 Choose your preferred password [1-$count]: ${NC}")" choice
if ! [[ "$choice" =~ ^[0-9]+$ && "$choice" -ge 1 && "$choice" -le "$count" ]]; then
  echo -e "${RED}❌ Invalid choice. Exiting.${NC}"
  exit 1
fi
selected_password="${passwords[$((choice-1))]}"

# User details
read -p "$(echo -e "${CYAN}👤 Enter your username: ${NC}")" username
read -p "$(echo -e "${CYAN}🌐 Enter website/application name: ${NC}")" website

# Save location input
read -p "$(echo -e "${CYAN}📁 Enter full path to save password file (leave empty for Desktop): ${NC}")" save_path

# Default directory if not provided
if [[ -z "$save_path" ]]; then
    desktop_path="$HOME/Desktop/password"
    sudo mkdir -p "$desktop_path"
    sudo chown root:root "$desktop_path"
    sudo chmod 700 "$desktop_path"
    save_path="$desktop_path/password.txt"
    csv_path="$desktop_path/password.csv"
else
    dir=$(dirname "$save_path")
    if [[ ! -d "$dir" ]]; then
        echo -e "${RED}❌ Directory does not exist: $dir${NC}"
        exit 1
    fi
    csv_path="${save_path%.*}.csv"
fi

# Save to password.txt
{
  echo "----------------------------------"
  echo "Website: $website"
  echo "Username: $username"
  echo "Password: $selected_password"
  echo
} | sudo tee -a "$save_path" > /dev/null

# Save to password.csv
{
  echo "name,url,username,password"
  echo "$website,https://$website,$username,$selected_password"
} | sudo tee "$csv_path" > /dev/null

# Final output
echo -e "\n${GREEN}✅ Password saved successfully!${NC}"
echo -e "${YELLOW}📄 Text file: ${NC}$save_path"
echo -e "${YELLOW}📄 CSV file:  ${NC}$csv_path"
echo -e "${CYAN}🔐 Note: Folder permissions require sudo to view/edit files.${NC}"
