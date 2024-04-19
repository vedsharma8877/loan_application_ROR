class User < ApplicationRecord
  rolify
  
  has_many :loans
  def admin?
    has_role?(:admin)
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
