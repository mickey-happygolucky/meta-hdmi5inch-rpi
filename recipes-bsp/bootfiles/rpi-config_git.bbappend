
COCOPAR_5INCH_HDMI ?= ""

do_deploy_append() {

    if [ "${COCOPAR_5INCH_HDMI}" = "1" ] ; then
        sed -i \
    	    -e 's|#disable_overscan=.*|disable_overscan=1|' \
            -e 's|#hdmi_group=.*|hdmi_group=2|' \
			-e 's|#hdmi_mode=.*|hdmi_mode=87|' \
			${DEPLOYDIR}/bcm2835-bootfiles/config.txt
        echo "hdmi_cvt 800 480 60 6 0 0 0" >> \
			${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    	echo "dtparam=spi=on" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
		echo "dtoverlay=ads7846,penirq=25,speed=10000,penirq_pull=2,xohms=150" >> \
			${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    fi
}
