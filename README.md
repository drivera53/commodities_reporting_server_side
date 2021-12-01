# COMMODITIES REPORTING SERVER SIDE

* Rails make it very easy to set up a backend API for a React-Project.
```ruby
rails new commodities_reporting_server_side --api
```
    * If you have a problem creating a new rails project (E.g. 'incompatible library version msgpack'), try the following:
    ```ruby
    bundle install --redownload
    ```
    You may need to reinstall Yarn
    ```ruby
    npm install --global yarn
    ```
* Delete `Gemfile.lock` and run
```ruby
bundle install
```
* Start your server with:
```ruby
rails s
```
or (When using a custom port)
```ruby
rails server -p 3001
```
* When having issues with 





If you want to start with a fresh new database you may delete `development.sqlite` and `schema.rb`; then run:
```ruby
rails db:migrate
```
Make sure to fork its [front end repository](https://github.com/drivera53/webapp-cripto-react) as well.

# Usage
Run `rails s` or `rails server -p 3001` if you're currently using port 3000 in your front end. 
You may also watch my [YouTube](https://www.youtube.com/watch?v=8Pp9b6Zprw8) video.

# License
[MIT](https://github.com/drivera53/react-flatcoin-rails-backend/blob/main/LICENSE)


Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
