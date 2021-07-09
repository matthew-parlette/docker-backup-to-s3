FROM arm64v8/python:3.9-alpine
# ORIGINAL MAINTAINER Ilya Stepanov <dev@ilyastepanov.com>
MAINTAINER Matthew Parette <matthew.parlette@gmail.com>

# RUN apt-get update && \
#     apt-get install -y python python-pip cron && \
#     rm -rf /var/lib/apt/lists/*

RUN pip install s3cmd

ADD s3cfg /root/.s3cfg

ADD start.sh /start.sh
RUN chmod +x /start.sh

ADD sync.sh /sync.sh
RUN chmod +x /sync.sh

ADD get.sh /get.sh
RUN chmod +x /get.sh

ENTRYPOINT ["/start.sh"]
CMD [""]
