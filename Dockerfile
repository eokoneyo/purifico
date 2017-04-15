#add our base image
FROM ubuntu:trusty

#set image to terminal only
ENV TERM xterm

#update apt repositories and install lldb, perf and other dependencies
RUN apt-get update && apt-get install -y build-essential \
    git \
    ldb-3.8 \
    lldb-3.8-dev \
    python-pip \
    linux-tools-common \
    linux-tools-generic

RUN pip install six

#set temp directory as working directory
RUN cd /tmp
WORKDIR /tmp

#Clone the llnode repo so that we can setup llnode on the image to use with lldb
RUN git clone https://github.com/nodejs/llnode.git

#switch to the llnode directory
RUN cd llnode
WORKDIR /tmp/llnode

#clone gyp tool into directory
RUN git clone https://chromium.googlesource.com/external/gyp.git tools/gyp

# Configure
RUN ./gyp_llnode -Dlldb_dir=/usr/lib/llvm-3.8/

# Build
RUN make -C out/ -j9

# Install
RUN make install-linux

#make lldb-3.8 available in bash also as lldb
RUN echo "alias lldb='lldb-3.8'" >> ~/.bash_aliases

# Creating base "src" directory where the source repo will reside in our container.
# Code is copied from the host machine to this "src" folder in the container as a last step.
RUN mkdir /src
WORKDIR /src

# Copy entire project directory to docker
COPY . /src

CMD ["bash"]