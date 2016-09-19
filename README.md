# Docker image for sflowtrend
---

#### Start container

##### Docker Compose (preferred)
```
docker-compose up -d
```
#### Docker run
```
docker run -p 8087:8087 -p 8443:8443 -p 6343:6343/udp jcpowermac/sflowtrend
```

---

#### [Example](http://openvswitch.org/support/config-cookbooks/sflow/)

Configuration Variables
```
export COLLECTOR_IP=10.53.4.99
export COLLECTOR_PORT=6343
export AGENT_IP=eth0
export HEADER_BYTES=128
export SAMPLING_N=64
export POLLING_SECS=10
```

Configure Open vSwitch for sflow
```
ovs-vsctl -- --id=@sflow create sflow agent=${AGENT_IP} target=\"${COLLECTOR_IP}:${COLLECTOR_PORT}\" header=${HEADER_BYTES} sampling=${SAMPLING_N} polling=${POLLING_SECS} -- set bridge br0 sflow=@sflow
```
