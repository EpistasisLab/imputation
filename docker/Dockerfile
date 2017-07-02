FROM rocker/rstudio

# R for plotting
RUN R -e "install.packages('ggplot2')"
RUN R -e "install.packages('reshape2')"
RUN R -e "install.packages('gplots')"
RUN R -e "install.packages('RColorBrewer')"
RUN R -e "install.packages('gridExtra')"
RUN R -e "install.packages('mgcv')"
RUN R -e "install.packages('dplyr')"

# Python for imputation
RUN apt-get update && apt-get install -y \
    software-properties-common
RUN apt-get update && apt-get install -y \
    apache2 \
    curl \
    git \
    python2.7 \
    python-pip

# cpu tensorflow - should get gpu if doing heavy lifting
RUN pip install numpy pandas h5py sklearn
RUN pip install tensorflow keras fancyimpute

# R for imputation
RUN R -e "install.packages('mice')"
