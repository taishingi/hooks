LOCALE?=fr
IN?=""
FILE?="zuu"

pot:
	xgettext --language=Shell --output=po/fr/d.pot d/pre-commit
	xgettext --language=Shell --output=po/fr/rust.pot rust/pre-commit
	xgettext --language=Shell --output=po/fr/python.pot python/pre-commit
update: pot
	msgmerge --update po/fr/LC_MESSAGES/d.po po/fr/d.pot
	msgmerge --update po/fr/LC_MESSAGES/rust.po po/fr/rust.pot
	msgmerge --update po/fr/LC_MESSAGES/python.po po/fr/python.pot
init:
	msginit --locale=$(LOCALE) --input=$(IN) -o po/$(LOCALE)/LC_MESSAGES/$(FILE).po
install:
	mkdir -p /usr/share/zuu/
	install -m 644 src/rust.txt /usr/share/zuu/rust.txt
	install -m 644 src/d.txt /usr/share/zuu/d.txt
	install -m 644 src/go.txt /usr/share/zuu/go.txt
	install -m 644 src/python.txt /usr/share/zuu/python.txt
	install -m 755 d/pre-commit /usr/bin/d-zuu
	install -m 755 rust/pre-commit /usr/bin/rust-zuu
	install -m 755 python/pre-commit /usr/bin/python-zuu
	install -m 755 go/pre-commit /usr/bin/go-zuu
uninstall:
	rm -rf /usr/share/zuu/
	rm /usr/bin/rust-zuu
	rm /usr/bin/go-zuu
	rm /usr/bin/d-zuu
	rm /usr/bin/python-zuu
