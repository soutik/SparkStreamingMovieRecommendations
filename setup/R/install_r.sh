#!/bin/bash

# Dependency: run install_python.sh
# Assumes that Python and Jupyter has been installed
sudo sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list'
gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -

sudo apt-get -y update

sudo apt-get -y install r-base r-cran-rjava libzmq3-dev libcurl4-openssl-dev libpq-dev gdebi-core

sudo chmod o+w /usr/local/lib/R/site-library
Rscript /vagrant/setup/R/install_r_packages.R

wget https://download2.rstudio.org/rstudio-server-0.99.902-amd64.deb
echo "y" | sudo gdebi rstudio-server-0.99.902-amd64.deb
rm rstudio-server-0.99.902-amd64.deb
sudo rstudio-server stop

