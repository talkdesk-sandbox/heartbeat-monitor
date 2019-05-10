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

  4) To see the logs from all the containers you can use: `docker-compose logs -ft --tail=0`

  Note: If you want to repeat the process, run `bin/db/bobby_drop_tables` inside the `heartbeat_1` container before starting again from step 3.

# Deleting older entries

The script `bin/tasks/delete_old_calls.rb` was created to delete old entries. The main purpose is associate it with a
cron-job or any other kind of scheduler. This is needed because Postgres does not support TTL natively.

To run it:
```
    ruby bin/tasks/delete_old_calls.rb DAYS
```
It will delete all entries older than the given `DAYS`

_NOTE: The scripts needs the `POSTGRES_URL` environment variable. You might prefer to run it in your (development) containers or in your deployment environment._  
_DOCKER: `docker-compose run heartbeat ruby bin/tasks/delete_old_calls.rb DAYS`_  

# TODO

- [X] Configure threads for:
  - [X] Puma
  - [X] Talkdesk Events Consumers

- [ ] Track ongoing calls in legacy, and NC
  - [ ] Track start of calls
  - [ ] Track end of calls
  - [ ] Enforce a 7 day TTL on Postgress table
  - [ ] Create a long-lasting db schema (try a few iterations)
  - [ ] Track outbound calls (listen to `outgoing_call_initiated` event)
  - [ ] Track agent-to-agent calls (listen to `agent_call_initiated` event)

- [ ] Write bootstrap scripts:
  - [X] Create tables
  - [X] Destroy tables (DEV only)
  - [ ] Add fixtures (useful later for tests)

- [ ] Ensure we can cleanup after ourselves:
  - [ ] Script to unbind our RabbitMQ queue in DEV environments
  - [ ] Use bunny gem to achieve operational scripts
  - [ ] Implement authenticated HTTP API for deleting older calls

- [ ] Finish writting the readme file
  - [X] Explain dev setup
  - [ ] Deployment procedure (including fresh)
