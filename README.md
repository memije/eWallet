# Travis-CI Status
[![Build Status](https://travis-ci.org/Memije/eWallet.svg?branch=master)](https://travis-ci.org/Memije/eWallet)

# Description:
Simple e-Wallet application, developed with Ruby on Rails, deployed to a [Heroku live server](https://ezwallet.herokuapp.com/home/index)

The objective of this exercise is to evaluate the analysis capacity, architecture definition and
development practices that a candidate has.

# Prerequisites

| Software   | Version |
|------------|---------|
| PostgreSQL | 9.5.14  |
| Ruby       | 2.5.1   |
| Rails      | 5.2.1   |

# Instructions:
1. Clone repository
```bash
# using ssh
$ git clone git@github.com:Memije/eWallet.git

# using https
$ git clone https://github.com/Memije/eWallet.git
```
2. Change working directory
```bash
$ cd eWallet
```
3. Install dependencies
```bash
$ bundle install
```
4. Initialize Figaro gem
```bash
bundle exec Figaro install
```
5. Configure the following environment variables in `config/application.yml`

| Key         | Description                 |
|-------------|-----------------------------|
| pg_username |  PostgreSQL username        |
| pg_password | PostgreSQL password         |
| KEY         | 256bit (32bytes) secret key |

### NOTE: It's important to keep it up to 32 bytes due to OpenSSL's truncation to 32 bytes. You can generate a secure key [here](http://www.allkeysgenerator.com/Random/Security-Encryption-Key-Generator.aspx).

#### Example:
```yml
# config/application.yml
db_username: 'cleverusername'
db_password: 'cleverpassword'
KEY: "kYp3s6v9y$B&E)H+MbQeThWmZq4t7w!z"
```
6. Create, migrate and seed database
```bash
$ rake db:create db:migrate db:seed
```
7. Run server
```bash
$ rails s
```
8. ???
9. PROFIT!!!
