class Word < ApplicationRecord
	validates :total_words, :word_count, presence: true
	serialize :word_count
	belongs_to :book
end
