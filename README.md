# ZHAW CAS Machine Intelligence

# Module: Deep Learning

# Year: 2023


# Local Setup

    # Versions
	Python 3.9
	Tensorflow 2.8.2
	CUDA 11.2
	CUDNN 8.0
	skimage < 0.19
	sklearn < 1.0.0
	numpy < 1.23

    # 1. create env
    conda create -n cas_main_dl python=3.9
    conda activate cas_main_dl

    # 2. install packages
	# a) Windows
	conda install -c conda-forge cudatoolkit=11.2 cudnn=8.1.0 # GPU on windows
    pip install 'tensorflow==2.8.2' tensorflow-datasets notebook ipywidgets
    pip install matplotlib "scikit-learn<1.0.0" pandas tqdm "scikit-image<0.19" "numpy<1.23.0"  wget
	# b) Linux
	# TODO ...
	


## Run directly in Colab

(click on the links below to open the notebooks directly in Google Colab, NOT on the files within Github)

https://colab.research.google.com/github/fpschill/cas_main_dl_2023/blob/master/00_test.ipynb

https://colab.research.google.com/github/fpschill/cas_main_dl_2023/blob/master/01_mnist.ipynb

https://colab.research.google.com/github/fpschill/cas_main_dl_2023/blob/master/02_theory.ipynb

https://colab.research.google.com/github/fpschill/cas_main_dl_2023/blob/master/03_theory_2.ipynb

https://colab.research.google.com/github/fpschill/cas_main_dl_2023/blob/master/04_1_simpsons_datagen.ipynb

https://colab.research.google.com/github/fpschill/cas_main_dl_2023/blob/master/04_2_simpsons_classification.ipynb

https://colab.research.google.com/github/fpschill/cas_main_dl_2023/blob/master/04_3_simpsons_classification_cnn.ipynb




