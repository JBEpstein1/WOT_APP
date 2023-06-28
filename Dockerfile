FROM ruby:3.1.2-buster

RUN apt-get update -qq && apt-get install -y postgresql-client

RUN curl -sL https://deb.nodesource.com/setup_19.x | bash -\
  && apt-get update -qq && apt-get install -qq --no-install-recommends \
    nodejs \
  && apt-get upgrade -qq \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*\
  && npm install -g yarn@1

RUN yarn add esbuild
RUN yarn add sass

# Install Tailwind CSS, PostCSS, Autoprefixer, postcss-cli and purgecss
RUN yarn add tailwindcss postcss autoprefixer postcss-cli @fullhuman/postcss-purgecss

WORKDIR /wot_app
COPY Gemfile /wot_app/Gemfile
COPY Gemfile.lock /wot_app/Gemfile.lock

# Copy all source files
COPY . .

# Build CSS with PostCSS and Tailwind CSS
RUN npx postcss ./app/javascript/stylesheets/application.tailwind.css -o ./app/assets/stylesheets/application.css

EXPOSE 3000

RUN bundle install
