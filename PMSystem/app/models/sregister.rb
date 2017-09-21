class Sregister < ApplicationRecord
	validates_uniqueness_of :rno
	validates_length_of :cno, :minimum =>10
end
