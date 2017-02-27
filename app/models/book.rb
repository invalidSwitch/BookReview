class Book < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :reviews

  validates_presence_of :title, :description, :author

  has_attached_file :book_img, styles:
    { book_index: "250x350>", book_show: "325x475>" },
    #default_url: "/images/:style/missing.png"
    :default_url => ActionController::Base.helpers.asset_path('missing.png')

  validates_attachment_content_type :book_img, content_type: /\Aimage\/.*\Z/

end
