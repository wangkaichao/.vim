#!/bin/sh
#find /opt/hisi-linux/x86-arm/arm-hisiv300-linux/arm-hisiv300-linux-uclibcgnueabi/include/c++/4.8.3 -name "*" > c++.files
#cscope -bkq -i c++.files -f c++.out

#find /opt/hisi-linux/x86-arm/arm-hisiv300-linux/target/usr/include -name "*.[h|c]" > c.files
#cscope -bkq -i c.files -f c.out

# cs add c.out c++.out

find ~/hisi/Hi3798MV200_TVOS/platform/android/vendor/skyworth/driverBase -name "*.[h|c]" > hi3798mv200.files
cscope -bkq -i hi3798mv200.files -f hi3798mv200.out

