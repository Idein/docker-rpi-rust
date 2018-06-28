
FROM resin/rpi-raspbian:stretch-20180228

ARG RUST_CHANNEL=stable

ENV PATH /root/.cargo/bin:$PATH

RUN apt-get -y update \
 && apt-get -y install --no-install-recommends git \
 && mkdir /source \
 && curl -sSfL https://sh.rustup.rs > rustup.sh \
 && sh rustup.sh -y --default-toolchain ${RUST_CHANNEL} \
 && curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain ${RUST_CHANNEL} \
 && rustup component add rustfmt-preview \
 && apt-get remove -y \
 && rm -rf /var/lib/apt/lists \
 && rm -rf /var/cache/apt/archives

WORKDIR /source
CMD ["bash"]
