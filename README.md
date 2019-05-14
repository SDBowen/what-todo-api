# What Todo

API for What Todo, a simple todo list application.

The React client for What Todo is in a [separate repository](https://github.com/SDBowen/what-todo-client)

## Getting Started

Get Docker CE: https://docs.docker.com/install/

Clone the repo

```
git clone https://github.com/SDBowen/what-todo-api.git
```

Build the API

```
docker-compose build
```

Seed the database

```
docker-compose run api rake db:setup
```

Start the API

```
docker-compose up
```

## Built With

- [Rails](https://rubyonrails.org/) - Back-end framework
