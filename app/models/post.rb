class Post < ApplicationRecord
    belongs_to :user
    has_many :post_tag_relations, dependent: :delete_all
    has_many :tags, through: :post_tag_relations
    has_one_attached :image
    default_scope -> { order(created_at: :desc) }
    validates :user_id, presence: true
    validates :name, presence: true, length: { maximum: 20 }
    validates :address, presence: true, length: { maximum: 30 }
    validates :content, presence: true, length: { maximum: 1000 }
    validates :image,   content_type: { in: %w[image/jpeg image/gif image/png],
                                      message: "must be a valid image format" },
                      size:         { less_than: 5.megabytes,
                                      message: "should be less than 1MB" }
                                      
    def display_image
        image.variant(resize_to_limit: [200, 200])
    end
end
