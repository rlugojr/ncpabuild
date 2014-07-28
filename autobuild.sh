if uname -a | grep -i 'Debian';
then
    PACKAGE='deb'
elif uname -a | grep -i 'Ubuntu';
then
    PACKAGE='deb'
elif uname -a | grep -i 'Darwin';
then
    PACKAGE='dmg'
else
    PACKAGE='rpm'
fi

if arch | grep '^i[0-9]86$';
then
    ARCH='x86'
else
    ARCH='x86_64'
fi

TARGET="/mnt/smbshare/ncpastaging/posix/${PACKAGE}/${ARCH}/"

(
    cd /root/Development/ncpa/build
    make build_${PACKAGE}
    /bin/cp *.${PACKAGE} "${TARGET}"
    make clean
)
