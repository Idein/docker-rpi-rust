
FROM resin/rpi-raspbian:stretch-20180228

ARG RUST_CHANNEL=stable

ENV PATH /root/.cargo/bin:$PATH

RUN apt-get update -y \
 && apt-get install -y git \
 && mkdir /source \
 && curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain ${RUST_CHANNEL} \
 && rustup component add rustfmt-preview \
 && apt-get remove -y \
 && rm -rf /var/lib/apt/lists \
 && rm -rf /var/cache/apt/archives

WORKDIR /source
CMD ["bash"]
