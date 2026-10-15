# -- Haskell build phase
FROM haskell:9.10 AS build

WORKDIR src/

COPY stack.yaml stak.yaml.lock *.cabal ./
# Build dependecies first, to take advantage of cache
RUN stack build --only-dependecies

COPY . .
RUN stack build

EXPOSE 3000

CMD ["stack", "exec", "lambda-chan"]
