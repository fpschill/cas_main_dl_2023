# ZHAW CAS Machine Intelligence

# Module: Deep Learning (2023)

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

	# 2. install CUDA (if GPU available)
	# a) Windows
	conda install -c conda-forge cudatoolkit=11.2 cudnn=8.1.0
	# b) Linux
	conda install -y -c conda-forge cudatoolkit=11.2.2 
	pip install nvidia-cudnn-cu11

    # 3. install tensorflow
    pip install 'tensorflow==2.8.2' tensorflow-datasets 'tensorflow-addons==0.18.0'

	# 4. install extra libs
	pip install matplotlib "scikit-learn<1.0.0" pandas tqdm "scikit-image<0.19" "numpy<1.23.0"  wget notebook ipywidgets
	
	
For detailed installation instructions, see https://www.tensorflow.org/install/pip


# Run directly in Colab

If you have cloned the repository, you can run a notebook directly in Google Colab by using a link like this:

https://colab.research.google.com/github/(YOUR_GITHUB_ID)/cas_main_dl_2023/blob/master/01_mnist.ipynb

