#Download base image ubuntu 16.04
FROM ubuntu:16.04

# Add a new user "trainee"
RUN useradd -m trainee -s /bin/bash && \
    echo "trainee:linux_bash" | chpasswd

# Update Ubuntu Software repository
RUN apt-get update && \
    apt-get upgrade --yes

# Install ttyd & dependencies
RUN mkdir /usr/bin/ttyd && \
    apt-get install -y wget git tree ssh nano sudo nmap man tmux jq curl uuid-runtime && \
    usermod -aG sudo trainee && \
    wget --directory-prefix=/usr/bin/ttyd https://github.com/tsl0922/ttyd/releases/download/1.6.0/ttyd_linux.x86_64 && \
    chmod +x /usr/bin/ttyd/ttyd_linux.x86_64

# Copy exercices into the image
COPY content /home/trainee/

# Change folder permissions to allow people to modify it
# Set lock permissions for exercise 6
# Copy solutions of exercises in hidden spots
RUN chown -R trainee /home/trainee/ && \
    chmod -R 774 /home/trainee/ && \
    chown root:root /home/trainee/exercise_6/the_locked_file && \
    chmod 000 /home/trainee/exercise_6/the_locked_file && \
    mkdir /bin/abstergo && \
    mkdir /bin/glados && \
    mkdir /bin/piper && \
    mkdir /bin/blizzard && \
    mkdir /bin/acme && \
    mv /home/trainee/solutions/exercise_2 /bin/glados && \
    mv /home/trainee/solutions/exercise_3 /bin/acme && \
    mv /home/trainee/solutions/exercise_4 /bin/blizzard && \
    mv /home/trainee/solutions/exercise_5 /bin/piper && \
    mv /home/trainee/solutions/exercise_7 /bin/abstergo && \
    rm -rf /home/trainee/solutions

# Change to non-root privilege
USER trainee
WORKDIR /home/trainee

EXPOSE 1994
ENTRYPOINT ["/usr/bin/ttyd/ttyd_linux.x86_64", "-p", "1994", "-c", "linux_bash:linux_bash", "bash"]
