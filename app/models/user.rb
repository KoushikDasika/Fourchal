class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :competitions_attributes

  has_many :competitions
  has_many :competition_entries
  has_many :challenge_entries, :through => :competition_entries

end
