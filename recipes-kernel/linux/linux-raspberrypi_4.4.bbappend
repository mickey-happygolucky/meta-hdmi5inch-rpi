#RRECOMMENDS_${PN} += "${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', 'linux-firmware-edid-800x480', '', d)}"


do_deploy_append() {
    if [ "${COCOPAR_5INCH_HDMI}" = "1" ] ; then
	# Deploy cmdline.txt
	CMDLINE=`cat ${DEPLOYDIR}/bcm2835-bootfiles/cmdline.txt`
	EDID="${@bb.utils.contains("MACHINE_FEATURES", "vc4graphics", "1", "0", d)}"
	if [ ${EDID} = "1" ]; then
	   EDID_PARAMS="video=HDMI-A-1:e drm_kms_helper.edid_firmware=edid/800x480_60.00.bin"
	fi
	echo "${CMDLINE}${EDID_PARAMS}" > ${DEPLOYDIR}/bcm2835-bootfiles/cmdline.txt
    fi
}
