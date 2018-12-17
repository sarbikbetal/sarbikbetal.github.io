class User < ApplicationRecord
	has_many :project_users
	has_many :projects, through: :project_users
	before_save { self.email = email.downcase }
	validates :enroll, presence: true, length: { is: 9 } , uniqueness: true
	validates :name, presence: true, length: {maximum: 50}
	  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

	def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def feed
  	project.where("user_id = ?", id)
  end
end
