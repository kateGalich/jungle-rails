class User < ApplicationRecord
  has_secure_password

  def self.authenticate_with_credentials(email, password)
   
    user = User.where(["trim(lower(email)) = trim(lower(:email))", { email: email }])

    if user && user[0] && user[0].authenticate(password)
      return user
    end
    return nil
  end

  validates_uniqueness_of :email, :case_sensitive => false

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, :length => {:minimum => 6}


end
