class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
 	has_many :pins
 	belongs_to :zip

 	validates :email, presence: true
 	validates_uniqueness_of :email
end
