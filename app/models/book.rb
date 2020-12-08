class Book < ApplicationRecord
	belongs_to :project
	has_many :words, dependent: :destroy
	has_one_attached :file, dependent: :destroy

	def get_words
		file_type = self.file.blob.content_type
		if file_type == "text/plain"
			handle_txt_file
		else
			handle_docx_file
		end
	end

	private
	def handle_docx_file
		doc = Docx::Document.open(self.file.download)

		words = doc.paragraphs.map do |para|
			para.to_s.split(Regexp.union([" ", ".", "\"", "?", ",", "-", "—"] + "0 1 2 3 4 5 6 7 8 9".split(" "))).reject { |word| word == "" }
		end

		word_count = Hash.new { |h, k| h[k] = 0 }

		words.flatten.each do |word|
			word_count[word] += 1
		end

		add_words_to_db(word_count)
	end

	def handle_txt_file
		
	end

	def add_words_to_db(word_count)
		Word.create! total_words: word_count.keys.size, word_count: word_count, book_id: self.id
	end
end
