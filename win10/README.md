# Windows 10

## Specs

Image: Windows 10 x86, x64
Drivers: Virtio

## Setup

### Systems

- Enable Qemu Agent

### HDD

- Bus: VirtIO SCSI
- Cache: Write Back
- Enable Discard

### Network

- Network Device: VirtIO (paravirtualized)

### Hardware

- Add -> CD/DVD drive: ide3 w/ Virtio

## Drivers

- HDD: vioscsi\w10\
- Network: NetKVM\w10\
- Memory Ballooning: Balloon\w10\
- Serial: vioserial\win10\
