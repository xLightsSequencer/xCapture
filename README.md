# xCapture

xCapture is a packet capture tool for lighting control protocols. It captures E1.31 (sACN) and ArtNet network traffic and saves it as FSEQ or ESEQ sequence files compatible with [xLights](https://xlights.org) and [Falcon Player (FPP)](https://github.com/FalconChristmas/fpp).

xCapture is part of the [xLights](https://github.com/xLightsSequencer/xLights) family of tools for holiday and entertainment lighting.

## Features

- Capture E1.31 (sACN) and Art-Net DMX packets from the network
- Save captured data as FSEQ or ESEQ sequence files
- Configure specific universe ranges to capture
- Automatic frame timing detection
- Trigger-based capture (start/stop on channel value)
- Fill in missing frames for clean playback

## Building

### Linux

```bash
# Install dependencies (Ubuntu/Debian)
sudo apt-get install g++ build-essential libgtk-3-dev libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-dev freeglut3-dev libcurl4-openssl-dev \
    libexpat1-dev libwebp-dev cbp2make

# Build (downloads wxWidgets automatically if not installed)
make -j$(nproc)

# Install
sudo make install
```

### Windows

1. Clone [wxWidgets](https://github.com/xLightsSequencer/wxWidgets) (branch `xlights_2026.04`) as a sibling directory
2. Build wxWidgets with Visual Studio 2022
3. Open `xCapture/xCapture.sln` in Visual Studio 2022
4. Build Release x64

Or use the build script:
```cmd
cd build_scripts\msw
call build_xCapture_x64.cmd
```

## License

xCapture is licensed under the [GNU General Public License v3.0](LICENSE).
