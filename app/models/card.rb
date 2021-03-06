class Card
  include Mongoid::Document

  field :content, type: String
  validates :content, presence: true

  belongs_to :user
  validates :user, presence: true

  # Tree
  belongs_to :parent, class_name: 'Card', optional: true
  has_many :children, class_name: 'Card'

  # has_many :histories
  # before_destroy do
  #   histories.create!(attributes)
  # end

  def key
    Base64.urlsafe_encode64(Digest::SHA2.digest(user.secret + id))
  end
end
