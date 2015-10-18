# README

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ... to be filled out later


## Setting up Azandria Blaugh environment

### Chef and Cap

###### Required Stuff

1. Secrets are buried in chef/nodes/joe.azandria.com.json, and should **never** be added to source control. When setting up a new environment (without using Chef - e.g., for a local workstation), you'll need to make sure to populate some files to ensure the app can work. In each of these files' parent directory, you can find a `<filename>_template.yml` guide, which allows you to only have to add the correct passwords and secrets. These preconfigured files will also work with ENV variables, if you're more comfortable supplying those, instead.
	- `config/cloudinary.yml`
	- `config/database.yml`
