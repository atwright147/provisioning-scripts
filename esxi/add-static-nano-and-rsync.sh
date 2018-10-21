#!/bin/sh

## FROM: http://www.kioptrix.com/blog/a-few-nice-esxi-5-5-binaries/

echo "Download static binaries from kioptrix.com" &&\
wget http://www.kioptrix.com/dlvm/nano-static-2.4.3.tar.gz &&\
wget http://www.kioptrix.com/dlvm/rsync-static-3.0.9.tar.gz &&\

echo "Extract binaries" &&\
tar zxf nano* &&\
tar zxf rsync* &&\

echo "Delete tar files" &&\
rm nano*.tar.gz &&\
rm rsync*.tar.gz &&\

echo "Move extracted binaries to /bin" &&\
mv nano* /bin/nano
mv rsync* /bin/rsync
