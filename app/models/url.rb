class Url < ApplicationRecord
    validates :originalurl , presence: true 
    validates :newurl , presence: true 
end
