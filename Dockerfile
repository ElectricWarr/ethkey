# Build ethkey

FROM rust:1.24.1 as Build

WORKDIR /ethkey-build

RUN git clone https://github.com/paritytech/parity.git

WORKDIR /ethkey-build/parity/ethkey/cli

# Pre-run cargo to speed up recompiling
RUN cargo fetch
RUN cargo build --release


# Use ethkey

FROM debian:stretch

COPY --from=Build /ethkey-build/parity/target/release/ethkey /bin/ethkey

ENTRYPOINT ["ethkey"]

