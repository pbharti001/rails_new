class Album < ActiveRecord::Base
  belongs_to :user
  has_many :album_attachments, dependent: :destroy
  accepts_nested_attributes_for :album_attachments
end
