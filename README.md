## vernemq 

Simple Dockerfile and configuration to get vernemq up and running. We are using [CapRover](https://caprover.com/) to handle the deployment in a DigitalOcean droplet.

We creating an auth file and setting one user/password for clients.

You should set the following environment variables in your app dashboard:

* `MQTT_AUTH_PASS`: Username 
* `MQTT_AUTH_USER`: Password

Then you need to enable port mapping for these ports:

* 1883
* 8080
* 8883

You will need to enable access to ports adding new rules to your droplet's firewall:

```
ufw allow 1883,4369,8080,8883/tcp
```