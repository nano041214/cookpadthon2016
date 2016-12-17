require 'bcrypt'

class User < ActiveRecord::Base
  has_secure_password
  attr_accessor :password, :password_confirmation

  # bcrypt-rubyでパスワードを暗号化するには、書き込み用のアクセサメソッドpassword=を記述する
  def password=(val)
    if val.present?
      self.password_digest = BCrypt::Password.create(val)
    end
    @password = val
  end
end
