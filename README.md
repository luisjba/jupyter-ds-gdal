# Daocker Jupyter Datascience Notebook with GDAL

ADocker container of  Jupyter Datascience notebook with GDAL/OGR library. Contains the installation
and compilation of the latets version of GDAL/OGR so that you can impor the library in the in your Python Code runnin the Jupyter Notebook using Docker.

Thid image is public ans can be downloaded from docker hub and inspect the [source code in Github](https://github.com/luisjba/jupyter-ds-gdal). To download 
the image in your local computer, use the followinf command.

```bash
docker pull luisjba/jupyter-ds-gdal:3.3.2
```


## Quick usage

For quick usage of this docker image, clone the project from github and run the 
ready to go docker-compose file and execute them.

Donwloading the repo
```bash
git clone https://github.com/luisjba/jupyter-ds-gdal.git
```

Run the container with `docker-compose up` inside the directory `jupyter-ds-gdal` as follow.

```bash
cd jupyter-ds-gdal
docker-compose up
```

Now, you have a Jupyter notebook running with the GDAL/OGR, just copy and paste 
one of these URLs thta contains the token value and paste it into your browser.

## Try It Out, Importing the GDAL/OGR libraries

Open a jupyter notebook or import any python file (must be in the work directory to be visible in the notebook) and import the libraries.

```python
# standard imports
import sys

# import OGR
from osgeo import ogr

# use OGR specific exceptions
ogr.UseExceptions()

# get the driver
driver = ogr.GetDriverByName("OpenFileGDB")

# opening the FileGDB
try:
    gdb = driver.Open(gdb_path, 0)
except Exception, e:
    print e
    sys.exit()

# list to store layers'names
featsClassList = []

# parsing layers by index
for featsClass_idx in range(gdb.GetLayerCount()):
    featsClass = gdb.GetLayerByIndex(featsClass_idx)
    featsClassList.append(featsClass.GetName())

# sorting
featsClassList.sort()

# printing
for featsClass in featsClassList:
    print featsClass

# clean close
del gdb
```
