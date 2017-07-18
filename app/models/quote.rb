class Quote < ApplicationRecord
  paginates_per 5
  max_paginates_per 10

  validates :content, :author, presence: true

  scope :author_search, -> (input) {where("author like ?", "%#{input}%")}
  scope :content_search, -> (input) {where("author like ?", "%#{input}%")}

end
