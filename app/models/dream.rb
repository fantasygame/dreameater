class Dream < ActiveRecord::Base
  belongs_to :user
  has_many :dream_comments
  acts_as_votable
  scope :visible, -> (user) { user.accessible_dreams(current_scope) }
end
