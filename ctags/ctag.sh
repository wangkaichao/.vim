#!/bin/sh
#ctags --c++-kinds=+p --fields=+iaS --extra=+q -R -f tags ./ 

#ctags -I __THROW --file-scope=yes --langmap=c:+.h --languages=c,c++ --links=yes --c-kinds=+p --fields=+S  -R -f ~/.vim/systags /usr/include /usr/local/include
ctags -I __THROW --file-scope=yes --langmap=c:+.h --languages=c,c++ --links=yes --c-kinds=+p --fields=+S  -R -f ~/ctags/hi3798v200tags /work2/wangkaichao/hisi/Hi3798MV200_TVOS/platform/android/vendor/skyworth/driverBase 
