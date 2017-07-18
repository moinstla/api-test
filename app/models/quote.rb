class Quote < ApplicationRecord
  paginates_per 20
  max_paginates_per 50

  validates :content, :author, presence: true

  scope :author_search, -> (input) {where("author like ?", "%#{input}%")}
  scope :content_search, -> (input) {where("author like ?", "%#{input}%")}

end
