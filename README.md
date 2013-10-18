# LaunchPage
**This is a quick and easy viral "launching soon" landing page that allows visitors to sign up, share a custom URL, and track how many referals they generated.** 

Below are two screenshots (homepage and sharing page) of [pressrm.com](http://www.pressrm.com/?code=HjayII), a site that was built using the LaunchPage, with some basic CSS modifications:
[![ScreenShot](http://i.imgur.com/Kc9SIwf.png)](http://www.pressrm.com/?code=HjayII)

[![ScreenShot](http://i.imgur.com/EPDOhcB.png)](http://www.pressrm.com/?code=HjayII)

### Getting Started
1. Fork the repo
2. Run rake db:migrate
3. Customize UI as needed, more information below
4. Change admin password
5. Push to GitHub
5. Deploy to Heroku

## Customization
LaunchPage is designed to be a fully customizable landing page, so that it's unique to your site and delivers the highest conversion rates.

### Settings
A couple of key settings, such as site / starup name can be made at **config/application.yml**. Start from here.

### CSS
LaunchPage is built on Bootstrap. More information on site structure and css settings can be found in the [ Bootstrap docs](http://getbootstrap.com/css/). CSS that's specific to LaunchPage, for example the sign up form styling, can be found at **assets/stylesheets/launchpage.css**.

To change the background image, just replace "background.jpg" at **assets/images**. If the background image is another file name, for example background.png, simple edit line #20 at **views/layouts/application**.

### Homepage
The homepage is a simple form asking for the user's email address along with supporting points. This is the page users will see when they visit your site. You can customize the content at **views/users/_form**.

### Confirmation & Share Page
The confirmation and share page shows immediately after the user has provided their email address. This page includes his/her trackable referral URL, share buttons, and text either askign him/her to share or the number of referrals if the URL has already driven one. It can be found at **views/users/show**.

### Admin
The admin page is where you can view how many people have registered and access their email address. You can edit this file at **views/lock/unlock** though you shouldn't need to.

To access registrations, visit http://www.yoursitehere.com/lock/login. The default password is "password". To change it, overwrite the password file using the following command:
     <code>rails g lock:create_password_file yourpasswordhere</code>

For more on lock can be found on the [lock gem website](http://www.cowboycoded.com/2011/04/11/lock-down-a-rails-3-app-with-a-single-password-using-lock/).

### Application
Sitewide changes, can be made from **views/layouts/application**.

## Deploying
This code uses SQLite for development but PostgreSQL for production. This is because Heroku only supports PostgreSQL. You need to have Heroku installed and set up already for the following steps to work correctly. Detailed instructions can be found in the [Heroku getting started guide](https://devcenter.heroku.com/articles/rails3).

To create a new heroku site: <code>heroku create exampleName</code>

Then deploy to heroku (ensure changes already committed to GitHub): <code>git push heroku master</code>

Then set up the database: <code>heroku run rake db:migrate</code>

If the CSS isn't showing up correctly, you may want to precompile assets and push everything again: <code>rake assets:precompile</code>