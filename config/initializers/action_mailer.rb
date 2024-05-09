Rails.application.config.action_mailer.default_url_options = { host: 'yourdomain.com' } # Set your domain here
Rails.application.config.action_mailer.delivery_method = :smtp
Rails.application.config.action_mailer.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                 587,
  domain:               'yourdomain.com', # Or your actual domain
  user_name:            'your@gmail.com',
  password:             'yourpassword',
  authentication:       'plain',
  enable_starttls_auto: true
}
