class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  acts_as_voter
  has_many :pins
  has_many :comments

  acts_as_followable
  acts_as_follower

  def self.all_except(user)
    where.not(id: user)
  end

end
