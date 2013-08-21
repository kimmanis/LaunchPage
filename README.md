# LaunchPage

This is a quick and easy landing page that allows visitors to sign up for a pre-released product, share a custom URL and track how many invites they generated.

The admin can see the full list of sign-ups and the number of sign-ups each visitor brought in at [domain]/users.

=================
What you need to modify:

Homepage: find in views/users/new
The homepage is a simple form only asking for the user's email address.

Confirmation/Share Page: find in views/users/show
This page confirms the user is signed up and offers share buttons with his/her trackable URL

Admin page: find in views/lock/unlock
This is where the admin can view the list of signups. I'm using the gem "Lock" to lock down the admin page unless you've got the password. To unlock the admin page visit: http://www.yoursitehere.com/lock/login

The default password is "password". To change it, overwrite the password file using the following command:
rails g lock:create_password_file yourpasswordhere


For more on lock, visit: http://www.cowboycoded.com/2011/04/11/lock-down-a-rails-3-app-with-a-single-password-using-lock/


To do: 
- sharing ux
- make it heroku ready
