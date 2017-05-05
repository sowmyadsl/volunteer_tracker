# VOLUNTEER TRACKER

 An application that tracks projects and the volunteers working on them. Each volunteer will belong to only one project.

### Prerequisites

Web browser with ES6 compatibility
Examples: Chrome, Safari

Ruby 2.3.4
Bundler

## User Stories

* User can add a project to the database with a name and description.
* User can add a volunteer with name and their date of service.
* User can update a project and delete them.
* User can add a volunteer to a project.

In PSQL:

CREATE DATABASE volunteer_tracker;
CREATE TABLE volunteers (id serial PRIMARY KEY, name varchar, date_of_service date, hours_served);
CREATE TABLE projects (id serial PRIMARY KEY, name varchar, description varchar);

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
