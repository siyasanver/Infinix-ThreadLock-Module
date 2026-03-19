#!/system/bin/sh
# SIYAS INFINIX ACTION BUTTON (V3 UNCHAINED)

# 1. Read real-time thermal sensor
RAW_TEMP=$(cat /sys/class/power_supply/battery/temp)
TEMP=$((RAW_TEMP / 10))

# 2. Check RAM usage
RAM_USED=$(free -m | grep Mem | awk '{print $3}')

# 3. Check if BGMI or PUBG KR is actively running
if pidof com.pubg.imobile > /dev/null; then
    GAME_STATE="[BGMI ACTIVE] - Unchained Priority"
    am kill-all > /dev/null 2>&1
    echo 3 > /proc/sys/vm/drop_caches
    EXTRA_MSG="Background Apps Vaporized!"
elif pidof com.pubg.krmobile > /dev/null; then
    GAME_STATE="[PUBG KR ACTIVE] - Unchained Priority"
    am kill-all > /dev/null 2>&1
    echo 3 > /proc/sys/vm/drop_caches
    EXTRA_MSG="Background Apps Vaporized!"
else
    GAME_STATE="[OFFLINE] - Cooling Mode"
    EXTRA_MSG="Launch BGMI or KR to engage God-Mode."
fi

# 4. Print the pop-up notification to the screen using ECHO
echo "=============================="
echo " 🔥 INFINIX THREAD-LOCK V3 🔥 "
echo "=============================="
echo "Status: $GAME_STATE"
echo "Dimensity 6080 Temp: $TEMP°C"
echo "RAM Used: $RAM_USED MB"
echo "=============================="
echo "$EXTRA_MSG"
