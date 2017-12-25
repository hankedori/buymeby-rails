### Getting started
1. Install RVM, ruby, and rails
  ```
  $ \curl -L https://get.rvm.io | bash -s stable --ruby
  $ rvm use ruby-2.4.3@rails5.2 --create
  $ gem install rails
  ```
2. Install postgres
  ```
  brew install postgres
  ```
  1. May need to create a database with your machine user
  ```
  createdb <user>
  ```
3. Set up database
  ```
  rake db:setup
  ```
