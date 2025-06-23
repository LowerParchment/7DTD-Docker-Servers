FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

# Install required libraries + SteamCMD dependencies
RUN apt-get update && apt-get install -y \
    lib32gcc-s1 lib32stdc++6 \
    ca-certificates curl wget unzip software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# Install SteamCMD
RUN mkdir -p /steamcmd && \
    cd /steamcmd && \
    curl -sSL https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz | tar -xz

ENV PATH="/steamcmd:${PATH}"

# Copy scripts and configs
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Optional: include a default serverconfig.xml
COPY serverconfig.xml /app/serverconfig.xml

EXPOSE 26900-26902/udp
EXPOSE 8081/tcp

VOLUME ["/app", "/root/.local/share/7DaysToDie"]

ENTRYPOINT ["/start.sh"]
