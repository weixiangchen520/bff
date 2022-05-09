FROM node:16.14.0-stretch AS BUILDER
LABEL maintainer="weixiangchen" \
        site="https://github.com/weixiangchen520/bff.git"

ENV MY_HOME=/root
RUN mkdir -p $MY_HOME
WORKDIR $MY_HOME

COPY package.json $MY_HOME
RUN set -x \
    && yarn install --registry=https://registry.npmmirror.com

COPY . $MY_HOME
RUN set -x \
    && yarn run build

FROM node:16.14.0-stretch

ENV MY_HOME=/root
RUN mkdir -p $MY_HOME
WORKDIR $MY_HOME

COPY package.json $MY_HOME
RUN set -x \
    && yarn install --production --registry=https://registry.npmmirror.com

COPY --from=BUILDER /root/dist ./dist
COPY --from=BUILDER /root/bootstrap.js ./
COPY --from=BUILDER /root/package.json ./

ENTRYPOINT ["node", "bootstrap.js"]