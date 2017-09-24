class Response < ApplicationRecord
	validates :sid, uniqueness: { scope: [:cno] }
end
