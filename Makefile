V=20220225

PREFIX = /usr/local

install:
	install -dm755 $(DESTDIR)$(PREFIX)/share/pacman/keyrings/
	install -m0644 asahilinux{.gpg,-trusted,-revoked} $(DESTDIR)$(PREFIX)/share/pacman/keyrings/

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/share/pacman/keyrings/asahilinux{.gpg,-trusted,-revoked}
	rmdir -p --ignore-fail-on-non-empty $(DESTDIR)$(PREFIX)/share/pacman/keyrings/

dist:
	git archive --format=tar --prefix=asahilinux-keyring-$(V)/ $(V) | gzip -9 > asahilinux-keyring-$(V).tar.gz
	gpg --detach-sign --use-agent asahilinux-keyring-$(V).tar.gz

.PHONY: install uninstall dist upload
