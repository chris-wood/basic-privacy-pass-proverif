check:
	 proverif \
		-lib crypto.pvl \
		-lib basic_pp.pvl \
		security_properties/sanity_checks.pv

secrecy:
	 proverif \
		-lib crypto.pvl \
		-lib basic_pp.pvl \
		security_properties/strong_secrecy_nC.pv

unlinkability:
	 proverif \
		-lib crypto.pvl \
		-lib basic_pp.pvl \
		security_properties/client_unlinkability.pv

unforgeability:
	 proverif \
		-lib crypto.pvl \
		-lib basic_pp.pvl \
		security_properties/unforgeability.pv
