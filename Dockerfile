FROM python:3.8-slim

# both of upper and lower case are valid (examples: CC, cc, TC, tc)
ENV MODE="cc"

WORKDIR /usr/src/app

COPY setup.py .
COPY README.md .
RUN pip install -e .

# copy content into work directory
COPY prometheus_es_exporter/*.py ./prometheus_es_exporter/
COPY LICENSE .
COPY cc-exporter.cfg .
COPY tc-exporter.cfg .
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

EXPOSE 9206

ENTRYPOINT ["./entrypoint.sh"]
