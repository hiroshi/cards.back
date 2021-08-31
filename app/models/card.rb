class Card
  include Mongoid::Document

  field :content, type: String
  validates :content, presence: true

  belongs_to :user
  validates :user, presence: true
end
