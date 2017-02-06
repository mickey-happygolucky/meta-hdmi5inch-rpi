FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append = " file://800x480_60.00.bin"
PACKAGES =+ "${PN}-edid-800x480"

FILES_${PN}-edid-800x480 = "  \
 /lib/firmware/edid/800x480_60.00.bin"

do_install_append() {
   install -d ${D}/lib/firmware/edid
   install -m 0644 ${WORKDIR}/800x480_60.00.bin ${D}/lib/firmware/edid/800x480_60.00.bin
}

