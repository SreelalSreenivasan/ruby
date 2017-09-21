class Addadmin < ApplicationRecord
	validates_uniqueness_of :empid
end
