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
- [ ] Commit the SQL that creates the database (migrations or a `db/schema.sql`) with only what the site needs to run: schema + minimal seed (boards). No real data, accounts, password hashes or IPs.
- [ ] Decide what to do with the boards ([`src/Domain/Boards.hs`](src/Domain/Boards.hs)):
  - [ ] a) Hardcoded in code only
  - [ ] b) Stored in the database only, and queried
  - [ ] c) Hardcoded in code and seeded into the database (to get the FK), but not queried

## Domain and tests

- [ ] Model `Thread | ClosedThread`: a `ClosedThread` must not accept new `Post`s → [`src/Domain/Thread.hs`](src/Domain/Thread.hs)
- [ ] Unit tests for `Domain/` with Hspec (+ QuickCheck): `test/` *(to be created)*
  - Requires splitting the code into a `library` in [`lambda-chan.cabal`](lambda-chan.cabal) and moving `Main.hs` to `app/`.

## Public repo hygiene

- [ ] Review `.gitignore`: `build.log`, `uploads/`, `.env`
- [ ] Keep secrets out of the repo (DB password, session key): environment variables, and commit only a `.env.example`
- [ ] Check that the images in `mock-uploads/` are mine or freely licensed (otherwise use placeholders)
- [ ] `docker-compose.yml`: no hardcoded passwords (use `.env`), and don't publish the Postgres port to the outside

## Media uploads

- [ ] Upload limits, in two layers: `client_max_body_size` in nginx + app-side checks (max file size, max pixel dimensions, max video duration). Decide the values.
- [ ] Validate the real file type (magic bytes / `ffprobe`), not the extension or the `Content-Type` the client sends
- [ ] Strip metadata (EXIF) from images
- [ ] Generate a physical compressed thumbnail at upload time (WebP); poster frame for videos with `ffmpeg`
- [ ] Decide whether to re-encode originals (WebP vs AVIF). Default: keep originals, revisit if storage grows
- [ ] Save files in `uploads/` (outside `static/`) with content-hash names, which also gives deduplication
- [ ] Serve `uploads/` directly from nginx (long cache, `nosniff`), ideally from a separate domain
- [ ] Video: transcode/limit with `ffmpeg` in a background worker, not inside the request
- [ ] Extend `Image`/`Video`/`Gif` in [`src/Domain/Attachment.hs`](src/Domain/Attachment.hs) with thumbnail path, file size, dimensions (and duration for video)

## Licenses and credits

- [ ] Decide the project license → [`LICENSE`](LICENSE) (none of my dependencies is copyleft, so I'm free to choose)
- [ ] Ubuntu font: include the Ubuntu Font Licence next to the font files in `static/fonts/`
- [ ] htmx: keep its `LICENSE` (0BSD in 2.x) next to `htmx.min.js` in `static/js/`, and check the license of the exact version I download
- [ ] Add a `THIRD-PARTY-LICENSES.md` (or an "Open source credits" part in About) listing Scotty, blaze-html, htmx, PostgreSQL and the Ubuntu font with their licenses
- [ ] If I publish the Docker image (not just the source): it bundles other people's software, so check what's inside and keep their copyright notices

## Accounts and moderation

- [ ] Admin and moderator accounts, with no public signup
  - [ ] `Role` type (`Admin | Moderator`): `src/Domain/User.hs` *(to be created)*
  - [ ] `users` table with hashed passwords (argon2/bcrypt); accounts created from a script, never hardcoded in the repo
  - [ ] Login route + session cookie (`HttpOnly`, `Secure`, `SameSite`) and rate limiting on login
  - [ ] Authorization check on every moderation action, not just a hidden page
  - [ ] CSRF protection on moderation forms
  - [ ] Decide what each role can do (delete posts, close threads, ban...)
  - [ ] IP ban system: `bans` table (IP, reason, `expires_at`, who banned), checked on every post
    - Read the real client IP behind the reverse proxy (`X-Forwarded-For`, trusting only my own proxy)
    - Decide how to store IPs (keyed hash vs raw with limited retention): they count as personal data in many countries
  - [ ] Optional extra layer: restrict the admin panel by IP/VPN/basic auth at the reverse proxy

## Site, rules and legal

- [ ] Write the site rules: a free space, but with coexistence and respect, focused on IT and functional programming.
  - Include a notice that user-posted content shouldn't be taken as true.
  - Look into how 4chan covers itself regarding user uploads (read their rules and terms).
- [ ] Write an About section
