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

TODO
====

- [X] Configure threads for:
  - [X] Puma
  - [X] Talkdesk Events Consumers

- [ ] Track ongoing calls in legacy, and NC
  - [ ] Track start of calls
  - [ ] Track end of calls
  - [ ] Enforce a 7 day TTL on Postgress table
  - [ ] Create a long-lasting db schema (try a few iterations)

- [ ] Write bootstrap scripts:
  - [ ] Create tables
  - [ ] Destroy tables (DEV only)
  - [ ] Add fixtures (useful later for tests)

- [ ] Ensure we can cleanup after ourselves:
  - [ ] Script to unbind our RabbitMQ queue in DEV environments
  - [ ] Use bunny gem to achieve operational scripts

- [ ] Finish writting the readme file
  - [ ] Explain dev setup
  - [ ] Deployment procedure (including fresh)
