# Portfolio Project - Ruby on Rails - Dog Daycare

## Description

This project is for a dog daycare service called [Dog Daycare](https://rails-dog-daycare.herokuapp.com). The service allows dog owners to signup for a user account. Once logged into the website, a user can update their account with an address and attach between 1 to 3 dogs to their account. Once their account has been updated, users can make reservations for their dog(s) to stay at the dog daycare. Within a reservation, users have the ability to select from a range of pre-defined activities, designate the length of time for each activity, and request a custom activity they define if desired.

Users can also view all the locations and activities available on individual pages. The user has the ability to apply filters on both the locations and activities pages if they want to see the available locations or activities based on filtered criteria.

Users have full abilitity to edit their user account including editing their personal information, viewing, creating, updating, and deleting dogs or reservations attached to their user account.

## Installation

TO install the application, follow these steps:

1. Fork and/or clone the [repository](https://github.com/robert-laws/portfolio-project-rails-dog-daycare.git)

1. From the root of the application folder, run ``bundle install``

1. Migrate the database using the command ``bundle exec rake db:migrate``

1. Seed the database with sample data using the command ``bundle exec rake db:seed``

1. Run ``bundle exec rails server`` to startup the local server and navigate to localhost:3000 to view the running application

## Contributing

Please refer to each project's style guidelines and guidelines for submitting patches and additions. In general, we follow the "fork-and-pull" Git workflow.

1. Fork the repo on GitHub
1. Clone the project to your own machine
1. Commit changes to your own branch
1. Push your work back up to your fork
1. Submit a Pull request so that your changes can be reviewed

## Licensing

The MIT License (MIT)

Copyright (c) 2018 Robert Laws

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Work Progress

The list below tracks the progress on the project and the components completed.

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
- [x] add require_permission helper method to protect against viewing another user's content

### Omniauth Integration

- [x] update Gemfile with omniauth and omniauth-github
- [x] setup oauth with github
- [x] add omniauth file in initializers
- [x] add link to sign in via github
- [x] add controller logic to sessions controller to authenticate user and create a record in the users table
- [x] test authenticate model

## Phase 3

### Completing the User Profile

#### User Addresses

- [x] create a migration for an address table
- [x] address has fields street_1, street_2, city, state, zipcode, user_id
- [x] associate address with a user using a has_many relationship

#### User Dogs

- [x] create a migration for a dog table
- [x] dog has fields name, breed, age, sex, user_id
- [x] associate dog with a use using a has_many relationship

#### Seed Data for Addresses and Dogs

- [x] add address and dog seed data
- [x] associate address and dog with user accounts

#### Add Logic to Require Users to Complete Profile

- [x] add logic to controller to check if profile is complete (has address and dog)
- [x] redirect to profile page (user_path) with notification to complete profile

#### Setting up the Form Associations

- [x] add form fields for address and dog(s)
- [x] update user_params to include address and dog fields
- [x] add user accepts nested attribtues for addresses and dogs in user model
- [x] customize users/edit view to prompt user to select the number of dogs to add to their profile
- [x] add methods in user model for nested attributes
- [x] update navigation to show 'Your Profile' for logged in user
- [x] display user address and dog information on user profile page

### Editing Nested Addresses and Dogs Data

#### Nesting for Addresses within Users

- [x] update routes to include nested addresses
- [x] add addresses_controller with show and edit view
- [x] add logic for edit and update in addresses_controller
- [x] update individual address content and redirect to user#show

#### Nesting for Dogs within Users

- [x] update routes to include nested dogs
- [x] add dogs_controller with edit view
- [x] add logic for edit and update in dogs_controller
- [x] add select control and validations for dog sex column
- [x] update individual dog content and redirect to user#show

#### Add or Remove a Dog from the User account

- [x] add feature to add a new dog to an user
- [x] add feature to remove an existing dog from a user
- [x] use a partial to render the form for the new and edit views

## Phase 4

### Locations

- [x] create model and migration for location
- [x] add fields name, city, capacity, size, and open_year
- [x] add controller for locations with index and show views

### Activities

- [x] create model and migration for activity
- [x] add fields name, description, best_for_size, best_for_type, energy_usage, custom
- [x] add controller for activities with index and show views

### Location_Activities

- [x] create model and migration for location_activity
- [x] confirm relationships in model belongs_to location and activities
- [x] add seeds for locations and activities

### Features

- [x] add routes and navigation link for locations and activities
- [x] add index and show actions/views for locations
- [x] add nested resources for locations that have associated activities
- [x] add index and show actions/views for activities (nested and un-nested)

#### Adding New Locations

- [x] add new view and controller new and create action for location
- [x] build collection_select in form to select existing activities to add to location
- [x] add edit view and controller edit and update action for location
- [x] add destroy controller action for location

#### Adding New Activity

- [x] add new view and controller action for activity
- [x] add edit view and controller action for activity
- [x] add destroy controller action for activity

### Filters and Sorting

- [x] add filtering controls for locations
- [x] add model scopes for filtering features
- [x] add helper methods for text formatting within views

## Phase 5

### Reservations

#### Reservations Model

- [x] create model and migration for reservation
- [x] add fields named date, drop_off_time, pick_up_time, user_id

#### Reservation_Activities

- [x] create model and migration fro reservation_activities
- [x] add fields named duration, reservation_id, activity_id

#### Associations

- [x] add associations for reservation -> has_many reservation_activities, and has_many activities through, belongs_to user
- [x] add associations for activities -> has_many reservation_activities, and has_many reservations through
- [x] add associations for reservation_activities -> belongs_to reservation, belongs_to activity
- [x] add associations for users -> has_many reservations

#### Controllers

- [x] add controller and views for reservations -> index, show, new, edit
- [x] add routes for controller actions -> index
- [x] add nested routes for controller actions within a user context -> index, show, new, create, edit, update, destroy
- [x] setup index and show views for reservation content

### Views

- [x] populate index and show views to display model content
- [x] add and begin building _form partial for reservations
- [x] add activity check_boxes and activity_ids with duration select field
- [x] add new activity fields_for nested form
- [x] update reservations controller for new, create, edit, and update actions

### Destroy Action

- [x] add destroy action to controller
- [x] add link_to for destroy action to show view
- [x] redirect user to reservations_path upon destroy

### Reservation Integrations

#### Displaying and Sorting Reservations

- [x] incorporate reservations into users#show account information
- [ ] create a sortable reservations table for listing all user reservations -> incorporating the ability

#### Administering Reservations

- [x] allow user to initiate a show, new, edit, or destroy controller action from their account page
- [ ] add these controller actions to the reservations table

#### Reservations Helpers

- [x] add reservations helpers -> date display
- [x] add reservations helpers -> time display
- [ ] add reservations helpers -> calculation of costs
- [ ] add reservations helpers -> display of costs and totals
- [x] add top activity class method to Activity
- [x] create view located at /activities/top to display result from top activity class method
- [x] clean up page prompting user account update and form for a user account update

[Link to LICENSE](https://github.com/robert-laws/portfolio-project-rails-dog-daycare/blob/master/LICENSE)
