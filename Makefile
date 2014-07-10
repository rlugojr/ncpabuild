PYTHONTAR = Python-2.7.6
PYTHONVER = python2.7
CXFREEZEVER = cx_Freeze-4.3.2
PYTHONBIN = /usr/local/bin/python2.7
GITREPO = https://github.com/scot0357/ncpa.git
REPOTGT = ~/Development/ncpa

.PHONY: python pip cx_freeze pull_repo make_user_group test_rpmbuild

all: python pip cx_freeze pull_repo make_user_group test_rpmbuild

python:
	tar xf $(PYTHONTAR).tgz
	cd $(PYTHONTAR) && ./configure --with-zlib=/usr/include --enable-shared && make && make altinstall
	echo '/usr/local/lib' >> /etc/ld.so.conf 
	ldconfig

pip:
	cd /tmp && wget --no-check-certificate https://raw.github.com/pypa/pip/master/contrib/get-pip.py && $(PYTHONBIN) /tmp/get-pip.py

cx_freeze:
	tar xf $(CXFREEZEVER).tar.gz
	cd $(CXFREEZEVER) && $(PYTHONBIN) setup.py install

pull_repo:
	git clone $(GITREPO) $(REPOTGT)

clean:
	rm -rf $(PYTHONTAR)
	rm -rf $(CXFREEZEVER)

make_user_group:
	test `useradd nagios` || /bin/true
	test `groupadd nagcmd` || /bin/true

test_rpmbuild:
	test `which rpmbuild` || echo 'You need to install rpmbuild.'
