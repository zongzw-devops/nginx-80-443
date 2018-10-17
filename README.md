# nginx-80-443

This is a repo for running nginx in automation way to expose both 80 and 443

**run-nginx.sh**: the main entry to start docker container, one parameter need.

**settings**: the template for running container. Copy the template to your local version and edit it. the variables are well commented.
    
**conf.d**: 2 configuration files for 80 and 443, addons, plus generated server.crt and server.key. 
 * The folder has been well organized. 
 * Add more addons of yourself by editting **addons.conf**, and putting addon files under **addons/**.


## Usage: 

_*** Make sure you have installed docker_

```
git clone https://github.com/zongzw/nginx-80-443.git

cd nginx-80-443
chmod +x nginx-80-443.sh

cp setttings settings.localserver
<edit settings.localserver>

./nginx-80-443.sh settings.localserver 
```

### Verify: 
```
curl http://localhost:80
curl -k https://localhost:443
```

If no webroot is set in your settings file, it responses with: `"Nginx Running \<container id>"`

Otherwise, it returns web contents.
