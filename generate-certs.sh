#!/bin/bash

mkdir -p certs

openssl genrsa -out certs/ca.key 4096
openssl req -x509 -new -sha512 -noenc \
-key certs/ca.key -days 3653 \
-config ca.conf \
-out certs/ca.crt

certs=(
    "clustermesh-server" "clustermesh-admin" "clustermesh-client"
)

for i in ${certs[*]}; do
  openssl genrsa -out "certs/${i}.key" 4096

  openssl req -new -key "certs/${i}.key" -sha256 \
    -config "ca.conf" -section ${i} \
    -out "certs/${i}.csr"
  
  openssl x509 -req -days 3653 -in "certs/${i}.csr" \
    -copy_extensions copyall \
    -sha256 -CA "certs/ca.crt" \
    -CAkey "certs/ca.key" \
    -CAcreateserial \
    -out "certs/${i}.crt"
done