PYTHONTAR = 'cpython-ee0034434e65'
PYTHONVER = 'python3.5'
GITREPO = 'https://github.com/NagiosEnterprises/ncpa.git'
REPOTGT = '~/Development/ncpa'

.PHONY: python cx_freeze pull_repo

python:
	tar xf $(PYTHONTAR).tar.bz2
	cd $(PYTHONTAR) && ./configure --enable-shared && make && make altinstall
	echo '/usr/local/lib' >> /etc/ld.so.conf 
	ldconfig

cx_freeze:
	tar xf cx_Freeze.tar.bz2
	cd cx_Freeze && $(PYTHONVER) setup.py install

pull_repo:
	git clone $(GITREPO) $(REPOTGT)

clean:
	rm -rf $(PYTHONTAR)
	rm -rf cx_Freeze
