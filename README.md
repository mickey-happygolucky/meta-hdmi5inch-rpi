# Summary

meta-hdmi5inch-rpi support to work [cocopar 5 inch IPS Highvision LCD Display](http://www.amazon.com/cocopar-Raspberry-Resistive-Screen-Display/dp/B01B7Q0DK2),[(for Japanese)](http://www.amazon.co.jp/%E3%82%A4%E3%83%B3%E3%83%81IPS%E3%83%8F%E3%82%A4%E3%83%93%E3%82%B8%E3%83%A7%E3%83%B3LCD-%E3%83%87%E3%82%A3%E3%82%B9%E3%83%97%E3%83%AC%E3%82%A4-%E3%82%BF%E3%83%83%E3%83%81%E3%83%91%E3%83%8D%E3%83%AB-%E3%83%A9%E3%82%BA%E3%83%99%E3%83%AA%E3%83%BC%E3%83%91%E3%82%A4-%E3%81%AB%E9%81%A9%E5%BF%9C%E3%81%99%E3%82%8B-%E3%82%BF%E3%83%83%E3%83%81%E3%83%87%E3%82%A3%E3%82%B9%E3%83%97%E3%83%AC%E3%82%A4-%E3%82%BF%E3%83%83%E3%83%81%E3%83%91%E3%83%8D%E3%83%AB-%E3%82%BF%E3%83%83%E3%83%81%E3%83%9A%E3%83%B3-Raspberry/dp/B00WGVL4R4)

This layers is unofficial.

## Dependency

This layer depend on [meta-raspberrypi](git://git.yoctoproject.org/meta-raspberrypi)

# How to use

## Enable LCD panel

In order to enable the LCD panel, add the following line to your local.conf.

```txt
COCOPAR_5INCH_HDMI = "1"
```

## Enable Touchscreen

In order to enable the touchscreen, add the following line to your local.conf.

```txt
KERNEL_DEVICETREE_append = "overlays/ads7846-overlay.dtb"
```

### Calibration with X11

To perform a calibration in the X11 will type the following at the console, such as ssh.

```bash
$ DISPLAY=:0.0 xinput_calibrator
```

Then, the results are displayed as follows,to create the '/etc/X11/xorg.conf.d/99-calibration.conf'.

```txt
Calibrating EVDEV driver for "ADS7846 Touchscreen" id=6
	current calibration values (from XInput): min_x=102, max_x=3934 and min_y=330, max_y=3868

Doing dynamic recalibration:
	Setting calibration data: 60, 3976, 332, 3885
	--> Making the calibration permanent <--
  copy the snippet below into '/etc/X11/xorg.conf.d/99-calibration.conf'
Section "InputClass"
	Identifier	"calibration"
	MatchProduct	"ADS7846 Touchscreen"
	Option	"Calibration"	"60 3976 332 3885"
	Option	"SwapAxes"	"0"
EndSection
```

