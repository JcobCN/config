openssl genrsa -out private.key 2048
openssl req -new -key private.key -out csr.csr

openssl x509 -req -in csr.csr -signkey private.key -out certificate.crt -days 3650
