FROM elyra/kernel-py:3.2.3

USER root

# install chinese font
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  fonts-noto-cjk

COPY requirements.txt .

RUN python -m pip install --no-cache-dir -r requirements.txt
RUN mplfonts init
# set chinese font for matplotlib
RUN MATPLOTLIBRC=$(python -c "import matplotlib; print(matplotlib.matplotlib_fname())") && \
    sed -i 's/\s*font.family\s*:\s*sans-serif\s*/font.family: Noto Serif CJK SC, sans-serif/' $MATPLOTLIBRC

USER $NB_UID
RUN mkdir -p /home/jovyan/.ipython/profile_default/startup/
