FROM jupyter/datascience-notebook:ubuntu-20.04

LABEL mantainer="Jose Luis Bracamonte Amavizca <luisjba@gmail.com>"

# Use the root user to install
USER root

# System update and upgrade
RUN apt-get update && apt-get upgrade -y 

# install software-properties-common
RUN apt-get install -y software-properties-common

# Add the PPA to the sources
RUN add-apt-repository ppa:ubuntugis/ppa \
    && apt-get update

# Install GDAL/OGR package
RUN apt-get install -y gdal-bin

# cleanup cahe dependencies for apt
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the GDAL_VERSION from OGRINFO
ENV GDAL_VERSION $(ogrinfo --version | awk '{print $2}' | sed 's/,//')

# change to the notebook user    
USER $NB_UID

# Update C env vars so compiler can find gdal
ENV CPLUS_INCLUDE_PATH=/usr/include/gdal
ENV C_INCLUDE_PATH=/usr/include/gdal

# This will install GDAL
RUN pip install --upgrade pip && \
    pip install GDAL==${GDAL_VERSION}
