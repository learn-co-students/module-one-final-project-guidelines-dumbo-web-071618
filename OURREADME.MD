# Bar Tender

Bar Tender is a command line application. It makes use of the Yelp API to allow a user to find the bars closest to them. A user can store the bars they loved the most after visiting them, and has the freedom to check, update, and delete their favorites as much as they want.

# Installation Instructions

1. If you don't already have a Yelp account, head over to https://www.yelp.com/signup to get one.
2. Once you've signed in your Yelp account, go to the  Manage App page to create an app with Yelp, and receive your very own API key.
3. Type export YELP_API_KEY="insert yelp api key here" in your terminal in order to add the key to your environment.
4. Run bundle install
5. run rake db:migrate
6. CONGRATS!!! You've done everything you need to find your favorite bars enter ruby bin/run.rb to get started.

# Contributor's Guide

Below are the gems we couldn't have done this without
*yelp*
*http*
*tty-prompt*
*tty-font*

# License Link
https://opensource.org/licenses/MIT
