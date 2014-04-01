PYTHONTAR = Python-2.7.6
PYTHONVER = python2.7
GITREPO = https://github.com/NagiosEnterprises/ncpa.git
REPOTGT = ~/Development/ncpa

.PHONY: python pip cx_freeze pull_repo

all: python pip cx_freeze pull_repo

python:
	tar xf $(PYTHONTAR).tgz
	cd $(PYTHONTAR) && ./configure --with-zlib=/usr/include --enable-shared && make && make altinstall
	echo '/usr/local/lib' >> /etc/ld.so.conf 
	ldconfig

pip:
	cd /tmp && wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py && python2.7 /tmp/get-pip.py

cx_freeze:
	tar xf cx_Freeze-4.3.2.tar.gz
	cd cx_Freeze-4.3.2 && $(PYTHONVER) setup.py install

pull_repo:
	git clone $(GITREPO) $(REPOTGT)

clean:
	rm -rf $(PYTHONTAR)
	rm -rf cx_Freeze
