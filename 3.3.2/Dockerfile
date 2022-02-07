FROM jupyter/datascience-notebook:ubuntu-20.04

LABEL mantainer="Jose Luis Bracamonte Amavizca <luisjba@gmail.com>"

# Set the targer GDAL version
ENV GDAL_VERSION 3.3.2

# Use the root user to install
USER root

# System update and upgrade
RUN apt-get update && apt-get upgrade -y 

# install software-properties-common
RUN apt-get install -y software-properties-common

# Add the PPA to the sources
RUN add-apt-repository ppa:ubuntugis/ppa \
    && apt-get update

# Existing binutils causes a dependency conflict, correct version will be installed when GDAL gets intalled
RUN apt-get remove -y binutils

# Install GDAL/OGR package
RUN apt-get install -y gdal-bin=${GDAL_VERSION}+dfsg-2~focal2

# Install GDAL development libraries
RUN apt-get install -y libgdal-dev=${GDAL_VERSION}+dfsg-2~focal2 g++

# cleanup cahe dependencies for apt
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Update C env vars so compiler can find gdal
ENV CPLUS_INCLUDE_PATH=/usr/include/gdal
ENV C_INCLUDE_PATH=/usr/include/gdal

# change to the notebook user before install any python package 
USER $NB_UID

# This will install GDAL
RUN pip install --upgrade pip && \
    pip install GDAL==${GDAL_VERSION}


