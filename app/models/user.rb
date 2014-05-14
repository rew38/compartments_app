class User < ActiveRecord::Base
  has_secure_password
  has_many :projects
  def admin?
    return is_admin
  end

end
