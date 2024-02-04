LOCALE?=fr
IN?=""
FILE?="zuu"

pot:
	xgettext --language=Shell --output=po/fr/d.pot d/pre-commit
update: pot
	msgmerge --update po/fr/LC_MESSAGES/d.po po/fr/d.pot
init:
	msginit --locale=$(LOCALE) --input=$(IN) -o po/$(LOCALE)/LC_MESSAGES/$(FILE).po
install:
	install -m 644 po/fr/LC_MESSAGES/d.mo /usr/share/locale/fr/LC_MESSAGES/d-zuu.mo
	install -m 755 d/pre-commit /usr/bin/d-zuu