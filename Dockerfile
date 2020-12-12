FROM node:10 AS builder

RUN useradd --create-home feel
COPY --chown=feel:feel ./package-lock.json ./package.json /home/feel/feel-explorer/
WORKDIR /home/feel/feel-explorer
USER feel
RUN npm ci
COPY --chown=feel:feel . /home/feel/feel-explorer/
RUN mkdir -p public
RUN mkdir -p logs
RUN npm run build


FROM node:10-alpine

RUN adduser -D feel
COPY --chown=feel:feel --from=builder /home/feel/feel-explorer /home/feel/feel-explorer/

USER feel
WORKDIR /home/feel/feel-explorer
CMD ["node", "app.js"]
