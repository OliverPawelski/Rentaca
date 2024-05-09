Rails.application.config.action_mailer.default_url_options = { host: 'yourdomain.com' } # Set your domain here
Rails.application.config.action_mailer.delivery_method = :smtp # or :sendmail, :test, etc.
Rails.application.config.action_mailer.smtp_settings = {
  address:              'smtp.example.com',
  port:                 587,
  user_name:            'yourusername',
  password:             'yourpassword',
  authentication:       'plain',
  enable_starttls_auto: true
}
