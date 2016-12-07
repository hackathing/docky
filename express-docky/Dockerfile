# Start with the base js image
From node:4.6.2-alpine

# Install express app dependencies
ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
RUN npm install -g yarn
COPY yarn* $APP_HOME/
COPY package* $APP_HOME/
RUN yarn install

# Add application source
COPY . $APP_HOME

# Start server
ENV PORT 3000
EXPOSE 3000
CMD ["node", "start.js", "--host", "0.0.0.0"]
