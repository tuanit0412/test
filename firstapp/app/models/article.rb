class Article < ApplicationRecord
	has_many :comments, dependent: :destroy
	#if you delete an article, its associated comments will also need to be deleted,
	#otherwise they would simply occupy space in the database. Rails allows you 
	#to use the dependent option of an association to achieve this. 
	validates :title, presence: true,
                    length: { minimum: 5 }	#presence: true rang buoc ko duoc de null
					#neu null xuat ra cau thong bao 
					#toi thieu 5 ky tu cho title
end
