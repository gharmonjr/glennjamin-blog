FROM ruby:2.7.2-alpine3.12

RUN apk update && \
  apk add libressl-dev postgresql-dev nodejs alpine-sdk less autoconf automake ca-certificates libnotify-dev && \
  apk add yarn --update-cache --repository http://nl.alpinelinux.org/alpine/edge/community && \
  rm -rf /var/cache/apk/*

WORKDIR /src

#GEMz
COPY Gemfile* ./
ARG INSTALL_DEPS="true"
RUN [ "$INSTALL_DEPS" == "true" ] && gem install bundler -v '2.1.4' && bundle install --jobs=5 || echo 'Bundler runs later after the gems volume is mounted by docker-compose.'

# the NPMz
COPY package.json yarn.lock .yarnrc ./
ARG INSTALL_DEPS="true"
RUN [ "$INSTALL_DEPS" == "true" ] && yarn install || echo 'Yarn runs later after the node_modules volume is mounted by docker-compose.'

COPY . ./

EXPOSE 3000
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
