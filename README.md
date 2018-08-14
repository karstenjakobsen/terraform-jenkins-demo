# Jenkins/Consul pipeline for Terraform

## Steps for running demo

### Start Consul server/node

``` sh consul_run.sh ```

### Create SSH key on host with no password

``` 
ssh-keygen -t rsa
```

root@odn1-test01:~# ssh-keygen -t rsa
Generating public/private rsa key pair.
Enter file in which to save the key (/root/.ssh/id_rsa):
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /root/.ssh/id_rsa.
Your public key has been saved in /root/.ssh/id_rsa.pub.
The key fingerprint is:
63:05:7f:19:ec:d0:26:cd:33:cf:a6:cf:b0:c1:f1:67 root@localhost.localdomain
The key's randomart image is:
+--[ RSA 2048]----+
| . =. |
| oo Oo |
| o=o= |
| . .o + |
| S . = |
| . . = . E|
| * o |
| . o |
| |
+-----------------+
root@odn1-test01:~# ^C
``` 

### Add deployment key to Github

Add the ``` /root/.ssh/id_rsa.pub ``` to your deploy keys on Github

### Start Jenskins ###

``` sh jenkins_run.sh ```

### Find one time password for Jensings GUI

docker logs -f jenkins-docker

### Login into Jenkins GUI

http://xx.xx.xx.xx:8080/
