#!/usr/bin/env python3
# main.py - Launcher for compiled EVT SSH Manager

import sys
import os
import time
import threading
import subprocess

# Import compiled app module
try:
    from app import app
    from app import run_telegram_bot, auto_limit_check, check_license_from_github
    from app import sync_all_users_to_system, get_vps_ip
except ImportError as e:
    print(f"\n❌ Cannot import compiled module!")
    print(f"   Error: {e}")
    print(f"\n📌 Please run: python setup.py build_ext --inplace")
    print(f"   Then rename the .so file to 'app.so'")
    sys.exit(1)

def main():
    print("\n" + "="*60)
    print("🔐 𝐄𝐕𝐓 𝐒𝐒𝐇 𝐌𝐀𝐍𝐀𝐆𝐄𝐑 - 𝐏𝐫𝐨𝐟𝐞𝐬𝐬𝐢𝐨𝐧𝐚𝐥 𝐒𝐒𝐇 𝐀𝐜𝐜𝐨𝐮𝐧𝐭 𝐌𝐚𝐧𝐚𝐠𝐞𝐦𝐞𝐧𝐭 𝐒𝐲𝐬𝐭𝐞𝐦")
    print("="*60)
    
    # License check
    valid, message, _ = check_license_from_github()
    if not valid:
        print(f"\n❌ {message}")
        sys.exit(1)
    
    # Sync users
    sync_all_users_to_system()
    
    # Start background threads
    telegram_thread = threading.Thread(target=run_telegram_bot, daemon=True)
    telegram_thread.start()
    
    limit_thread = threading.Thread(target=auto_limit_check, daemon=True)
    limit_thread.start()
    
    vps_ip = get_vps_ip()
    print(f"\n✅ Web Panel: http://{vps_ip}:5001")
    print("[🤖] Telegram Bot running...")
    print(f"[❌] ခု {message}")
        print(f"🧔🆃🅴🅻🅴🅶🆁🅰🅼 🅰🅲🅲🅾🆄🅽🆃")
        print(f"𝗵𝘁𝘁𝗽𝘀://𝘁.𝗺𝗲/𝗲𝘃𝘁𝘃𝗽𝗻143")
    
    # Run server
    try:
        from waitress import serve
        serve(app, host='0.0.0.0', port=5001, threads=4)
    except ImportError:
        from werkzeug.serving import run_simple
        run_simple('0.0.0.0', 5001, app, use_reloader=False, threaded=True)

# ✅ Gunicorn အတွက် app variable ကို ထုတ်ပေးပါ
# (ဒီအပိုင်းက main function ရဲ့ အပြင်မှာ ရှိရပါမယ်)
app = app  # from app import app ကနေ ရလာတဲ့ app ကို ပြန်ထုတ်ပေးတယ်

if __name__ == '__main__':
    main()