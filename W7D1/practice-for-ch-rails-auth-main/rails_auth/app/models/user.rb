class User < ApplicationRecord
    validates :username, :session_token, presence:true
    validates :password_digest, presence: { message: 'Password can\'t be blank' }
    validates :password, length: { minimum: 6, allow_nil: true }

# Validate the presence of password_digest and set the error message to Password can't be blank
# Validate the length of password and set allow_nil to true
# Make sure that ensure_session_token gets called before validations

def find_by_credentials
end
# Write ::find_by_credentials
# This method takes in a username and a password and returns the user that matches (or nil if no match)
# This method should use #is_password? (see below).
def generate_unique_session_token
end
# Write #generate_unique_session_token
# This method uses SecureRandom::urlsafe_base64 to return a unique 16-digit pseudorandom string
def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
# Write #password=
# This method sets @password equal to the argument given so that the appropriate validation can happen
# This method also encrypts the argument given and saves it as this user's password_digest
# Remember: you have to add an attr_reader for password for the validation to occur!
def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end
# Write #is_password?
# This method takes a password and checks it against the password_digest to determine whether or not password is, in fact, the user's password.
def reset_session_token!
end
# Write #reset_session_token!
# This method resets the user's session_token and saves the user
def ensure_session_token
end
# Write #ensure_session_token
# This method makes sure that the user has a session_token set, setting one if none exists

end
