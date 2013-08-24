# LaunchPage
**This is a quick and easy viral landing page that allows visitors to sign up, share a custom URL, and track how many referals they generated. The admin can see the full list of sign-ups and the number of sign-ups each visitor brought in.**


![ScreenShot](http://assets.betali.st/startups/8509/image/big_Screen_Shot_2013-08-23_at_3.38.43_PM.png)

=================

## Getting Started
1. Fork the repo
2. Run rake db:migrate
3. Customize UI as needed, more information below
4. Change admin password
5. Deploy

## Customization
LaunchPage is built on Bootstrap. More information on site structure and css settings can be found on [the Bootstrap website](http://getbootstrap.com/css/).

### Homepage
The homepage is a simple form only asking for the user's email address and can be found at **views/users/new**

### Confirmation/ Share Page:
The confirmation and share page shows immediately after the user has provided their email address. This page includes his/her trackable referral URL and share buttons. it can be found at **views/users/show**

### Admin page
The admin page is where you can view how many people have registered and access their email address. You can edit this file at **views/lock/unlock** though you shouldn't need to.

To access registrations, visit http://www.yoursitehere.com/lock/login. The default password is "password". To change it, overwrite the password file using the following command:
    rails g lock:create_password_file yourpasswordhere

For more on lock can be found at: http://www.cowboycoded.com/2011/04/11/lock-down-a-rails-3-app-with-a-single-password-using-lock/

### Styling
**find in views/layouts/application**

## Config
Open the config/application.yml file to change the following 
- Google analytics 
- SEO meta information (e.g. Description)
- Facebook meta and social sharing (e.g. share copy and Twitter handle)

=================

## Deploying to Heroku
This code uses SQLite for development but PostgreSQL for production. This is because Heroku only supports PostgreSQL but it's a pain to set up locally. You need to have Heroku installed and set up already for all this goodness to work. Those instructions can be found at https://devcenter.heroku.com/articles/quickstart.

To create a new heroku site:
    heroku apps:create exampleName

Then deploy to heroku (ensure changes already committed)
    git push heroku master

Then set up the database:
    heroku run rake db:migrate

If the CSS isn't showing up correctly, you may want to precompile assets and push everything again
    rake assets:precompile

For more info on deploying to heroku: https://devcenter.heroku.com/articles/rails3

