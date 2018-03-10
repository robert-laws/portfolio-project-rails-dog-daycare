# Portfolio Project - Ruby on Rails - Dog Daycare

Porject description... to come soon...

# Work in Progress

This repository includes all the work for my flatiron school portfolio project. As the project progresses, additional phases will be added to the work in progress section.

## Phase 1

### Initial Setup

- [x] initialize new rails app - portfolio-project-rails-dog-daycare
- [x] push repo to github
- [x] create static_controller and home.html.erb - as root
- [x] setup layouts/application and application_helper to yield to custom page titles provided by views

### Heroku Integration

- [x] setup Gemfile to include dev -> sqlite3 and prod -> pg
- [x] push project to heroku -> [Heroku - Project Website - Rails Dog Daycare](https://rails-dog-daycare.herokuapp.com/)
- [x] rename project on heroku

### Asset Pipeline - Resources

#### Bulma CSS Framework

- [x] add bulma css to app
- [x] add font-awesome-rails gem to app
- [x] configure assets/stylesheets to use bulma and font-awesome
- [x] update layouts/application to use bulma

#### Navigation - Bulma Navbar

- [x] add html scaffolding for navbar with root route navigation link
- [x] add placeholder logo for navbar
- [x] add placehold links for pages - About, Locations, and Activities
- [x] setup application_controller#current_path method, use in layouts/application to apply styles conditionally

## Phase 2

### Users

- [x] create model and migration for users
- [x] add fields first_name, last_name, email, username, and password_digest
- [x] add bcrypt gem to Gemfile
- [x] add has_secure_password to model
- [x] test model by add seed data for creating users

### Basic Authentication

- [x] create sessions controller
- [x] add new, create, and destroy methods
- [x] add routes for users and sessions
- [x] add logic to authenticate users and add a session variable
- [x] update application controller to include a current_user method
- [x] update navigation to inlcude sign in, sign up, and logout buttons
- [x] add views for users and sessions
- [x] add basic validations for user model
- [x] add error messages for views
- [x] add flash for alerts and notifications
- [x] add column for admin in users table

### Omniauth Integration

- [ ] update Gemfile with omniauth and omniauth-github
- [ ] setup oauth with github
- [ ] add omniauth file in initializers
- [ ] add link to sign in via github
- [ ] add controller logic to sessions controller to authenticate user and create a record in the users table
- [ ] test authenticate model