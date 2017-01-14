FROM ruby:2.3.1-alpine
ENV BUNDLE_PATH /bundle
ENV BUILD_PACKAGES="curl-dev ruby-dev build-base bash git" \
      DEV_PACKAGES="zlib-dev libxml2-dev libxslt-dev tzdata yaml-dev mysql-dev imagemagick" \
      RUBY_PACKAGES="ruby-json yaml nodejs"
RUN apk update && \
      apk upgrade && \
      apk add --update $BUILD_PACKAGES $DEV_PACKAGES $RUBY_PACKAGES && \
      cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
      rm -rf /var/cache/apk/*
WORKDIR /app
COPY . /app
EXPOSE 3000
#RUN gem install bundler
#RUN mkdir -p /usr/src/app && \
#      mkdir -p /app/tmp/sockets
#RUN bundle check || bundle install
# Expose volumes to frontend
VOLUME /app/public
VOLUME /app/tmp
VOLUME /app/log
