class User < ApplicationRecord

  validates :username, presence: {message: "用户名不能为空"}
  validates :username, uniqueness: {message: "用户名已存在"}
  # validates :password, presence: {message: "密码不能为空"}
  validates :password, length: {minimum: 6,message:"密码长度最短为6位"}

  has_many :blogs
  has_many :public_blogs, -> {where(is_public: true)},class_name: "Blog"
  has_one :latest_blog, ->{order("id desc")},class_name: "Blog"

  attr_accessor :old_password
  attr_accessor :password
  attr_accessor :password_confirmation

  validate :validate_password, on: :create
  before_create :set_password

  def self.authenticate username,password
    user = User.find_by(username: username)
    if user and user.valid_password? password
      user
    else
      nil
    end
  end

  def valid_password? password
    self.crypted_password == Digest::SHA256.hexdigest(password + self.salt)
  end

  private

  def validate_password
    if self.password.blank?
      self.errors.add(:password,"密码不能为空")
      return false
    end
    unless self.password == self.password_confirmation
      self.errors.add(:password_confirmation,"密码不一致")
      return false
    end

    return true
  end

  def set_password
    self.salt = Time.now.to_i
    self.crypted_password = Digest::SHA256.hexdigest(self.password + self.salt)
  end
end
