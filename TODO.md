# TODO

Files marked *(to be created)* don't exist yet.

## Infra

- [ ] **Multi-stage Docker build**: shrink the image by writing the [`Dockerfile`](Dockerfile) myself (to learn Docker).
  Right now `lambda-chan:dev` is 741 MB of content (4.75 GB on disk); the `haskell:9.10` base alone is 669 MB.

## Frontend and views

- [ ] Add htmx with `hx-boost` in the layout: [`src/Views/IndexView.hs`](src/Views/IndexView.hs) (serve `htmx.min.js` from `static/js/`)
- [ ] Create a helpers folder: `src/Helpers/` *(to be created)*
- [ ] Helper for custom blaze attributes (`hx-boost`, `hx-get`, `hx-target`...): `src/Helpers/Blaze.hs` *(to be created)*
- [ ] Board view: thread list + form to open a new thread
  - `src/Views/BoardView.hs` *(to be created)*
  - `src/Controllers/Board.hs` *(to be created)*
- [ ] Thread view: opening post (`threadTitle`, `threadAttachment`, `threadText`) + child posts replying to it. The attachment is mandatory to open a thread.
  - `src/Views/ThreadView.hs` *(to be created)*
  - `src/Controllers/Thread.hs` *(to be created)*

## Database

- [ ] Design the PostgreSQL database (schema + migrations)
- [ ] Add the Postgres libraries to [`lambda-chan.cabal`](lambda-chan.cabal)
- [ ] Decide what to do with the boards ([`src/Domain/Boards.hs`](src/Domain/Boards.hs)):
  - [ ] a) Hardcoded in code only
  - [ ] b) Stored in the database only, and queried
  - [ ] c) Hardcoded in code and seeded into the database (to get the FK), but not queried

## Domain and tests

- [ ] Model `Thread | ClosedThread`: a `ClosedThread` must not accept new `Post`s → [`src/Domain/Thread.hs`](src/Domain/Thread.hs)
- [ ] Unit tests for `Domain/` with Hspec (+ QuickCheck): `test/` *(to be created)*
  - Requires splitting the code into a `library` in [`lambda-chan.cabal`](lambda-chan.cabal) and moving `Main.hs` to `app/`.

## Site, rules and legal

- [ ] Write the site rules: a free space, but with coexistence and respect, focused on IT and functional programming.
  - Include a notice that user-posted content shouldn't be taken as true.
  - Look into how 4chan covers itself regarding user uploads (read their rules and terms).
- [ ] Write an About section
- [ ] Decide on a license → [`LICENSE`](LICENSE)
