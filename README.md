# WATIR COINMARKETCAP

This application allows to scrap the entire coinmarketcap site with the watir gem.


## 1. Download the source code
```ruby
$ git clone https://github.com/entertotheneworld/watir-coinmarketcap
$ cd ruby_watir
```

## 2. Install Gem
```ruby
$ gem install bundler
$ bundle install
$ rspec --init
```
To verify the installation you must have a Gemfile.lock file in the ruby_j9 folder.
⚠️ COMMON ERROR : Check that your version of ruby ​​matches the one saved in the gem file.


## 3. Usage
To use the app, run the following command. The latter will launch your browser and scrap the entire page : https://coinmarketcap.com/all/views/all/

```ruby
$ cd lib
$ ruby watir_coinmarketcap.rb
```