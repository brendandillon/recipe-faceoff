class User < ApplicationRecord
  has_secure_password

  def is_admin?
    role == 1
  end

end
