FROM debian

RUN apt-get update && apt-get install -y build-essential bc python \
			bison flex \
			rsync libelf-dev \
			libssl-dev libncurses-dev \
			dwarves
RUN apt-get update && apt-get install -y ccache git 

WORKDIR /

RUN git clone --depth 1 \ 
	https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

RUN cd linux && ccache make x86_64_defconfig && ccache make
