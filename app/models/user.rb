class User < ActiveRecord::Base

  #essentially a before save method that downcases the inputted email for saving
  #it to the database using a callback (block). This removes uniqueness issue with case sensitivity,
  # at the DB level instead of just the front-end/controller level
  before_save {self.email = email.downcase}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates(:name, presence: true, length: {maximum: 50})
  validates(:email, presence: true, length: {maximum: 255},
              format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false})

  has_secure_password
  validates(:password, length: {minimum: 6})

end
