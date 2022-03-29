# README

# Introduction

This project has developed in ruby on rails and it is a api based project there is some routes are design to make a request like create state, create districts, create childs , login and logout etc.

ruby version - 3.0.3p157

rails version - 7.0.2.3

Database - sqlite

# Installation 

```bash
git clone https://github.com/Vishal8236/backend-api-intern.git
```

Create a new gemset for this project

```bash
rvm gemset create intern
```

Now change the gemset 

```bash
rvm gemset use intern
```

Now install ruby and rails install ruby by - 
```bash
rvm install 3.0.3
```

```bash
gem install rails -v 7.0.2.3
```

Go inside project by ``` cd backend-api-intern ```
make sure that you are use intern gemset by checking ```rvm gemset list``` and also use ruby 3.0.3 version

Install all gems 

```bash
bundle install
```

Run all migration so that will create all tables that is usefull in project.

```bash
rails db:migrate
```

Now run rails application 

```bash
rails server
```

# How to use this project API

To add default user name and password in database run db:seed 
```default username - 1412 & password - 142487```

```bash
bundle exec rails db:seed
```

Run ```rails routes``` you will see all routes that defined in project

For login & logout 

```bash
http://localhost:3000/api/login

http://localhost:3000/api/logout
```

For create state & get state

```bash
http://localhost:3000/api/state/create

http://localhost:3000/api/state/get-state
```

For create district & get district

```bash
http://localhost:3000/api/district/create

http://localhost:3000/api/district/get-district?state_id=2
```

For create child & get child

```bash
http://localhost:3000/api/create-child

http://localhost:3000/api/get-child
```
