# Basic Privacy Pass ProVerif model

This project contains a ProVerif model for the [issuance](https://datatracker.ietf.org/doc/draft-ietf-privacypass-protocol/) and [redemption](https://datatracker.ietf.org/doc/draft-ietf-privacypass-auth-scheme/) protocols for the basic version of [Privacy Pass](https://datatracker.ietf.org/doc/draft-ietf-privacypass-architecture/), i.e., type 1 and type 2 tokens.

## Model Overview

The root of the project contains the following files:
- `crypto.pvl`: describes the cryptographic primitives
- `basic_pp.pvl`: describes the generic processes of the client, redeemer, attester and issuer. Describes the processes generating the participants' data. The events used to express the security properties are also declared in this file.

The folder `security_properties` contains 4 files for each security property we are considering, along with the sanity checks. We refer to the conference paper for a description of each security property. The sanity checks consist of verifying that the protocol is executable without attacker. This is ensured when all channels are private, no key is compromised and only strong algorithms have been used. This corresponds to the case where there is no attacker.

## Execution and expected results

The security properties can be verified by running the following command from the root of the project.
```
proverif -lib crypto.pvl -lib basic_pp.pvl security_properties/<property>.pv
```
where `<property>` can be `sanity_checks`, `unforgeability`, `strong_secrecy_nC`, `client_unlinkability`.

To simplify the evaluation, we wrote a simple `Makefile` that contains these commands:
- `make check` for the sanity checks. It contains 5 false queries since sanity checks require to show the existence of a trace.
- `make secrecy` for the strong secrecy of the nonce `n_C` generated by the client. It contains 1 true query.
- `make unlinkability` for the unlinkability of the client. It contains 1 true query.
- `make unforgeability` for the unforgeability of the token. It contains 1 true query.

## Limitations

The model assumes an "ideal" configuration for Privacy Pass and seeks to prove the properties above in simple cases. For example, it models unlinkability in a manner similar to indistinguishability, wherein the attacker is asked to determine if a trace corresponds to one of two (maliciously) chosen clients. Unlinkability demands that the attacker cannot do this. The model does not consider how, for example, the attacker can use information revealed during the issuance or redemption protocol to place a client into one of two different anonymity sets. 
