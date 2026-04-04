#!/bin/bash

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Redirect stderr to /dev/null to avoid broken pipe error
exec 2>/dev/null

echo "================================================"
echo -e "${GREEN}🔐 EVT SSH MANAGER - Installing${NC}"
echo "================================================"

if [ -d "evtt" ]; then
    

    cd evtt
else
    
    git clone https://github.com/snaymyo/evtt.git
    cd evtt
fi

echo "================================================"
echo -e "${GREEN}[✅] Starting EVT SSH Manager...${NC}"
echo "================================================"

python3 main.py