# _Doctor's Office_

_6 October 2020_

#### _Program for office administrators to track patients in a fake doctor's office_

#### By _**Joseph Karnafel and Vanessa Stewart**_

## Description

_This is a practice exercise for Epicodus to review working with databases in Sinatra apps. The original instructions include:_

This program is for office administrators to track patients in a doctor's office. Here are some user stories to get started. Decide on your own whether you'd like to create a one-to-many or many-to-many relationship between doctors and patients.

As an administrator, I want to add a doctor to the database with a name and specialty.
As an administrator, I want to add a patient with their name and birthdate.
As an administrator, I want to be able to assign a patient to a doctor for care. (Hint: Doctors will have a one-to-many relationship with their patients.)
As a doctor, I want to see the list of patients that have been assigned to me.
Now the doctor's office has been grown to include many doctors with the same specialty. The doctors have organized themselves into specialty groups. So when an administrator wants to enter a doctor, they must first select a specialty group and then add a doctor.

As a patient, I want to see a list of all the doctors in a particular specialty. A doctor will only have one specialty. (Hint: change from storing specialty as a column to making a specialties table.)
As an administrator, I want to view an alphabetical list of doctors including the number of patients they see. (Hint: Do some online research for SQL ORDERing and COUNTing.)


## User Story Specifications
| Spec     | Behavior | 
| -------- | -------- | 
| 1 | As an administrator, I want to add a doctor to the database with a name and specialty. | 
| 2 | As an administrator, I want to add a patient with their name and birthdate. | 
| 3 | As an administrator, I want to be able to assign a patient to a doctor for care. | 
| 4 | As a doctor, I want to see the list of patients that have been assigned to me. | 
| 5 | As a patient, I want to see a list of all the doctors in a particular specialty. A doctor will only have one specialty. | 
| 5 | As an administrator, I want to view an alphabetical list of doctors including the number of patients they see. |

## Plan of Action

1. Create classes for Doctor, Patient, and Speciality with full CRUD functionality. (with tests)
2. Create db tables for all three classes
3. Create sinatra routes.

## Backend Logic
| CRUD Action | Method | Description | URL |
| ------------| ------ | ----------- | --- |
|  |  |  |  |
|  |  |  |  |
|  |  |  |  |
|  |  |  |  |

## SQL Schema
<img src="/public/images/sql_schema.png" alt="map of sql tables">

## Setup/Installation Requirements

- Navigate to the directory on your local computer where you would like to clone this repo.
- Clone this repo using the `git clone` command in terminal/command line.
- Navigate to the cloned folder and run `gem install bundler` to install Bundler, which will mange all gem installations for our project.
- Run `bundle` or `bundle install` in your command line to download all dependencies. (If add additional gems later, you will need to run `bundle update <gem name>`.)
- Open the cloned repo in a text editor of your choice.
- To Run Tests: While in the root directory of this project, run `rspec` in your command line.
- To Run the App in Browser: While in the root directory of the project, run `ruby app.rb` in the terminal. This will start a server, which you can access by entering `localhost:4567` in your browser.

## Known Bugs

_There are no known bugs at this time._

## Technologies Used

* Ruby
* Ruby Gems: Pry, RSpec, Sinatra, Sintara-Contrib, Capybara
* HTML5
* CSS/Bootstrap


### License

Copyright (c) 2020 **_Joseph Karnafel and Vanessa Stewart_**

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
