FROM alpine as builder
ARG version=6.4
RUN wget https://github.com/QEF/q-e/archive/qe-$version.zip && unzip qe-$version.zip
RUN apk add --no-cache bash alpine-sdk gfortran
RUN cd q-e-qe-$version && ./configure && make all
FROM alpine
RUN apk add --no-cache libgcc libgfortran
COPY --from=builder /q-e-qe-$version/bin/*.x /usr/local/bin/
