FROM jenkins/jenkins:lts-jdk17
USER root

# ติดตั้ง Chromium และ Driver (สำคัญมาก ต้องมีทั้งคู่)
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    chromium \
    chromium-driver \
    && rm -rf /var/lib/apt/lists/*

# Setup Python Environment
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# ติดตั้ง Robot Framework
RUN pip install --upgrade pip \
    && pip install robotframework \
    && pip install robotframework-seleniumlibrary

USER jenkins