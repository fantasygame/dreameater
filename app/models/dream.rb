class Dream < ActiveRecord::Base
  belongs_to :user
  has_many :dream_comments, dependent: :destroy
  acts_as_votable
  scope :visible, -> (user) { user.accessible_dreams(current_scope) }
  accepts_nested_attributes_for :dream_comments
end
