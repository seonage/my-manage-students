class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :not_admins, -> { where(admin: false)}
  scope :admins, -> { where(admin: true)}

  has_many :messages

  validates_presence_of :name

  before_validation :create_password, on: :create

  def create_password
    unless self.admin?
      password = Rails.env.production? ? Devise.friendly_token[0, 8] : 'serkan471905'
      self.password               = password
      self.password_confirmation  = password
    end
  end
end
