# LaunchPage
**This is a quick and easy landing page that allows visitors to sign up for a pre-released product, share a custom URL and track how many invites they generated. The admin can see the full list of sign-ups and the number of sign-ups each visitor brought in.**

=================

## Get started
1. Fork the repo
2. run rake db:migrate
3. Customize as needed

=================

## How to customize

### Homepage
**find in views/users/new**

The homepage is a simple form only asking for the user's email address.

### Confirmation/Share Page:
**find in views/users/show**

This page confirms the user is signed up and offers share buttons with his/her trackable URL. You may want to adjust the sharing buttons as needed.

### Admin page
**find in views/lock/unlock**

This is where the admin can view the list of signups. I'm using the gem "Lock" to lock down the admin page unless you've got the password. To unlock the admin page visit: http://www.yoursitehere.com/lock/login

The default password is "password". To change it, overwrite the password file using the following command:

    
    rails g lock:create_password_file yourpasswordhere
    

For more on lock, visit: http://www.cowboycoded.com/2011/04/11/lock-down-a-rails-3-app-with-a-single-password-using-lock/

### Styling
**find in views/layouts/application**

We're using Twitter Bootstrap to add some simple styling. Add/remove/update as needed.

=================

## How to deploy to Heroku

This code uses SQLite for development but PostgreSQL for production. This is because Heroku only supports PostgreSQL but it's a pain in the ass to set up locally. You need to have Heroku installed and set up already for all this goodness to work. Check out https://devcenter.heroku.com/articles/quickstart for Heroku getting started tips.

To create a new heroku site: 
    heroku apps:create exampleName

Then deploy to heroku (make sure you've got stuff committed)
    git push heroku master

Then set up the DB:
    heroku run rake db:migrate

If the CSS isn't showing up correctly, you may want to precompile assets and push everything again
    rake assets:precompile

For more info on deploying to heroku: https://devcenter.heroku.com/articles/rails3

=================

## To do: 
- finish up sharing ux
