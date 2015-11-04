FROM thalhalla/steamer
MAINTAINER James S. Moore <james 'at' webtechhq com>

USER root
ENV DCVersion 2015110401

# expose ARK: Survival Evolved ports
EXPOSE 7777
EXPOSE 27015

# override these variables in your Dockerfile
ENV STEAM_USERNAME anonymous
ENV STEAM_PASSWORD ' '
ENV STEAM_GUARD_CODE ' '

# and override this file with the command to start your server
USER root
RUN echo 'new-session' >> ~/.tmux.conf

# import custom ARK config
#ADD ./serverconfig_template.xml /home/steam/serverconfig_template.xml
ADD ./run.sh /run.sh
RUN chmod 755 /run.sh

# Override the default start.sh
ADD ./start.sh /start.sh
RUN chmod 755 /start.sh
RUN gpasswd -a steam tty

# setup steam user / default configs
USER steam
RUN echo 'new-session' >> ~/.tmux.conf
WORKDIR /home/steam
RUN wget http://gameservermanagers.com/dl/arkserver
RUN chmod +x arkserver

ENTRYPOINT ["/start.sh"]
