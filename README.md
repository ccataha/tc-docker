# tc-docker

tc-docker is a combination of tc + tcconfig + docker. You can read the [docs here](https://pypi.org/project/tcconfig/#usage) and [here](https://access.redhat.com/documentation/ru-ru/red_hat_enterprise_linux/8/html/configuring_and_managing_networking/linux-traffic-control_configuring-and-managing-networking)   

## Advantages

- You can use a container as a temporary solution to apply tc rules
- All you need to install on the host machine is docker
- When the container is turned off, the rules are turned off too

## Usage

The case described in the entrypoint.sh file describes the use of a traffic limiter for certain IP addresses. Just use tcconfig commands inside entrypoint.sh
