== README
Project requires ruby  2.2 to be installed in local machine

Steps to download and install the project in local machine

*  Install ruby 2.2 - https://www.ruby-lang.org/en/downloads/
* clone the project to local using console- git clone https://github.com/ulammatha/Todays-Food-Deal.git
* cd in to project in console
* install mysql - https://dev.mysql.com/downloads/
* install ImageMagick which is required for image(paperclip) management in the project
* run 'bundle install'
* If above runs successfully
* run rake db:drop db:create db:migrate (which creates a new DB(desi_deals) with few tables)
* for test data run - rake db:seed  - which creates a vendor, user accounts and one resturant and one deal
* If above step runs successfully you will see login credentials in your console for vendor and genral user.

* please look at the db/seed file for more info how data is setting up

* p.s:app requires in .env
* Stripe - PUBLISHABLE_KEY, SECRET_KEY
* Facebook - FACEBOOK_APP_ID, FACEBOOK_APP_SECRET
