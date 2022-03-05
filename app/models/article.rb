class Article < ApplicationRecord

    # Associations
    belongs_to :user

    # Validation on title
    validates :title, presence: true, length: {minimum: 3, maximum: 50}

    # Validation on description
    validates :description, presence: true, length: { minimum: 10, maximum: 300}

    # Validation on presence of user_id
    validates :user_id, presence: true


end