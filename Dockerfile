FROM node:12-alpine

ENV PATH /opt/outline/node_modules/.bin:/opt/node_modules/.bin:$PATH
ENV NODE_PATH /opt/outline/node_modules:/opt/node_modules
ENV APP_PATH /opt/outline
RUN mkdir -p $APP_PATH
WORKDIR $APP_PATH

COPY package.json yarn.lock $APP_PATH/
RUN yarn install --pure-lockfile
RUN cp -r /opt/outline/node_modules /opt/node_modules

COPY . $APP_PATH
RUN yarn build

CMD yarn start

EXPOSE 3000
