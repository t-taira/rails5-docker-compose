FROM ruby:2.2.4
ENV LANG C.UTF-8
RUN apt-get update -qq && apt-get install -y build-essential
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile Gemfile.lock /myapp/
RUN bundle install
ADD . /myapp
