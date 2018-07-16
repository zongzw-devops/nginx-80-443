# nginx-80-443

This is a repo for running nginx in automation way to expose both 80 and 443

gen-certs: Generate server.[crt|key]
    gen-cert-chain-key.sh: just run it to generate.
    gen-cert-chain-key.sh.log: the running logs, please notice the first line.
    
conf.d: 2 configuration files for 80 and 443, plus generated server.crt and server.key. No optimization for ssl yet.

nginx-443-80.sh: The docker command to run nginx server as a container.
