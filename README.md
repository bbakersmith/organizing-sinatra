# Organizing Sinatra

An exploration of Sinatra file organization.



## The Basics

This is the simplest file and directory structure that I use. It provides a good
structure for small apps, and can be scaled up easily to handle increased complexity.

### /
---

#### app.rb 
The main app file, which contains the application class definition and routes.
If routes become more complex I first utilize the [Namespace module from Sinatra
Contrib](), and then if necessary will split the routes for related parts of the app
into separate files within a `/routes/` directory.


#### config.ru
This is the rackup file, which is used to mount and run the application, either
locally with [Shotgun]() or in production with [Phusion Passenger]().


#### Gemfile
Bundler configuration file for managing gem dependencies.


### /lib/
---

#### helpers.rb
Methods defined here will be made directly accessible to your app routes. This
is only good for simple apps without many helper methods. As complexity grows I
first refactor these methods into their own modules, and then into separate
files if necessary.


### /public/
---
Static assets are stored in subdirectories including `/css/`, `/images/`, `/js/`.


### /tmp/
---
Creating or overwriting `restart.txt` will force Sinatra to refresh on the next
load, and `always_restart.txt` will force a reload on every load (this _must_ be
removed for production).


### /views/
---

#### index.erb
Site homepage.


#### layout.erb
Default page template.



## Resources

[Sinatra README](http://www.sinatrarb.com/intro.htmlt stat:)

[Phrogz/riblits](https://github.com/Phrogz/riblits)

[SO: Using Sinatra for larger projects via multiple files](http://stackoverflow.com/questions/5015471/using-sinatra-for-larger-projects-via-multiple-files)

[Rolling with Sinatra](http://www.sitepoint.com/rolling-with-sinatra/)

[GG: How do you roll with Sinatra?](https://groups.google.com/forum/#!msg/sinatrarb/BFAXCCK3D8I/mXLv6YDoBcAJ)
