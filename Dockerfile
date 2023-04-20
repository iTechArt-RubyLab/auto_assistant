# Use a Ruby base image
FROM ruby:3.2.0

# Set the working directory in the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install the gems
RUN bundle install --jobs 4 --retry 3

# Copy the rest of the application into the container
COPY . .

# Set the environment variables
ENV RAILS_ENV=production \
    RACK_ENV=production \
    PORT=3000

# Precompile the assets
RUN bundle exec rake assets:precompile

# Start the server
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
