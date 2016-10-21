FROM ruby:2.3
MAINTAINER Ville Kauppi <ville.kauppi@iltalehti.fi>

RUN mkdir -p /usr/src/app
COPY . /usr/src/app
WORKDIR /usr/src/app

EXPOSE 8000
RUN bundle install

CMD ["ruby","app.rb"]
