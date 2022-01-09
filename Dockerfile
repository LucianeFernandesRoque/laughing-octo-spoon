#create image
FROM ruby:3.0.0
RUN apt-get update
#create a diretory
RUN mkdir -p /app
WORKDIR /app 
COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock
RUN  gem install bundler && bundle install
#EXPOSE 3000
COPY . /app