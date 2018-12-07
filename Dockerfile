FROM ruby:2.3.8

RUN gem install --no-ri --no-rdoc geminabox -v 0.13.15
RUN mkdir -p /app/geminabox/config && \
	mkdir -p /app/geminabox/data

RUN mkdir -p /tmp
RUN chmod o+t /tmp

RUN gem install --no-ri --no-rdoc puma

WORKDIR /app/geminabox/config
COPY geminabox/config/config.ru /app/geminabox/config/config.ru
COPY server/config/config.ru /app/server/config/config.ru
COPY server/entrypoint.sh /app/server/entrypoint.sh

ENTRYPOINT ["/app/server/entrypoint.sh"]
