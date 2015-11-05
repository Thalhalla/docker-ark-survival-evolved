FROM thalhalla/steamer
MAINTAINER James S. Moore <james 'at' ohmydocker com>

USER root

# expose ARK: Survival Evolved ports
EXPOSE 7777
EXPOSE 27015

# override these variables in your Dockerfile
ENV STEAM_USERNAME anonymous
ENV STEAM_PASSWORD ' '
ENV STEAM_GUARD_CODE ' '

# setup root tmux config
RUN echo 'new-session' >> ~/.tmux.conf	

# add some tools for testing
RUN apt-get update \
    && apt-get -yq install vim less

# import ARK server
WORKDIR /home/steam
ADD http://gameservermanagers.com/dl/arkserver ./ShooterGameServer
RUN chmod 755 ShooterGameServer

# import custom ARK config
#COPY ./serverconfig_template.xml /home/steam/serverconfig_template.xml
COPY ./run.sh /run.sh
RUN chmod 755 /run.sh

# Override the default start.sh
COPY ./start.sh /start.sh
RUN chmod 755 /start.sh

# setup steam user/group and default tmux session
RUN gpasswd -a steam tty
USER steam
RUN echo 'new-session' >> ~/.tmux.conf

ENTRYPOINT ["/start.sh"]
