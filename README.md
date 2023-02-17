# README

[![Build Status](https://travis-ci.org/SilviadelPiano/HiSchool.svg?branch=master)](https://travis-ci.org/SilviadelPiano/HiSchool) 

Dear reader,
this repository contains the code of the project developed for my bachelor's degree thesis.   

**Idea**  
During my years at the university, the courses' websites helped me a lot, providing all the logistic information and material I needed to learn the new topics with ease. This inspired me to realize a web application (Software as a Service) to support students in high school. My idea was to build a platform where teachers, students and parents could register and have each a dashboard with information useful to them. In particular, the focus was on the teaching material, a calendar showing events of interest for the users, and posts that could be made by the teachers to easily communicate with students and parents.  

**Technologies**  
I developed the application using the [Ruby on Rails](https://rubyonrails.org/) framework, which is based on two main principles: "Don't Repeat Yourself" and "Conventions Over Configurations", to help the developer build code that is easily maintainable, scalable and written following best practices. Google OAuth is offered as an option for authentication, to log in into the platform after the registration. The resources that can be provided by the teachers are stored in Google Drive: the application has a dedicated service account on it.  
Everything else is provided by the application itself.  
In particular, it was implemented following the [Model-View-Controller paradigm](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller), which led to an architecture made of a Data Layer (where the data and models are handled), an Application Layer (that includes the functionalities), and the Presentation Layers (focusing on the Views).   

To build the application, I followed the Agile methodology, with the help of the [Pivotal Tracker](https://www.pivotaltracker.com/) tool. I also applied the principles of [Behaviour-Driven-Development](https://cucumber.io/docs/bdd/) and [Test-Driven-Developement](https://en.wikipedia.org/wiki/Test-driven_development), making first of all the requirements' analysis and the User Stories, and building the tests before the code.   

I used [GitHub](https://github.com/) for version control and code storage, [Visual Studio Code](https://code.visualstudio.com/) as editor, and [Draw.io](https://www.diagrams.net/blog/move-diagrams-net) to draw the ER database schema.   

Detailed information can be found in the PDF of my thesis (in Italian): [PDF thesis](https://github.com/SilviadelPiano/Tesi_Triennale.git).  
