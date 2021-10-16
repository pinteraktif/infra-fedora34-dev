FROM fedora:34

LABEL maintainer="Wu Assassin <jambang.pisang@gmail.com>"
LABEL org.opencontainers.image.source=https://github.com/pinteraktif/infra-fedora34-dev

### Arguments & Environments

ENV LC_ALL="C.UTF-8"
ENV PYTHONIOENCODING="utf-8"
ENV PATH="/root/.cargo/bin${PATH:+:}${PATH}"

### Install system packages

RUN dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-34.noarch.rpm && \
    dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-34.noarch.rpm && \
    dnf upgrade -y && \
    dnf install -y \
    aria2 \
    atlas-devel \
    atlas-static \
    autoconf \
    automake \
    bash-completion \
    bpytop \
    byobu \
    bzip2 \
    ceres-solver-devel \
    clang \
    clang-devel \
    clang-libs \
    clang-resource-filesystem \
    clang-tools-extra \
    cmake \
    compiler-rt \
    cpufetch \
    cyrus-sasl-devel \
    docker-compose \
    dotnet \
    doxygen \
    eigen3-devel \
    elfutils-devel \
    faac-devel \
    fdk-aac-devel \
    ffmpeg-devel \
    freeimage-devel \
    g++ \
    gcc \
    gdal-devel \
    gflags-devel \
    giflib-devel \
    git \
    git-clang-format \
    glog-devel \
    gnutls-devel \
    gpgme-devel \
    gstreamer1-devel \
    gstreamer1-libav \
    gstreamer1-plugin* \
    gstreamer1-rtsp* \
    gstreamer1-svt-av1 \
    gstreamer1-svt-vp9 \
    gstreamer1-vaapi \
    gstreamer1-vaapi-devel \
    gtk3-devel \
    gtkglext-devel \
    hdf5-devel \
    hdf5-static \
    htop \
    jack-audio-connection-kit-devel \
    lame-devel \
    lapack \
    lapack-devel \
    lapack-static \
    lapack64 \
    libaom-devel \
    libass-devel \
    libavc1394-devel \
    libclc-devel \
    libdav1d-devel \
    libdc1394-devel \
    libdrm-devel \
    libgeotiff-devel \
    libglvnd-devel \
    libgpg-error-devel \
    libgphoto2-devel \
    liblas-devel \
    libomp \
    libpng-devel \
    libpng12-devel \
    libraw1394-devel \
    librsvg2-devel \
    libsass-devel \
    libsodium-devel \
    libssh2-devel \
    libtheora-devel \
    libtiff-devel \
    libtool \
    libunistring-devel \
    libv4l-devel \
    libva-devel \
    libvdpau-devel \
    libvorbis-devel \
    libvpx-devel \
    libwebp-devel \
    libzstd-devel \
    libzstd-devel \
    libzstd-static \
    lld \
    llvm-devel \
    llvm-libs \
    llvm-static \
    lshw \
    make \
    mesa-libEGL-devel \
    meson \
    mono-devel \
    musl-clang \
    musl-devel \
    musl-filesystem \
    musl-gcc \
    musl-libc \
    musl-libc-static \
    mycli \
    nasm \
    ncdu \
    ninja-build \
    nodejs \
    numactl-devel \
    nv-codec-headers \
    openblas-devel \
    openblas-openmp \
    openblas-static \
    openblas-threads \
    opencore-amr-devel \
    openjpeg-devel \
    openjpeg2-devel \
    openmpi \
    openssl-devel \
    opus-devel \
    p7zip \
    p7zip-plugins \
    PackageKit-command-not-found \
    pciutils \
    perl-FindBin \
    pinentry \
    polly-devel \
    protobuf-devel \
    psutils \
    pylint \
    python3-beautifulsoup4 \
    python3-black \
    python3-clang \
    python3-devel \
    python3-flake8 \
    python3-numpy \
    python3-pip \
    python3-setuptools \
    python3-virtualenv \
    python3-wheel \
    SDL2-devel \
    svt-av1-devel \
    tar \
    tbb-devel \
    tesseract-devel \
    texinfo \
    unzip \
    v4l-utils \
    vid.stab-devel \
    vim \
    wget \
    x264 \
    x264-devel \
    x265-devel \
    xine-lib-devel \
    xvidcore-devel \
    yasm \
    zlib-static

### Rust 1.55.0

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain stable -y && \
    rustup toolchain add nightly && \
    rustup default 1.55.0 && \
    rustup target add x86_64-unknown-linux-musl && \
    rustup update

### Cleanup

RUN rm -rf /app && \
    dnf clean all
