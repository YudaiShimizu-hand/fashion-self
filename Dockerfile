# rails2.7.0を指定
FROM ruby:2.7.0
# パッケージインストール
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /docker_for_rails27
WORKDIR /docker_for_rails27
COPY Gemfile /docker_for_rails27/Gemfile
COPY Gemfile.lock /docker_for_rails27/Gemfile.lock
RUN bundle install
COPY . /docker_for_rails27

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
