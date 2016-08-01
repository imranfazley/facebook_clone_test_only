class Status < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 8, message: "title is too short" }
  validates :content, presence: true, length: { minimum: 10, message: "content is too short" }
  
  belongs_to :user
  has_many :likes, dependent: :destroy

  default_scope { order('created_at DESC') }

end
