#FROM ruby:2.4.1-alpine3.6
FROM ruby:2.6.5-alpine3.7

LABEL maintainer="Robert Gauld <robert@robertgauld.co.uk>"

# Create and switch to user called app
RUN adduser -D app
WORKDIR /home/app

# Copy over app and install dependencies
COPY app/Gemfile app/Gemfile.lock /home/app/
RUN cd /home/app && bundle install --without development test

# Copy rest of app
COPY app /home/app
RUN chown -R app:app /home/app && chmod -R u+w /home/app


CMD ["bundle","exec","run"]
