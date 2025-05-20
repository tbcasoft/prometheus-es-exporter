FROM python:3.8-slim

# Prevent pip from spawning threads (Jenkins-safe)
ENV PIP_NO_PROGRESS_BAR=off
ENV PIP_PROGRESS_BAR=off
ENV MODE="cc"

WORKDIR /usr/src/app

COPY setup.py .
COPY README.md .
COPY prometheus_es_exporter/*.py ./prometheus_es_exporter/

# Install your local package in editable mode with safe pip settings
RUN pip install --no-cache-dir --progress-bar off -e .

COPY LICENSE .
COPY cc-exporter.cfg .
COPY tc-exporter.cfg .
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

RUN mkdir -p /logs

EXPOSE 9206

ENTRYPOINT ["./entrypoint.sh"]
