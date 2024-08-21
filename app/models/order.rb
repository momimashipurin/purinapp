class Order < ApplicationRecord

  VALID_POSTAL_CODE_REGEX = /\A\d{7}\z/

  validates :total_payment, presence: true
  validates :payment_type, presence: true
  validates :shipping_cost, presence: true
  validates :address, length: { in: 1..50 }
  validates :postal_code, presence: true, format: { with: VALID_POSTAL_CODE_REGEX }
  validates :name, length: { in: 1..50 }

  has_many :order_details, dependent: :destroy
  belongs_to :customer
  has_many :items, through: :order_details

  enum payment_type: {クレジットカード:0, 銀行振込:1}
  enum status: {入金待ち:0, 入金確認:1, 製作中:2, 発送準備中:3, 発送済み:4}

end