# Askme

## Demo

[qaskme.herokuapp.com/](https://qaskme.herokuapp.com/)

## Description

Askme is a social network, where one can ask questions to existing users, anonimus questions are also possible. Person, received a question can answer it or delete. 

Hashtags can be added to questions and answers and it's possible to search by hashtag.

It's also possible to change the color of background in profile.

Recaptcha is added to protect application from spam attacks. 

Application is a clone of [ask.fm/](https://ask.fm/)

Application language is Russian.

Implemented in Ruby 2.7.3, Rails 6.1.4.

## Launching

* Download or clone repo

```
git clone git@github.com:Arkhai/askme.git
```

* Use bundler

```
bundle install
```

* Install nodejs dependences

```
yarn
```

* Create database and run migrations

```
rails db:create db:migrate
```

* To use Recaptcha create credentials as in example in .env file 
```
RECAPTCHA_ASKME_PUBLIC_KEY=<value>
RECAPTCHA_ASKME_PRIVATE_KEY=<value>
```
To create Recaptcha credentials visit

[developers.google.com/recaptcha/intro](https://developers.google.com/recaptcha/intro)

* Start server
```
rails s
```

* Open web-page

[http://localhost:3000/](http://localhost:3000/)

