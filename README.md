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

- [ ] Configure threads for:
  - [ ] - Puma
  - [ ] - Talkdesk Events Consumers

- [ ] Track ongoing calls in legacy, and NC
  - [X] Track start of calls
  - [ ] Track end of calls
  - [ ] Enforce a 7 day TTL on Postgress table
  - [ ] Create a long-lasting db schema (try a few iterations)

- [ ] Look into using Sequel (https://github.com/jeremyevans/sequel) instead of the `pg` gem
  - [ ] Write bootstrap scripts:
   - [ ] Create db and tables
   - [ ] Add fixtures (useful later for tests)
   - [ ] Destroy db and tables (DEV only)

- [ ] Ensure we can cleanup after ourselves:
 - [ ] Script to unbind our RabbitMQ queue in DEV environments

- [ ] Finish writting the readme file
    - [ ] Explain dev setup
    - [ ] Deployment procedure (including fresh)
