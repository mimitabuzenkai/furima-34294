class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :info
    validates :image

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :sales_status_id
      validates :delivery_charge_id
      validates :prefecture_id
      validates :scheduled_delivery_id
    end
  end

  VALID_PRICEL_HALF = /\A[0-9]+\z/
  validates  :price,  presence: true, format: {with: VALID_PRICEL_HALF}, numericality: { only_integer: true,
    greater_than: 300, less_than: 10000000
  }

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery

end
