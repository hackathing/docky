# start with the base ruby image
From ruby:2.3.0-alpine

# Install ruby app dependencies
ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY Gemfile* $APP_HOME/
RUN bundle install

# Add application source
COPY . $APP_HOME

# Start worker
CMD ["bundle", "exec", "ruby", "consumer.rb"]
