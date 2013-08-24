# LaunchPage
**This is a quick and easy viral landing page that allows visitors to sign up, share a custom URL, and track how many referals they generated.**

Developed and maintained by [@kimmanis](https://twitter.com/kimmanis) and [@drigotti](https://twitter.com/drigotti).

## Screenshots
Below are two screenshots (homepage and sharing page) of [pressrm.com](http://www.pressrm.com/), a site that was built using LaunchPage.
[![ScreenShot](http://i.imgur.com/Kc9SIwf.png)](http://www.pressrm.com)

[![ScreenShot](http://i.imgur.com/EPDOhcB.png)](http://www.pressrm.com)

## Getting Started
1. Fork the repo
2. Run rake db:migrate
3. Customize UI as needed, more information below
4. Change admin password
5. Deploy

=================

## Customization
LaunchPage is built on Bootstrap. More information on site structure and css settings can be found in the [ Bootstrap docs](http://getbootstrap.com/css/).

### Homepage
The homepage is a simple form only asking for the user's email address and can be found at **views/users/new**

### Confirmation & Share Page:
The confirmation and share page shows immediately after the user has provided their email address. This page includes his/her trackable referral URL and share buttons. it can be found at **views/users/show**

### Admin page
The admin page is where you can view how many people have registered and access their email address. You can edit this file at **views/lock/unlock** though you shouldn't need to.

To access registrations, visit http://www.yoursitehere.com/lock/login. The default password is "password". To change it, overwrite the password file using the following command:
     <code>rails g lock:create_password_file yourpasswordhere</code>

For more on lock can be found on the [lock gem website](http://www.cowboycoded.com/2011/04/11/lock-down-a-rails-3-app-with-a-single-password-using-lock/).

### Styling
**find in views/layouts/application**

### Config
Open the **config/application.yml** file to change the following:
- Google analytics (e.g. UA-)
- SEO meta information (e.g. description)
- Facebook meta and social sharing (e.g. share copy and Twitter handle)

## Deploying to Heroku
This code uses SQLite for development but PostgreSQL for production. This is because Heroku only supports PostgreSQL but it's a pain to set up locally. You need to have Heroku installed and set up already for all this goodness to work. Detailed instructions can be found in the [Heroku getting started guide](https://devcenter.heroku.com/articles/rails3).

To create a new heroku site: <code>heroku apps:create exampleName</code>

Then deploy to heroku (ensure changes already committed): <code>git push heroku master</code>

Then set up the database: <code>heroku run rake db:migrate</code>

If the CSS isn't showing up correctly, you may want to precompile assets and push everything again: <code>rake assets:precompile</code>

## License
This code is released under the BLANK BLANK license. While not required, we do ask for a link back to this page, so others can discover and build upon the work.
