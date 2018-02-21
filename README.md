# 早道 
## hayamichi

hayamichi is a gem that allows you to circumvent pages with the flow:  

`app -> redirect to external form -> submit form -> redirect to app again`  

When the redirect to app again carries values in the url.  

Think of pay-pal offsite payments or oAuth.  

### Installation:

`gem install 'hayamichi'`  

or add in Gemfile:  

`gem 'hayamichi'` 

### Usage:

```ruby
require 'hayamichi'

# instantiate with the form action on offsite
hm = Hayamichi.new('https://offsiteform/action')

# add hash with form data
hm.data = {
  name: 'John',
  lastname: 'Smith',
  age: 28
}

response = hm.submit

response.success # boolean containing status result of operation (NOT HTTP STATUS)
response.url # url to redirect
response.data # hash containing values of the query

response.response # raw net/http response object
```


You can also specify if the submision method for the form in the constructor like:

```ruby
hm = Hayamichi.new('https://offsiteform/action', method: :get)
```

default value is :post, only methods allowed are :post and :get
