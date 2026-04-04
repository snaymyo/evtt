#!/bin/bash

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Redirect stderr to /dev/null to avoid broken pipe error
exec 2>/dev/null

echo "================================================"
echo -e "${GREEN}🔐 𝙀𝙑𝙏 𝙎𝙎𝙃 𝙈𝘼𝙉𝘼𝙂𝙀𝙍 - 𝙄𝙣𝙨𝙩𝙖𝙡𝙡𝙞𝙣𝙜${NC}"


if [ -d "evtt" ]; then
    

    cd evtt
else
    
    git clone https://github.com/snaymyo/evtt.git
    cd evtt
fi

echo -e "${GREEN}[✅] 𝐈𝐧𝐬𝐭𝐚𝐥𝐥𝐢𝐧𝐠 𝐅𝐢𝐧𝐢𝐬𝐡${NC}"
echo "================================================"

python3 main.py