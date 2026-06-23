FROM mambaorg/micromamba:1.5.8-lunar
COPY --chown=$MAMBA_USER:$MAMBA_USER ./cinful_env.yml /tmp/cinful_env.yml
RUN micromamba install -y -n base -f /tmp/cinful_env.yml \
    && micromamba install -y -n base conda-forge::procps-ng \
    && micromamba clean -a -y \
    && cat ./cinful/input/CvaB.verified.pep /opt/conda/lib/python3.8/site-packages/cinful/input/CvaB.verified.pep 
USER root
ENV PATH="$MAMBA_ROOT_PREFIX/bin:$PATH"
