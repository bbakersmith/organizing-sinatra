# Organizing Sinatra
An exploration of Sinatra file organization.

Currently two branches exist in this repo with their own app structures: `basic` and `multi-app`.



## The Basics
This is the simplest file and directory structure that I use. It provides a good structure for small apps, and can be scaled up easily to handle increased complexity.

### /
---

#### app.rb 
The main app file, which contains the application class definition and routes. If routes become more complex I create a `/routes/` directory and split them into separate files.

```ruby
require 'bundler'
Bundler.require

class BasicApp < Sinatra::Base

  get '/' do
    erb :index
  end

end
```


#### config.ru
This is the rackup file, which I use to mount and run the application, locally with [Shotgun](https://github.com/rtomayko/shotgun) and in production with [Phusion Passenger](https://github.com/phusion/passenger).

```ruby
require './app'

run BasicApp
```


#### Gemfile
Bundler configuration file for managing gem dependencies.

```ruby
source 'https://rubygems.org'

gem 'sinatra'
```


### /lib/
---
Ruby helper methods live here, wrapped up in modules. They are required in `app.rb` and made available to the Sinatra app using the `helpers` method.


### /public/
---
Static assets are stored in subdirectories including `/css/`, `/images/`, `/js/`.


### /tmp/
---
Creating or overwriting `restart.txt` will force Sinatra to refresh on the next load, and `always_restart.txt` will force a reload on every load (this _must_ be removed for production).


### /views/
---

#### index.erb
Site homepage.

```html
<h1>Basic App Homepage</h1>
```


#### layout.erb
Default page template.

```erb
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="/css/app.css"/>
</head>
<body>

  <%= yield %>

  <script src="/js/app.js"></script>
</body>
</html>
```



## Next Steps

### Testing
In order to make my apps


### Multiple Apps
To manage complexity and maintain a separation of concerns, I create separate Sinatra apps for distinctly different processes or components. I prefer to do this using a single barebones parent Rack app, with a structure like the following.

- apps/
    - basic-app/
      ...

    - second-app/
      ...

- config.ru

- app.rb

- Gemfile

The following will mount the SecondApp modular app with a root of `/second-app/` (http://yourapp.com/second-app). Like Sinatra's routes, Rack routes cascade so `'/'` will catch all other requests and delegate them to BasicApp.

```ruby
# app.rb

require 'bundler'
Bundler.require

require './apps/basic-app/app'
require './apps/second-app/app'
```

```ruby
# config.ru

require './app'

map '/second-app' do
  run SecondApp
end

map '/' do
  run BasicApp
end
```

As with all things Sinatra there are a lot of ways to tailor the modular app structure to specific needs. 



## Resources
Some of the more useful resources I've come across 
on this subject.

[Sinatra README](http://www.sinatrarb.com/intro.htmlt stat:)

[Phrogz/riblits](https://github.com/Phrogz/riblits)

[SO: Using Sinatra for larger projects via multiple files](http://stackoverflow.com/questions/5015471/using-sinatra-for-larger-projects-via-multiple-files)

[Rolling with Sinatra](http://www.sitepoint.com/rolling-with-sinatra/)

[GG: How do you roll with Sinatra?](https://groups.google.com/forum/#!msg/sinatrarb/BFAXCCK3D8I/mXLv6YDoBcAJ)



