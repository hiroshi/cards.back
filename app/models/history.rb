class History
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  belongs_to :card
  validates :card_id, presence: true
end
