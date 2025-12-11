FROM ruby:3.3-alpine

RUN apk add --no-cache git build-base && \
    gem install truemail-rack -v 0.2.0 --no-document && \
    apk del build-base && \
    rm -rf /var/cache/apk/*

ENV TRUEMAIL_VERIFIER_EMAIL=no-reply@tondomaine.com
ENV TRUEMAIL_DEFAULT_VALIDATION_TYPE=smtp
ENV TRUEMAIL_SMTP_FAIL_FAST=true
ENV TRUEMAIL_SMTP_SAFE_CHECK=true

EXPOSE 3000
ENV PORT=3000

CMD ["truemail-rack", "-p", "3000", "-o", "0.0.0.0"]
