NAME           = sdsc-openbabel
VERSION        = 2.3.2
RELEASE        = 3
PKGROOT        = /opt/openbabel

SRC_SUBDIR     = openbabel

SOURCE_NAME    = openbabel
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS       = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
