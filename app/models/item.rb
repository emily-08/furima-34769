class Item < ApplicationRecord
  has_one_attached :image
  has_one :order
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :delivery_area
  belongs_to :delivery_day

  with_options presence: true do
    validates :title, length: { maximum: 40 }
    validates :text,  length: { maximum: 1000 }
    validates :price, numericality: true, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
    validates :image
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :delivery_charge_id
      validates :delivery_area_id
      validates :delivery_day_id
    end
  end
end