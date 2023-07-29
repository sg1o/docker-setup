FROM ubuntu

ARG USERNAME=sergio
ARG USER_UID=1000
ARG USER_GID=$USER_UID


RUN apt update
RUN apt -y upgrade

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME
RUN apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

### Once the user configuration and system update are ready, you can customize the image.

RUN apt install -y curl git bash-completion neovim
RUN echo "source /etc/profile.d/bash_completion.sh" >> /home/$USERNAME/.bashrc
RUN echo "PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h:\[\033[1;35m\]\w\[\033[1;31m\]\$\[\033[0m\]'" >> /home/$USERNAME/.bashrc

### Set normal user and configuration with unprivileged permissions.
USER $USERNAME
WORKDIR /home/$USERNAME
RUN mkdir -p /home/$USERNAME/.config/nvim/
COPY ./configfiles/init.vim /home/$USERNAME/.config/nvim/init.vim
