# ethkey
`ethkey` from Parity Technologies https://github.com/openethereum/parity-ethereum

# Usage

`docker run --rm electricwarr/ethkey [OPTS]`

Example:

```
$ docker run --rm electricwarr/ethkey --help
Parity Ethereum keys generator.
  Copyright 2015-2020 Parity Technologies (UK) Ltd.

Usage:
    ethkey info <secret-or-phrase> [options]
    ethkey generate random [options]
    ethkey generate prefix <prefix> [options]
    ethkey sign <secret> <message>
    ethkey verify public <public> <signature> <message>
    ethkey verify address <address> <signature> <message>
    ethkey recover <address> <known-phrase>
    ethkey [-h | --help]

Options:
    -h, --help         Display this message and exit.
    -s, --secret       Display only the secret key.
    -p, --public       Display only the public key.
    -a, --address      Display only the address.
    -b, --brain        Use parity brain wallet algorithm. Not recommended.

Commands:
    info               Display public key and address of the secret.
    generate random    Generates new random Ethereum key.
    generate prefix    Random generation, but address must start with a prefix ("vanity address").
    sign               Sign message using a secret key.
    verify             Verify signer of the signature by public key or address.
    recover            Try to find brain phrase matching given address from partial phrase.
```

- `build.sh` builds the image
- `debug.sh` drops into a shell inside an instance of your latest local build
- `run.sh`   shortcut for `docker run...` for your local version, use like `./run.sh --help`

# Dockerfile

[Multi-stage build](https://docs.docker.com/develop/develop-images/multistage-build/) separates the build environment from the running environment - and saves us from including the rest of the `parity` project in the `ethkey` container.

