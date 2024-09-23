FROM ubuntu:22.04
RUN apt-get update
RUN apt-get --assume-yes install \
        ruby-full                \
        git                      \
        curl                     \
        autoconf                 \
        bison                    \
        build-essential          \
        libssl-dev               \
        libyaml-dev              \
        libreadline6-dev         \
        zlib1g-dev               \
        libncurses5-dev          \
        libffi-dev               \
        libgdbm6                 \
        libgdbm-dev              \
        libdb-dev
RUN gem install bundler jekyll
COPY entrypoint.sh /usr/local/bin
WORKDIR /site
ENTRYPOINT ["entrypoint.sh"]
CMD ["bundle", "exec", "jekyll", "serve", "--force_polling", "-H", "0.0.0.0", "-P", "4000"]

