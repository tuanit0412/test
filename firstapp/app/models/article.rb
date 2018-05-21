class Article < ApplicationRecord
	has_many :comments, dependent: :destroy
	#if you delete an article, its associated comments will also need to be deleted,
	#otherwise they would simply occupy space in the database. Rails allows you 
	#to use the dependent option of an association to achieve this. 
	validates :title, presence: true,
                    length: { minimum: 5 }	#presence: true rang buoc ko duoc de null
					#neu null xuat ra cau thong bao 
					#toi thieu 5 ky tu cho title
	validates :title,  numericality: {only_integer: true}
	validates :column, acceptance: {message: "khong duoc de trong"}
	#validates :title, exclusion: {in: %w(kevin 1 ca us), message: "%{value} is reserved"}
	#validates :size, inclusion: {in: %w(small, medium, large), message: "%{value} is not a valid size"}
end
