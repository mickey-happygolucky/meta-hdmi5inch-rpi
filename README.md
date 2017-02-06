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

## To work with core-image-sato

In order to work core-image-sato, add the following lines to your local.conf.

```txt
MACHINE_FEATURES += "vc4graphics"
IMAGE_INSTALL_append = " xf86-input-evdev"
MACHINE_EXTRA_RRECOMMENDS += "linux-firmware-edid-800x480"
```

core-image-sato does not work without `vc4graphics` from morty branch.
if `xf86-input-evdev` is not installed then mouse pointer will not moving dispite mouse is moved.
Cocopar 5inch LCD does not provide EDID therefore KMS will be fail.
`linux-firmware-edid-800x480` provides the EDID file to work KMS.
