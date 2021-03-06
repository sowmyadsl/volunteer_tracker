# VOLUNTEER TRACKER

 An application that tracks projects and the volunteers working on them. Each volunteer will belong to only one project.

### Prerequisites

Web browser with ES6 compatibility
Examples: Chrome, Safari

Ruby 2.3.4
Bundler

## User Stories
| Behavior |
|---|
| User can add a project with name of the project, begin date and end date on the welcome page.   |
| User can add a project with name of the project, begin date and end date on the welcome page.  |
| User can add a project with name of the project, begin date and end date on the welcome page.  |
| User can add, delete and update a project.|
| User can add volunteers on the next page.|
 User can add volunteers with first name, last name, joining date and leaving date.
| User can add, delete and update volunteers.|
| On the same page, User can navigate through a drop down list of projects and assign each project to volunteers.|

### Installation

* Create a SQL Database for this project: Run 'psql' in your terminal and then create the following databases and tables by doing the commmands below:

  Guest=# CREATE DATABASE volunteer_tracker;

  Guest=# \c volunteer_tracker;

  volunteer_tracker=# CREATE TABLE "volunteers" ("id"  SERIAL ,"first_name" VARCHAR ,"last_name" VARCHAR ,"joining_date" DATE ,"leaving_date" DATE ,"assigned_project_id" INTEGER ,PRIMARY KEY ("id"));

  volunteer_tracker=# CREATE TABLE "projects" ("id"  SERIAL ,"project_name" VARCHAR ,"begin_date" DATE,
  "end_date" DATE ,PRIMARY KEY ("id"));

  volunteer_tracker=# CREATE DATABASE volunteer_tracker_test WITH TEMPLATE volunteer_tracker;

* You can clone this repository to your machine, navigate to the file path in your terminal, and run 'app.rb' by typing '$ruby app.rb'. If you chose to clone the repository, after you run 'app.rb' you will need to copy the localhost path into your web browser. The standard localhost for Sinatra is port 4567.

## Built With

* Ruby
* Sinatra
* HTML
* CSS
* Bootstrap https://getbootstrap.com/
* ES6
* Jquery https://jquery.com/


## Author

Sowmya Dinavahi

## License

Copyright © 2017 Sowmya Dinavahi
