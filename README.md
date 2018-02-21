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
shortcut = Hayamichi.new('https://offsiteform/action')

# add hash with form data
shortcut.data = {
  name: 'John',
  lastname: 'Smith',
  age: 28
}

response = shortcute.submit

response.success # boolean containing status result
response.url # url to redirect
response.data # hash containing values of the query
```


You can also specify if the submision method for the form in the constructor like:

```ruby
shortcut = Hayamichi.new('https://offsiteform/action', method: :get)
```

default value is :post, only methods allowed are :post and :get
