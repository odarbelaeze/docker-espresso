FROM alpine as builder
RUN wget https://github.com/QEF/q-e/archive/qe-6.4.zip && unzip qe-6.4.zip
WORKDIR /q-e-qe-6.4/
RUN apk add --no-cache bash alpine-sdk gfortran
RUN ./configure && make all -j8
FROM alpine
RUN apk add --no-cache libgcc libgfortran
COPY --from=builder /q-e-qe-6.4/bin/*.x /usr/local/bin/
