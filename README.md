```
                       _   _                _
  /\  /\___  __ _ _ __| |_| |__   ___  __ _| |_
 / /_/ / _ \/ _` | '__| __| '_ \ / _ \/ _` | __|
/ __  /  __/ (_| | |  | |_| |_) |  __/ (_| | |_
\/ /_/ \___|\__,_|_|   \__|_.__/ \___|\__,_|\__|

                        _ _
      /\/\   ___  _ __ (_) |_ ___  _ __
     /    \ / _ \| '_ \| | __/ _ \| '__|
    / /\/\ \ (_) | | | | | || (_) | |
    \/    \/\___/|_| |_|_|\__\___/|_|

```

# Building and run (DEV)

  1) Make sure you have the correct ruby version and that the bundler gem is setup.

  2) Ensure your github token is exposed under the env var: `BUNDLE_GITHUB__COM`

    - Please ensure you follow the example env file: `example.env`  Rename it to `.env` and edit in your values.

  3) Use docker-compose to build and run the required containers:

    `docker-compose build && docker-compose up -d heartbeat talkdesk_consumer routing_consumer`

  3a) FIRST RUN ONLY:

    - Use `docker ps` to get the container id for `heartbeat_1`

    - Open a bash prompt inside the container: `docker exec -ti CONTAINER_ID bash` (replace Container Id with the hash you got from `docker ps`)

    - In this new prompt, run `bin/db/create_tables`


  4) To see the logs from all the containers you can use: `docker-compose logs -ft --tail=0`

  Note: If you want to repeat the process, run `bin/db/bobby_drop_tables` inside the `heartbeat_1` container before starting again from step 3.

# TODO

- [X] Configure threads for:
  - [X] Puma
  - [X] Talkdesk Events Consumers

- [ ] Track ongoing calls in legacy, and NC
  - [ ] Track start of calls
  - [ ] Track end of calls
  - [ ] Enforce a 7 day TTL on Postgress table
  - [ ] Create a long-lasting db schema (try a few iterations)

- [ ] Write bootstrap scripts:
  - [X] Create tables
  - [X] Destroy tables (DEV only)
  - [ ] Add fixtures (useful later for tests)

- [ ] Ensure we can cleanup after ourselves:
  - [ ] Script to unbind our RabbitMQ queue in DEV environments
  - [ ] Use bunny gem to achieve operational scripts

- [ ] Finish writting the readme file
  - [X] Explain dev setup
  - [ ] Deployment procedure (including fresh)
