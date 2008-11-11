#! /bin/bash

#
# Installs Smarty the the PHP include directory if it is not installed and
# adds the required PEAR packages
#
# PHPDIR 
#	Configuration directory for PHP
#
# SMARTYDIR
# 	Directory to store Smarty
#
# $Id$
#

PHPDIR=`pear config-get php_dir`
SMARTYDIR="$PHPDIR/Smarty"
if [ ! -d $SMARTYDIR ]
then
    wget http://www.smarty.net/do_download.php?download_file=Smarty-2.6.20.tar.gz
    tar -zxf Smarty-2.6.20.tar.gz
    mkdir $SMARTYDIR
    mv Smarty-2.6.20/libs/* $SMARTYDIR
    rm Smarty-2.6.20.tar.gz
    rm -rf Smarty-2.6.20
fi

## Install PEAR packages
pear upgrade pear
pear install --onlyreqdeps DB
pear install --onlyreqdeps XML_RSS
