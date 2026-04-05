#!/bin/bash

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

# Redirect stderr to /dev/null to avoid broken pipe error
exec 2>/dev/null

echo "================================================"
echo -e "${YELLOW}🔐 𝐄𝐕𝐓 𝐒𝐒𝐇 𝐌𝐀𝐍𝐀𝐆𝐄𝐑 - 𝐏𝐫𝐨𝐟𝐞𝐬𝐬𝐢𝐨𝐧𝐚𝐥 𝐒𝐒𝐇 𝐀𝐜𝐜𝐨𝐮𝐧𝐭 𝐌𝐚𝐧𝐚𝐠𝐞𝐦𝐞𝐧𝐭 𝐒𝐲𝐬𝐭𝐞𝐦${NC}"
echo "================================================"

# Check if evtt folder exists
if [ -d "evtt" ]; then
    echo -e "${YELLOW}[⚠] 🍕🍟🥪 အရင်ဖိုင် ရှိမရှိ စစ်ဆေးနေသည် 🥙🥡🍖${NC}"
    rm -rf evtt
    echo -e "${RED}[✅] ဖိုင်အဟောင်းဖျတ်နေသည်${NC}"
fi

# Clone fresh repository
echo -e "${BLUE}[➡] 𝗘𝗩𝗧 𝗦𝗦𝗛 𝗠𝗔𝗡𝗚𝗘𝗥 𝗜𝗡𝗦𝗧𝗔𝗟𝗟𝗜𝗡𝗚 ${NC}"
rm -rf evtt
git clone https://github.com/snaymyo/evtt.git

if [ $? -ne 0 ]; then
    echo -e "${RED}[❌] 𝗘𝗩𝗧 𝗦𝗦𝗛 𝗠𝗔𝗡𝗚𝗘𝗥 𝗜𝗡𝗦𝗧𝗔𝗟𝗟𝗜𝗡𝗚 မအောင်မြင်ပါ${NC}"
    exit 1
fi

# Enter directory
cd evtt

# Install dependencies
echo -e "${BLUE}[➡] Installing dependencies...${NC}"
pip3 install -r requirements.txt

echo -e "${GREEN}[✅] 𝐈𝐧𝐬𝐭𝐚𝐥𝐥𝐢𝐧𝐠 𝐅𝐢𝐧𝐢𝐬𝐡${NC}"
echo "================================================"

echo -e "${RED}[⚠] ပိတ်ရန် Ctrl+C ကိုနှိပ်ပေးပါ${NC}"
echo "================================================"

# Run the app
python3 main.py
