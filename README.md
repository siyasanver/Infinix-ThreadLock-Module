# ⚡ Siyas Thread-Lock V3 (Infinix God-Mode)

A hardcore, thermal-unchained performance module built explicitly for the **Infinix Note 30 5G (Dimensity 6080)** running KernelSU. 

This is not a standard "game booster." This is a highly aggressive Linux-level process enforcer that isolates E-sports titles (BGMI & PUBG KR) and funnels maximum hardware resources directly to the game engine.

## 🚀 Core Features
* **The Paralyzer Engine:** Instantly vaporizes background RAM caches and terminates all non-essential vendor/system background apps upon game launch (`am kill-all`).
* **VIP Process Prioritization:** Automatically hunts for the game's Process ID and injects an aggressive `-20 renice` and `ionice` priority.
* **Maximum Governor Lock:** Removes the default Android CPU scaling and forces all 8 cores of the Dimensity 6080 to their absolute maximum frequency. 
* **Interactive Action Button:** Includes a custom `action.sh` script for the KernelSU dashboard that reports real-time motherboard temperatures and manually clears RAM mid-match.
* **Cross-Region Support:** Automatically detects both the Indian version (`com.pubg.imobile`) and the Korean version (`com.pubg.krmobile`).

## ⚠️ Hardware Warning
**DO NOT FLASH THIS ON OLDER OR HOTTER CHIPSETS (like the Helio G90T).** This specific V3 script removes standard thermal safety nets to maintain a locked 60 FPS on the Dimensity 6080. Using this on unverified hardware may cause critical overheating or unexpected shutdowns.

## 🛠️ Installation (KernelSU)
1. Go to the **Releases** tab on the right side of this page.
2. Download the latest `Siyas_ThreadLock_V3.zip` file.
3. Open your KernelSU Manager app.
4. Go to the Modules tab and click **Install**.
5. Select the ZIP file and reboot.

---
*Developed for the underground modding community by Siyas.*
