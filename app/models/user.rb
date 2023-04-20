class User < ApplicationRecord
    has_many :firearms
    has_many :ammos
end
