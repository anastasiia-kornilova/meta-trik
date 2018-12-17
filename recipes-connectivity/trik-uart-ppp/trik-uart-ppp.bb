DESCRIPTION = "TCP/IP over UART using PPP"
LICENSE = "Apache-2.0"

SRC_URI="file://init_tty.sh \
         file://winclient.chat \
         file://autologin"

do_configure() {
   :
}
do_compile() {
	:
}
do_install() {
	install -m 0755 -D -t ${D}/${sysconfdir}/trik/ ${WORKDIR}/init_tty.sh ${WORKDIR}/autologin
	
	install -d ${D}/${sysconfdir}/trik/ppp
	install -m 0644 ${WORKDIR}/winclient.chat ${D}/${sysconfdir}/trik/ppp
}
