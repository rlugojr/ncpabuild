NCPA Build
=========

A package of scripts and tarballs for installing an NCPA build box.


Windows builds
---------
**OpenSSL for Windows** Download the latest OpenSSL and VS 2008 distributable packages (https://www.openssl.org/related/binaries.html)
<br>
**VS 2008 Distributable** Available from the same link above
<br>
**NSIS 2.46** (http://nsis.sourceforge.net/Download)
<br></br>
Install **Python 2.7.x** and the following pip components for python:
<pre>
cx-Freeze
docutils
Flask
gevent
gevent-websocket
greenlet
Jinja2
MarkupSafe
psutil
Pygments
pyOpenSSL
pypm
pythonselect
pywin32
requests
setuptools
Sphinx
sphinx-bootstrap-theme
virtualenv
Werkzeug
wsgiref
</pre>

Windows cx_Freeze patching
--------
Just like in the linux build boxes we need to patch cx_Freeze to work with gevent properly... Open up your cx_Freeze which should be located in <code>C:\Python27\Lib\site-packages\cx_Freeze\freezer.py</code> and around line 24 where there is an import, replace the one line import with these three lines:

<pre>
imp = __import__("imp")
sys = __import__("sys")
os = __import__("os")
</pre>
