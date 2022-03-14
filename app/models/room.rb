class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy

  mount_uploader :image, ImagesUploader

  validates :room_name, presence: true
  validates :room_introduction, presence: true
  validates :price, numericality: true, presence: true
  validates :adress, presence: true
  validates :image, presence: true

end
