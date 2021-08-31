class User
  include Mongoid::Document

  field :email, type: String
  validates :email, presence: true

  before_create do
    self.email = email.downcase
  end
end
