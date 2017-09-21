class Rregister < ApplicationRecord
	validates_uniqueness_of :cinno
	validates_length_of :cno, :minimum =>10
end
