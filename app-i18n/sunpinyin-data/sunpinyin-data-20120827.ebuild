# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
DESCRIPTION="SunPinyin is a SLM (Statistical Language Model) based IME"
HOMEPAGE="http://sunpinyin.org/"

LICENSE="LGPL-2.1 CDDL"
SLOT="0"
KEYWORDS=""
RESTRICT="primaryuri"

LM_VERSION="20120212"
DICT_VERSION="${PV}"
SRC_URI="http://open-gram.googlecode.com/files/dict.utf8-${DICT_VERSION}.tar.bz2
	http://open-gram.googlecode.com/files/lm_sc.t3g.arpa-${LM_VERSION}.tar.bz2"

RDEPEND=""
DEPEND="${RDEPEND}
	app-i18n/sunpinyin"

src_unpack() {
	default
	mkdir ${S}
	cp -s ${WORKDIR}/{lm_sc.t3g.arpa,dict.utf8} ${S} ||
		die 'cannot make links for dict files'
	cp ${FILESDIR}/SLM-inst.mk ${S}/Makefile ||
		die 'cannot find SLM-inst.mk'
}

src_compile() {
	emake
}

src_install() {
	emake DESTDIR="${D}" install
}

