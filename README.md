# Lenovo-ThinkPad-P14s-Hackintosh

## Hardware configuration

| Category  | Component                                            | Note                                                         |
| --------- | ---------------------------------------------------- | ------------------------------------------------------------ |
| CPU       | Intel Core i7-10510U                                 |                                                              |
| GPU       | Intel UHD 620                                        |                                                              |
| SSD       | Samsung 980 500 Go                                   | `Dual boot MacOS Monterey W10`                               |
| Screen    | 14" FHD 1920x1080                                    |                                                              |
| Memory    | 16GB / 2666MHz DDR4                                  |                                                              |
| Battery   | Integrated Li-Polymer 50Wh                           | `~ 4h30 of battery life, maybe it could be better `          |
| Camera    | 720p Camera                                          |                                                              |
| Wifi & BT | Intel AX 201                                         |                                                              |
| Input     | PS2 Keyboard                                         | `Functions keys`                                             |
| Input     | Synaptics SMBUS TrackPad                             | `Multi-point fingers gestures works perfectly`               |
| Input     | SMBUS TrackPoint                                     | `Not smooth as Windows driver`                              |
| Audio     | Realtek ALC 257                                      |                                                              |

## Software Configuration

| Component      | Version       |
| -------------- | ------------- |
| macOS Monterey | 12.3          |
| SMBIOS         | MacBookAir9,1 |
| OpenCore       | 0.7.9         |




## Status



<strong>Working ✅</strong>

- [x] Battery percentage
- [x] Bluetooth - Intel Wireless AX201 
- [x] Wifi - Intel Wireless AX201
- [x] CPU power management (~2 W at IDLE)
- [x] iGPU UHD hardware acceleration / performance 
- [x] iServices
- [x] Sleep/Wake 
- [x] TouchPad  
- [x] TrackPoint  
- [x] Keyboard 
- [x] Speakers
- [x] Jack 3.5 (speaker + microphone)
- [x] Sleep/Wake 
- [x] USB Ports 
- [x] Camera
- [x] SD Card reader 
- [x] SmartCard Reader
- [x] Backlit keyboard
- [x] External display over HDMI




<strong>Not working ⚠️</strong>

- [ ] Internal microphone
- [ ] Airdrop
- [ ] Fingerprint reader



<strong>Untested</strong>

- [ ] USB-C External display


<strong>Problems</strong>

- Using OneKeyHiDPI for HiDPI resolution : underscaled and screen blinking black after sleep
- No HDMI output after wake
- TrackPoint is not smooth 

## SSDT Patches

| SSDT             | Note                                 |
| ---------------- | ------------------------------------ |
| SSDT-AC          |                                      |
| SSDT-BAT0        |                                      |
| SSDT-DGPU        |                                      |
| SSDT-DMAC        |                                      |
| SSDT-ECRW        |                                      |
| SSDT-GPI0        |                                      |
| SSDT-GPRW        |                                      |
| SSDT-HPET        |                                      |
| SSDT-INIT        |                                      |
| SSDT-MCHC        |                                      |
| SSDT-NOGPU       |                                      |
| SSDT-NTFY        |                                      |
| SSDT-PMCR        |                                      |
| SSDT-PNFL        |                                      |
| SSDT-PWRB        |                                      |
| SSDT-RHUB        |                                      |
| SSDT-SBUS        |                                      |
| SSDT-TMPX        |                                      |
| SSDT-WAKE        |                                      |
| SSDT-XCPM        |                                      |
| SSDT-YVPC        |                                      |



![about this mac](https://user-images.githubusercontent.com/52856465/162455103-23224e4f-fa50-4dfa-8e47-155405b4207b.png)
![battery usage](https://user-images.githubusercontent.com/52856465/162455109-557629bb-d283-44ea-b756-df4808d10654.png)
![power consumption](https://user-images.githubusercontent.com/52856465/162455116-8e8c5d5d-cfb0-45db-96e7-0ab875d2f929.png)


