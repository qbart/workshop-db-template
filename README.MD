# Workshop DB XX

## Configuration

```
cp config/{database.yml.example,database.yml}
```


## Installation

```
bundle install
bundle exec rake db:create db:migrate db:seed
```


## Usage

Starting a server:

```
bin/server # localhost:3000
```

Starting a console:

```
bin/irb
```
