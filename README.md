# How to run it locally...

### Prerequisites
- docker

## Let's start

1- clone this repository

`git clone https://github.com/jotterkain/drugstore.git`

2- create an `.env` file. Insert the required environments variable, you can use the `.example.env` as template.

3- Finally, Build and Run

- You just want to start the server ?
    - run `docker compose up` optionally add -d flag to run in detached mode
- Do you want to work on the project ?

    - run `pnpm install`, or instead of pnpm, use the package manager of you choice
    - run `docker compose up db`
    - run `pnpm run start:dev`, or instead of pnpm, use the package manager of you choice
    - The server is listening at `http://localhost:3033`

#### ! Note: make sure there is no other service using the ports 3033 (API) or 5432 (database) if you're not sure, update the `docker-compose.yml` file as needed.


## Facing an issue ?
Please help me to improve this project by opening an issue as soon as you encounter one. I'll look into it as as 
soon as possible

Love & Open Source...