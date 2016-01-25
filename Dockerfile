FROM mkscsy/debootstrapped-ruby



ADD Gemfile /Gemfile 
ADD scripts /scripts

RUN apt-get update && apt-get install -y nodejs sqlite3 libsqlite3-dev  --no-install-recommends \
    && gem update --system && gem install bundler \
    && cd / && bundle install \
    && rm -rf /var/lib/apt/lists/* \
    && cat /dev/null >! /var/log/*log

EXPOSE 3000

VOLUME ["/rails_app"]

ENTRYPOINT ["bundle","exec"]
CMD ["/scripts/init.sh"]

