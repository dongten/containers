FROM node:22

LABEL org.opencontainers.image.source="https://github.com/dongten/containers"

ARG NODE_ENV=production
ARG NEXT_PUBLIC_DOMAIN_URL
ARG NEXT_PUBLIC_API_URL

RUN apk add --no-cache libc6-compat

ENV NODE_ENV=${NODE_ENV}
ENV NEXT_PUBLIC_DOMAIN_URL=${NEXT_PUBLIC_DOMAIN_URL}
ENV NEXT_PUBLIC_API_URL=${NEXT_PUBLIC_API_URL}

COPY run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 3000

ENV PORT=3000
# set hostname to localhost
ENV HOSTNAME="0.0.0.0"

CMD ["/run.sh", "/src", "/dist"]