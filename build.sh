#!/bin/bash
readonly BUILDER='FDOEMCD.builder.zip'
readonly ISOLINUX_CFG='FDOEMCD/CDROOT/isolinux/ISOLINUX.CFG'
readonly AUTORUN='FDOEMCD/CDROOT/isolinux/AUTORUN.BAT'

[ ! -f ] && wget -N http://www.fdos.info/bootdisks/ISO/${BUILDER}
[ -d ] && rm -rf FDOEMCD
unzip ${BUILDER}
sed -i '\/prompt 1/d' ${ISOLINUX_CFG}
sed -i '\/display BOOTMSG/d' ${ISOLINUX_CFG}
sed -i '\/timeout /d' ${ISOLINUX_CFG}

cd FDOEMCD
mkisofs -o FreeDOS.iso -b isolinux/isolinux.bin -input-charset utf8 -no-emul-boot -boot-load-size 4 -boot-info-table -N -J -r -c boot.catalog -hide boot.catalog -hide-joliet boot.catalog CDROOT

