FROM python:3.14-slim

LABEL org.opencontainers.image.source="https://github.com/fmarasoglou/CMSeeK" \
      org.opencontainers.image.description="CMS Detection and Exploitation suite - Scan WordPress, Joomla, Drupal and 180+ other CMSs." \
      org.opencontainers.image.licenses="GPL-3.0"

RUN apt-get update && apt-get install -y --no-install-recommends git && rm -rf /var/lib/apt/lists/*
RUN useradd -m cmseek

WORKDIR /cmseek

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY cmseek.py current_version ./
COPY cmseekdb/ cmseekdb/
COPY VersionDetect/ VersionDetect/
COPY deepscans/ deepscans/
COPY cmsbrute/ cmsbrute/
COPY wordlist/ wordlist/

RUN chown -R cmseek:cmseek /cmseek
USER cmseek

ENTRYPOINT ["python", "cmseek.py"]
