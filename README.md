
# Sample Blog
## Overview
This is a sample blog API created as an assessment for  backend developer role at Uamuzi. The project is built with on the Ruby on Rails framework.


## MVP
The following are the minimum viable features that are included in the sample blog API:

Authentication
Registration
Creating backend endpoints
When creating a blog, there should be:

title,
body,
user_id

The comment_counter is defaulted to 0.

When creating a comment, there should be:

body,
user_id,
blog_id

When creating a user, there should be:

name,
email

The blog_counter is defaulted to 0.
## Technical Expectations
The Project is built using the following technologies:

Framework: Ruby on Rails

Database: PostgreSQL

## Endpoints
The following endpoints have been implemented in the Project Eleven backend:

GET /auth - Authentication endpoint

POST /login - Login endpoint

DELETE /logut - Logout endpoint

GET /users - Get all users

GET /users/:id - Get a user by ID

POST /users - Create a new user

PATCH /users/:id - Update a user

DELETE /users/:id - Delete a user

POST /blogs - Create a new blog

GET /blogs - Get all blogs

GET /blogs/:id - Get a blog by ID

PATCH /blogs/:id - Update a blog

DELETE /blogs/:id - Delete a blog

POST /comments - Create a new comment

GET /comments - Get all comments

GET /comments/:id - Get a comment by ID

PATCH /comments/:id - Update a comment

DELETE /comments/:id - Delete a comment

These endpoints allow for the viewing, creation, editing, and deletion of users, blogs and comments.

## Installation and Setup
To set up the Project locally, follow these steps:

    - Clone the repository git clone git@github.com:Elvis-Njoroge/sample-blog.git

    - Navigate to the project directory cd sample-blog

    - Install dependencies bundle install
    
    - Set up the database rails db:create, rails db:migrate and rails db:seed


## Login Credentials

email: user1@example.com
password: password1
## Developer
Elvis Njoroge

elvisgitau103@gmail.com
