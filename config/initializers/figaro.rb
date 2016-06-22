# Define the environment variables that should be set in config/application.yml.
# See config/application.example.yml if you don't have config/application.yml.\
Figaro.require_keys('SMTP_ADDRESS', 'SMTP_USERNAME','SMTP_PASSWORD','SMTP_DOMAIN','SUPER_ADMIN_EMAIL')
# Figaro.require_keys('AWS_S3_ACCESS_KEY','AWS_S3_SECRET_KEY','AWS_S3_BUCKET') if Rails.env.production?
