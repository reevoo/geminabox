FROM ruby:2.3.8

RUN gem install --no-ri --no-rdoc geminabox -v 0.13.9
RUN mkdir -p /apps/config && \
	mkdir -p /apps/data && \
	mkdir -p /apps/server

RUN mkdir -p /tmp
RUN chmod o+t /tmp

RUN gem install --no-ri --no-rdoc puma

WORKDIR /app/config
COPY assets/conf/config.ru /app/config/config.ru

# default server config
COPY assets/server_config/config.ru /app/server/config/config.ru

COPY assets/entrypoint.sh /app/server

ENTRYPOINT ["/app/server/entrypoint.sh"]
