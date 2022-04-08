# Lenovo-ThinkPad-P14s-Hackintosh

## Hardware configuration

| Category  | Component                                            | Note                                                         |
| --------- | ---------------------------------------------------- | ------------------------------------------------------------ |
| CPU       | Intel Core i7-10510U                                 |                                                            |
| GPU       | Intel UHD 620                                        |                                                              |
| SSD       | WD SN550 256GB                                       |                                                              |
| Screen    | 14" FHD 1920x1080                                    |                                                              |
| Memory    | 16GB / 2666MHz DDR4                                  |                                                              |
| Battery   | Integrated Li-Polymer 50Wh                           | `~ 4h30 of battery life, maybe it could be better `          |
| Camera    | 720p Camera                                          |                                                              |
| Wifi & BT | Intel AX 201                                         |                                                              |
| Input     | PS2 Keyboard                                         | `Volume and microphone hotkeys / brightness hotkeys / backlit hotkeys`                                                              |
| Input     | Synaptics SMBUS TrackPad                             | `Multi-point fingers gestures works perfectly`               |
| Input     | SMBUS TrackPoint                                     | `Work perfectly : same feeling as on Windows 10`             |
| Audio     | Realtek ALC 257                                      |                                                              |

## Software Configuration

| Component      | Version       |
| -------------- | ------------- |
| macOS Monterey | 12.0.1        |
| SMBIOS         | MacBookAir9,1 |
| OpenCore       | 0.7.9         |




## Status



<strong>Working ✅</strong>

- [x] Battery percentage
- [x] Bluetooth - Intel Wireless AX201 
- [x] Wifi - Intel Wireless AX201
- [x] CPU power management (<1 W at IDLE)
- [x] iGPU UHD hardware acceleration / performance 
- [x] iServices
- [x] Keyboard
- [x] Speaker 
- [x] Sleep/Wake 
- [x] TouchPad  
- [x] TrackPoint  
- [x] CPU power management
- [x] GPU UHD hardware acceleration / performance 
- [x] iMessage, FaceTime, App Store, iTunes Store
- [x] Keyboard 
- [x] Speakers
- [x] Sleep/Wake 
- [x] TouchPad 
- [x] TrackPoint  
- [x] USB Ports 
- [x] Camera
- [x] SD Card reader 
- [x] Backlit keyboard
- [x] External display over HDMI




<strong>Not working ⚠️</strong>

- [ ] Microphone (in and external)
- [ ] Airdrop
- [ ] Hibernation
- [ ] Fingerprint reader



<strong>Untested</strong>

- [ ] USB-C External display


<strong>Problem</strong>

- Using OneKeyHiDpi for HiDpi resolution : underscaled and screen blinking black after sleep![Screenshot 2022-04-08 at 12.41.02](/Users/paulsolbes/Desktop/Screenshot 2022-04-08 at 12.41.02.png)