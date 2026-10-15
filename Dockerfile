# -- Haskell build phase
FROM haskell:9.10 AS build

WORKDIR /src

COPY stack.yaml stack.yaml.lock *.cabal ./
# Build dependecies first, to take advantage of cache
RUN stack build --only-dependencies

COPY . .
RUN stack build --copy-bins --local-bin-path /usr/local/bin

EXPOSE 3000

CMD ["lambda-chan"]


# TODO: compress this image with a separate build
