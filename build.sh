#!/bin/bash
readonly BUILDER='FDOEMCD.builder.zip'

[ ! -f ] && wget -N http://www.fdos.info/bootdisks/ISO/${BUILDER}
[ -d ] && rm -rf FDOEMCD
unzip ${BUILDER}

cd FDOEMCD
mkisofs -o testdisk.iso -b isolinux/isolinux.bin -no-emul-boot -boot-load-size 4 -boot-info-table -N -J -r -c boot.catalog -hide boot.catalog -hide-joliet boot.catalog CDROOT

