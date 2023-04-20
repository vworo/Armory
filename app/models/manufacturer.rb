class Manufacturer < ApplicationRecord
    has_many :firearms
    has_many :ammos
end