# Build ethkey

FROM rust:1.58.1 as Build

WORKDIR /ethkey-build

RUN git clone https://github.com/openethereum/parity-ethereum.git

WORKDIR /ethkey-build/parity-ethereum/accounts/ethkey/cli

# Pre-run cargo to speed up recompiling
RUN cargo fetch
RUN cargo build --release


# Use ethkey

FROM debian:stretch

COPY --from=Build /ethkey-build/parity-ethereum/target/release/ethkey /bin/ethkey

ENTRYPOINT ["ethkey"]
