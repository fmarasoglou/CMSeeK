FROM python:3-alpine

LABEL name CMSeeK
LABEL src "https://github.com/Tuhinshubhra/CMSeeK"
LABEL creato Tuhinshubhra
LABEL dockerfile_maintenance khast3x
LABEL desc "CMS Detection and Exploitation suite - Scan WordPress, Joomla, Drupal and 130 other CMSs."


RUN apk add --no-cache git

WORKDIR /cmseek

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENTRYPOINT [ "python", "cmseek.py" ]
