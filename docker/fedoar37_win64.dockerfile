FROM fedora:37

# Please keep this list sorted alphabetically
ENV PACKAGES \
    bc \
    bzip2 \
    ccache \
    diffutils \
    findutils \
    gcc \
    gettext \
    git \
    hostname \
    make \
    meson \
    mingw32-nsis \
    mingw64-bzip2 \
    mingw64-curl \
    mingw64-glib2 \
    mingw64-gmp \
    mingw64-gtk3 \
    mingw64-libffi \
    mingw64-libjpeg-turbo \
    mingw64-libpng \
    mingw64-libtasn1 \
    mingw64-libusbx \
    mingw64-pixman \
    mingw64-pkg-config \
    perl \
    perl-Test-Harness \
    python3 \
    python3-PyYAML \
    tar \
    which

RUN dnf install -y $PACKAGES
RUN rpm -q $PACKAGES | sort > /packages.txt

# Specify the cross prefix for this image (see tests/docker/common.rc)
ENV QEMU_CONFIGURE_OPTS --cross-prefix=x86_64-w64-mingw32- --disable-capstone
