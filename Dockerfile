# ------------------------------------------
# Environment: ubuntu 18.04
# Minimum Panel Version: 1.0
#
# A SneakyHub Fork Egg (Forked but Modified)
# ------------------------------------------

FROM httpd:2.4

# File Author / Maintainer
LABEL author="SneakyHub" maintainer="sneaky@sneakyhub.com"
ENV   DEBIAN_FRONTEND noninteractive

# Install area

RUN apt install apache2 php

## add container user
RUN   useradd -m -d /home/container -s /bin/bash container

COPY  ./entrypoint.sh /entrypoint.sh
CMD   ["/bin/bash", "/entrypoint.sh"]
