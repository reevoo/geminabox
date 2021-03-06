FROM ruby:2.7

RUN groupadd -g 1006 conan && \
    useradd -r -u 1006 -g conan conan

RUN gem install --no-document \
    geminabox:1.2.0 \
    puma:5.2.2

RUN mkdir -p /app/geminabox/config && \
	mkdir -p /app/geminabox/data

RUN mkdir -p /tmp
RUN chmod o+t /tmp

#RUN gem install --no-ri --no-rdoc puma

WORKDIR /app/geminabox/config
COPY geminabox/config/config.ru /app/geminabox/config/config.ru
COPY server/config/config.ru /app/server/config/config.ru
COPY server/entrypoint.sh /app/server/entrypoint.sh

RUN chown -R conan.conan /app /tmp

USER conan

ENTRYPOINT ["/app/server/entrypoint.sh"]
