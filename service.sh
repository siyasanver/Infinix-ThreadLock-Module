#!/system/bin/sh
# SIYAS THREAD-LOCK V2.1 (BGMI + KR UNCHAINED & PARALYZER)

# 1. Wait for Android to completely finish booting
until [ "$(getprop sys.boot_completed)" = "1" ]; do
    sleep 5
done

# The State Tracker (0 = Game Closed, 1 = Game Running)
GAME_STATE=0

# 2. The Smart Loop
while true; do
    # Hunt for the BGMI Process ID first
    GAME_PID=$(pidof com.pubg.imobile)
    
    # If BGMI is NOT running, check if PUBG KR is running instead
    if [ -z "$GAME_PID" ]; then
        GAME_PID=$(pidof com.pubg.krmobile)
    fi
    
    if [ -n "$GAME_PID" ]; then
        # EITHER BGMI OR KR IS RUNNING
        if [ "$GAME_STATE" -eq 0 ]; then
            # ==========================================
            # 🔥 INITIAL LAUNCH: THE MASSIVE NUKE 🔥
            # ==========================================
            
            # 1. Paralyze background vendor/system apps
            am kill-all > /dev/null 2>&1
            
            # 2. Disable Google/System Auto-Sync to prevent network spikes
            settings put global auto_sync 0
            
            # 3. Vaporize RAM caches to give the game maximum breathing room
            echo 3 > /proc/sys/vm/drop_caches
            
            # 4. Lock ALL 8 cores to absolute maximum frequency
            for i in 0 1 2 3 4 5 6 7; do
                echo "performance" > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_governor 2>/dev/null
            done
            
            # 5. Inject VIP CPU and Storage Priority to whichever game is open
            renice -n -20 -p $GAME_PID > /dev/null 2>&1
            ionice -c 1 -n 0 -p $GAME_PID > /dev/null 2>&1
            
            # Update the tracker so it doesn't run the nuke again
            GAME_STATE=1
        else
            # ==========================================
            # 🛡️ CONTINUOUS ENFORCEMENT 🛡️
            # ==========================================
            # Re-apply the renice priority just in case Android tries to revoke it
            renice -n -20 -p $GAME_PID > /dev/null 2>&1
        fi
    else
        # NEITHER GAME IS RUNNING
        if [ "$GAME_STATE" -eq 1 ]; then
            # ==========================================
            # 💤 GAME CLOSED: RESTORE NORMALITY 💤
            # ==========================================
            
            # 1. Turn Auto-Sync back on so you get your emails/messages
            settings put global auto_sync 1
            
            # 2. Drop all cores back to battery-saving mode
            for i in 0 1 2 3 4 5 6 7; do
                echo "schedutil" > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_governor 2>/dev/null
            done
            
            # Update the tracker so it knows the game is off
            GAME_STATE=0
        fi
    fi
    
    # Rest for 10 seconds before checking the screen again
    sleep 10
done
