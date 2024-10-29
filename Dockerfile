FROM elyra/kernel-py:3.2.3

USER root

# install chinese font
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  fonts-noto-cjk

COPY requirements.txt .

RUN python -m pip install --no-cache-dir -r requirements.txt
RUN mplfonts init

USER $NB_UID
RUN mkdir -p /home/jovyan/.ipython/profile_default/startup/
