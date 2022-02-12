FROM python:3.10.2
USER root

RUN apt-get update && \
    apt-get -y install \
    locales \
    vim \
    less
RUN localedef -f UTF-8 -i ja_JP ja_JP.UTF-8 
RUN pip install --upgrade \
    pip \
    setuptools

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm

ARG UID=1000
ARG USERNAME=user
ARG GID=1000
ARG GROUPNAME=user
# ENV UID=${UID}
# ENV USERNAME=${USERNAME}}
# ENV GID=$GID}
# ENV GROUPNAME=${GROUPNAME}
# RUN groupadd -g ${GID} ${GROUPNAME}
RUN useradd -m -s /bin/bash -u ${UID} -g ${GID} ${USERNAME}
USER ${USERNAME}
WORKDIR /home/${USERNAME}/
