FROM mikewangwzhl/vidil 
COPY  dev_run.sh /run.sh
WORKDIR /tmp
RUN CODE_SERVER_VERSION=4.1.0 && \
    ARCH="$(dpkg --print-architecture)" && \
    curl -fOL https://github.com/cdr/code-server/releases/download/v${CODE_SERVER_VERSION}/code-server_${CODE_SERVER_VERSION}_${ARCH}.deb

RUN CODE_SERVER_VERSION=4.1.0 && \
    ARCH="$(dpkg --print-architecture)" && \
    dpkg -i ./code-server_${CODE_SERVER_VERSION}_${ARCH}.deb && rm ./code-server_${CODE_SERVER_VERSION}_${ARCH}.deb
RUN pip install -U jupyterlab
ENV PYTHONUNBUFFERED=TRUE
ENV PYTHONDONTWRITEBYTECODE=TRUE
EXPOSE 8888
# Set up the program in the image
WORKDIR /notebooks
