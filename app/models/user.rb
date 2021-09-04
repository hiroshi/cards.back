class User
  include Mongoid::Document

  field :email, type: String
  validates :email, presence: true, uniqueness: true
  # TODO: unique index
  before_create do
    self.email = email.downcase
  end

  # has_many :cards

  belongs_to :root, class_name: 'Card', optional: true
  after_create do
    set(root_id: Card.create!(user: self, content: 'root').id)
  end

  field :secret, type: String, default: -> { SecureRandom.urlsafe_base64 }
end
