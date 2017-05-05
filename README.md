# VOLUNTEER TRACKER

 An application that tracks projects and the volunteers working on them. Each volunteer will belong to only one project.

### Prerequisites

Web browser with ES6 compatibility
Examples: Chrome, Safari

Ruby 2.3.4
Bundler

## User Stories

* User can add a project with name of the project, begin date and end date on the welcome page.
* User can add, delete and update a project.
* User can add volunteers on the next page.
* User can add volunteers with first name, last name, joining date and leaving date.
* User can add, delete and update volunteers.
* On the same page, User can navigate through a drop down list of projects and assign each project to volunteers.

In PSQL:

CREATE DATABASE volunteer_tracker;
CREATE TABLE "volunteer" ("id"  SERIAL ,"first_name" VARCHAR ,"last_name" VARCHAR ,"joining_date" DATE ,"leaving_date" DATE ,"assigned_project_id" INTEGER ,PRIMARY KEY ("id"));
CREATE TABLE "project" ("id"  SERIAL ,"project_name" VARCHAR ,"begin_date" DATE,
"end_date" DATE ,PRIMARY KEY ("id"));

### Installing

Installation is quick and easy! First you can open this link  to see the webpage in action live online. Or you can clone this repository to your machine, navigate to the file path in your terminal, and run 'app.rb' by typing '$ruby app.rb'. If you chose to clone the repository, after you run 'app.rb' you will need to copy the localhost path into your web browswer. The standard localhost for Sinatra is port 4567

## Built With

* Ruby
* Sinatra
* HTML
* CSS
* Bootstrap https://getbootstrap.com/
* ES6
* Jquery https://jquery.com/



## Authors

Sowmya Dinavahi

## License

Copyright © 2017 Sowmya Dinavahi
