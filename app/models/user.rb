class User
  include Mongoid::Document

  field :email, type: String
  validates :email, presence: true, uniqueness: true
  # TODO: unique index

  has_many :cards

  before_create do
    self.email = email.downcase
  end
end
