FROM alpine:3.12.1


RUN apk add --no-cache \
    build-base \
    linux-headers \
    ncurses \
    m4 \
    bash \
    emacs-x11

# Install MIT Scheme
# https://www.gnu.org/software/mit-scheme/documentation/stable/mit-scheme-user/Unix-Installation.html

ADD https://ftp.gnu.org/gnu/mit-scheme/stable.pkg/10.1.11/mit-scheme-10.1.11-x86-64.tar.gz /
RUN tar -zxf mit-scheme-10.1.11-x86-64.tar.gz
       
WORKDIR mit-scheme-10.1.11/
RUN cd src && ./configure && make && make install

# Install Mechanics (SCMUTILS)
# https://groups.csail.mit.edu/mac/users/gjs/6946/installation.html

WORKDIR /

ADD https://groups.csail.mit.edu/mac/users/gjs/6946/scmutils-20200810.tar.gz /
RUN tar -zxf scmutils-20200810.tar.gz

WORKDIR scmutils-20200810
RUN ./install.sh && cp mechanics.sh /usr/local/bin/

ENTRYPOINT ["mechanics.sh"]


