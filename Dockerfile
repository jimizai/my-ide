FROM node:12.18.3

WORKDIR /theia

COPY package.json yarn.lock ./

RUN apt-get update -y && apt-get install libsecret-1-dev -y && yarn config set registry https://npm.kekebaihuo.com && yarn && yarn theia build
  
RUN NODE_OPTIONS='--max-old-space-size=4096' yarn theia build

EXPOSE 8080

CMD ["yarn", "theia", "start", "--hostname","0.0.0.0", "--port", "8080"]

