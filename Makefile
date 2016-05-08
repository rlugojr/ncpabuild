PYTHONTAR = Python-2.7.11
PYTHONVER = python2.7
CXFREEZEVER = cx_Freeze-4.3.4
PYTHONBIN = /root/p27n/bin/python2.7
GITREPO = https://github.com/NagiosEnterprises/ncpa.git
REPOTGT = ~/Development/ncpa

.PHONY: python pip cx_freeze pull_repo make_user_group copy_scripts test_rpmbuild

all: python pip cx_freeze pull_repo make_user_group test_rpmbuild

python:
	tar xf $(PYTHONTAR).tgz
	cd $(PYTHONTAR) && ./configure --with-zlib=/usr/include --prefix=/root/p27n --enable-shared && make && make altinstall
	echo '/usr/local/lib' >> /etc/ld.so.conf 
	/sbin/ldconfig

pip:
	cd /tmp && wget --no-check-certificate https://bootstrap.pypa.io/get-pip.py && $(PYTHONBIN) /tmp/get-pip.py

cx_freeze:
	tar xf $(CXFREEZEVER)-patched.tar.gz
	cd $(CXFREEZEVER) && $(PYTHONBIN) setup.py install

pull_repo:
	git clone $(GITREPO) $(REPOTGT)

clean:
	rm -rf $(PYTHONTAR)
	rm -rf $(CXFREEZEVER)

make_user_group:
	test `useradd nagios` || /bin/true
	test `groupadd nagcmd` || /bin/true
	
copy_scripts:
	cp -f autobuild.sh /root

test_rpmbuild:
	test `which rpmbuild` || echo 'You need to install rpmbuild.'
