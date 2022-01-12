class Hashtag < ApplicationController
  REGEXP = /#[[:word:]-]+/
  
  validates :text, uniqueness: true, presence: true
end