# PicPost - Blogging Application

PicPost is a simple and intuitive blogging application built with Rails 7, leveraging Docker for containerization, Turbo Streams for frontend updates, and MySQL as the database.

## Table of Contents

- [Technology Stack](#technology-stack)
- [Setup without Docker](#setup-without-docker)
- [Setup with Docker](#setup-with-docker)

## Technology Stack

- **Ruby 3.0.0**: Programming language used in Rails development.
- **Rails 7**: Backend framework for web development.
- **Docker**: Containerization for development environment.
- **StimulusJS**: Handles frontend interactions.
- **Turbo Streams**: Provides seamless DOM updates.
- **MySQL**: Database management system.


## Setup without Docker
  ### Prerequisites
    - yarn

  1. Clone the repository:

  git clone https://github.com/your_username/picpost.gitrname/picpost.git

  2. `cd picpost`

  3. Run `bundle install`

  4. Run `yarn install`

  5. `setup databse credentials in example_database.yml`

  6. Run `rails db:setup`

  7. Run `rails s`


## Setup with Docker
  ### Prerequisites
    - docker
    - yarn

  1. Clone the repository:

  git clone https://github.com/your_username/picpost.git

  2. Run `cd picpost`

  3. Run `bundle install`
  
  4. Run `yarn install`

  5. `setup databse credentials in example_database.yml`

  6. Run `docker-compose up --build`
