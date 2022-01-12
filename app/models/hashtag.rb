class Hashtag < ApplicationController
  REGEXP = /#[[:word:]-]+/
  
  has_many :hashtag_questions, dependent: :destroy
  has_many :questions, through: :hashtag_questions
  
  validates :text, uniqueness: true, presence: true
end