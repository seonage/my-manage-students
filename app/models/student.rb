class Student < ActiveRecord::Base
  before_save{self.email=email.downcase}

  validates :name, length:{maximum: 50}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
            uniqueness: {case_sensitive: false}

  validates :name, :address, :state, :country, :phone, :zip, :city,
            presence: true

  has_many :messages

end
