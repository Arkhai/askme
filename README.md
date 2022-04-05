# Askme

## Description

Askme is a social network, where one can ask questions to existing users, anonimus questions are also possible. Person, received a question can answer it or delete. 

Hashtags can be added to questions and answers and it's possible to search by hashtag.

It's also possible to change the color of background in profile.

Recaptcha is added to protect application from spam attacks. 

Application language is Russian.

Implemented in Ruby 2.7.3, Rails 6.1.4.

## Launching

* Download or clone repo


* Use bundler

```
bundle install
```

* Create database

```
rails db:create
```

* Run database migrations

```
rails db:migrate
```

* Create credentials as in example to use Recaptcha
```azure
RECAPTCHA_ASKME_PUBLIC_KEY='5dhzd54h4d5zsg45dz4h5ztf4gn54fgt5hb45dd54zh5'
RECAPTCHA_ASKME_PRIVATE_KEY='6T5H64T6H445TH54t5nyg54m5yhn1T44b545'
```