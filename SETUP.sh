#!/usr/bin/env bash
## Script to download and setup data.

echo -e "\nRUNNING SETUP.sh\n\n"

vggFile="vgg16_weights_th_dim_ordering_th_kernels.h5"
if [ -f "$vggFile" ];
	then
	echo -e "$vggFile exists.\n"
else
	echo -e "$vggFile not found. Downloading...\n"
	wget https://github.com/fchollet/deep-learning-models/releases/download/v0.1/vgg16_weights_th_dim_ordering_th_kernels.h5
fi
echo

gloveFile="glove.6B.50d.txt"
if [ -f "$gloveFile" ];
	then
	echo -e "$gloveFile exists.\n"
else
	echo -e "$gloveFile not found. Downloading...\n"
	wget http://nlp.stanford.edu/data/glove.6B.zip
	echo -e "Extracting...\n"
	unzip glove.6B.zip
fi
echo

featsDir="processed_features"
if [ -d "$featsDir" ];
	then
	echo -e "$featsDir exists.\n"
else
	mkdir $featsDir
	echo -e "Created $featsDir\n"
fi

snapsDir="snapshots"
if [ -d "$snapsDir" ];
	then
	echo -e "$snapsDir exists.\n"
else
	mkdir $snapsDir
	echo -e "Created $snapsDir\n"
fi

echo -e "DONE\nFollow steps listed under SETUP in README.md"
echo -e "\n_scrape_and_preprocess_captions.py will ask to continue after every 150 images in the process of downloading 1000 images. If you wish to download all without interruption, comment lines 135 to 139(both inclusive) in _scrape_and_preprocess_captions.py\n"
