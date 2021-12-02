# COMMODITIES REPORTING SERVER SIDE

* Rails make it very easy to set up a backend API for a React-Project.
```ruby
rails new commodities_reporting_server_side --api
```
If you have a problem creating a new rails project (E.g. 'incompatible library version msgpack'), try the following:
```ruby
bundle install --redownload
```
You may need to reinstall Yarn
```ruby
npm install --global yarn
```
* Add gems in `Gemfile`
```ruby
gem 'active_model_serializers'
gem 'jwt'
gem 'rack-cors'
```
* config/initializer/cors.rb
```ruby
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'example.com'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
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
* Generate models via scaffold
```ruby
rails generate scaffold user first_name last_name email password:digest
```
```ruby
rails generate controller Session new --no-helper --no-assets --no-test-framework --skip-routes --skip
```
```ruby
rails generate scaffold exchange name
```
```ruby
rails generate scaffold commodity name unit price:decimal exchange_id:integer
```
```ruby
rails generate scaffold currency name c_type settlement_date:date tenor:date price:decimal exchange_id:integer
```
* Assigning Has many / Belongs to relationships in `app\models`
```ruby
# exchange.rb
class Exchange < ApplicationRecord
    has_many :commodities
    has_many :currencies
end
```
```ruby
# commodity.rb
class Commodity < ApplicationRecord
    belongs_to :exchange
end
```
```ruby
# currency.rb
class Currency < ApplicationRecord
    belongs_to :exchange
end
```
* Migrate
```ruby
rails db:migrate
```
* Test console
```ruby
rails c
user1 = User.create(:first_name => "Dan", :last_name => "Riv", :email => "test@gmail.com", :password => "test")
Exchange.create(:name => "Chicago Mercantile Exchange")
Exchange.create(:name => "New York Mercantile Exchange")
Commodity.create(:name => "WTI Crude Oil", :unit => "Barrel", :price => 67.19, :exchange_id => 1)
Commodity.create(:name => "Brent Crude Oil", :unit => "Barrel", :price => 69.57, :exchange_id => 2)
Commodity.create(:name => "Natural Gas", :unit => "Million BTUs", :price => 4.29, :exchange_id => 2)
Commodity.create(:name => "Unleaded Gas", :unit => "Gallon", :price => 1.98, :exchange_id => 1)
Currency.create(:name => "U.S. Dollar (USD)", :c_type => "Swap", :settlement_date => "2021-12-01 17:51:48.442516000 +0000", :tenor => "2021-12-01 17:51:48.442516000 +0000", :price => 1, :exchange_id => 1)
Currency.create(:name => "Euro (EUR)", :c_type => "Swap", :settlement_date => "2021-12-01 17:51:48.442516000 +0000", :tenor => "2021-12-01 17:51:48.442516000 +0000", :price => 1.1328, :exchange_id => 2)
```
If you want to start with a fresh new database you may delete `development.sqlite` and `schema.rb`; then run:
```ruby
rails db:migrate
```
Edit serializers
```ruby
# serializers/exchange_serializer.rb
class ExchangeSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :commodities
  has_many :currencies
end
# serializers/currency_serializer.rb
class CurrencySerializer < ActiveModel::Serializer
  attributes :id, :name, :c_type, :settlement_date, :tenor, :price, :exchange_id
  belongs_to :exchange
end
# serializers/commodity_serializer.rb
class CommoditySerializer < ActiveModel::Serializer
  attributes :id, :name, :unit, :price, :exchange_id
  belongs_to :exchange
end
```
Edit config/application.rb
```ruby
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*',
          :headers => :any,
          :methods => [:get, :post, :delete, :put, :patch, :options, :head],
          :max_age => 0
      end
    end
```