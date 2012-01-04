Welcome to Antikobpae 2.0
==================

Antikobpae is a Rails 3.1 application that aims to be a simple interface for text 
plagiarism detection via a web browser. It includes file management & sharing 
possibilities based on [BoxRoom](http://boxroom.rubyforge.org/). The application lets users create
folders and upload and download files. For admins it is possible to create users,
groups and the CRU/D rights these groups have on folders. It makes the application
flexible depending on the organization's network (Intranet Application / Cloud Application)

Website:  
http:// -> to define

Bug reports and feature requests:  
https://github.com/ghis182/kobpae-rails/issues/new


Requirements
------------
The requirements for running Antikobpae are:

 * Ruby 1.9.2 
 * Rails 3.1.0
 * A database (e.g. MySQL or SQLite)
 * -> add here server requirements


Installation
------------
Follow the these steps:

 1. `$ git clone git://github.com/ghis182/kobpae-rails.git` Clone the project
    
or 

 1. Download and extract `kobpae-rails.zip`
 
 2. `$ cd kobpae-rails` Go to the project root directory
 3. `$ bundle` Update the bundle
 4. `$ rake db:migrate` Create a database and schema
 5. `$ rake db:seed` Populate a database and schema (facultative for now, TODO-> merge rakes)
 6. `$ rails s` Start the server
 7. Point your browser to [http://localhost:3000/](http://localhost:3000/)
 8. Enjoy!


Mail settings
-------------
Antikobpae sends email when users want to reset their password or when they share files.
For this to work, depending on your environment, you have op to open
`config/environments/development.rb` or `config/environments/production.rb`, uncomment
the following lines and fill in the correct settings of your mail server:

    # config.action_mailer.delivery_method = :smtp
    # config.action_mailer.smtp_settings = {
    #   :address => 'mailhost',
    #   :port => 587,
    #   :user_name => 'user_name',
    #   :password => 'password',
    #   :authentication => 'plain'
    # }

In order for Antikobpae to send a user to the correct URL for either downloading a shared
file or for resetting passwords, you have to uncomment and update the following:

    # config.action_mailer.default_url_options = { :host => 'localhost:3000' }

You also have to choose a from address for the emails that will be sent. You can do
this by uncommenting and adjusting the following line:

    # ActionMailer::Base.default :from => 'Antikobpae <yourname@yourdomain.com>'


Languages
---------
Antikobpae is available in English and partially in Dutch, German and Italian. Someone has to take care
of the translation into Thai.

English is the default. To change the language, open `config/application.rb` and change the following line:

    config.i18n.default_locale = :en

to:

    config.i18n.default_locale = :nl # Dutch
    config.i18n.default_locale = :de # German
    config.i18n.default_locale = :it # Italian
    config.i18n.default_locale = :th # Italian


Downloaded files are empty
--------------------------
If you encounter an issue with Antikobpae where downloaded files are always empty,
it may help to uncomment the following line in `config/environments/production.rb`:

    # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect'


