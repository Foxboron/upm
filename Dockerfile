FROM alpine:3.9

COPY scripts/docker-install-build.sh /tmp/docker-install-build.sh
RUN /tmp/docker-install-build.sh
COPY . /upm
RUN make -C /upm upm

FROM alpine:3.9
COPY --from=0 /upm/cmd/upm/upm /usr/local/bin/upm