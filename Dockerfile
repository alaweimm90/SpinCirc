# SpinCirc Docker Container
# Production-ready container for SpinCirc computational spintronics framework

FROM mathworks/matlab:r2024b

# Metadata
LABEL maintainer="Dr. Meshal Alawein <meshal@berkeley.edu>"
LABEL description="SpinCirc: Advanced Spin Transport Circuit Framework"
LABEL version="1.0.0"
LABEL org.opencontainers.image.source="https://github.com/meshal-alawein/SpinCirc"

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV SPINCIRC_ROOT=/opt/spincirc
ENV MATLAB_ROOT=/opt/matlab
ENV PYTHONPATH=${SPINCIRC_ROOT}/python:$PYTHONPATH

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    git \
    curl \
    wget \
    unzip \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Create SpinCirc directory
RUN mkdir -p ${SPINCIRC_ROOT}
WORKDIR ${SPINCIRC_ROOT}

# Copy SpinCirc framework
COPY matlab/ ./matlab/
COPY python/ ./python/
COPY verilogA/ ./verilogA/
COPY examples/ ./examples/
COPY data/ ./data/
COPY docs/ ./docs/
COPY LICENSE ./
COPY README.md ./
COPY CONTRIBUTING.md ./

# Install Python dependencies
RUN python3 -m pip install --upgrade pip && \
    python3 -m pip install \
    numpy \
    scipy \
    matplotlib \
    pandas \
    h5py \
    jupyter \
    pytest \
    sphinx \
    sphinx-rtd-theme

# Set up MATLAB path and verify installation
RUN echo "addpath(genpath('${SPINCIRC_ROOT}/matlab'));" > /opt/matlab/toolbox/local/startup.m && \
    echo "berkeley();" >> /opt/matlab/toolbox/local/startup.m && \
    echo "fprintf('SpinCirc framework loaded successfully!\\n');" >> /opt/matlab/toolbox/local/startup.m

# Create non-root user
RUN useradd -m -s /bin/bash spincirc && \
    chown -R spincirc:spincirc ${SPINCIRC_ROOT}

USER spincirc

# Set working directory
WORKDIR ${SPINCIRC_ROOT}

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD python3 -c "import numpy, scipy, matplotlib; print('Python OK')" || exit 1

# Default command
CMD ["/bin/bash"]

# Build instructions:
# docker build -t spincirc:latest .
# docker run -it --rm -v $(pwd)/results:/opt/spincirc/results spincirc:latest

# For Jupyter notebook:
# docker run -it --rm -p 8888:8888 spincirc:latest jupyter notebook --ip=0.0.0.0 --allow-root