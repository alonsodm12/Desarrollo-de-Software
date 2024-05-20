class Armadura < ApplicationRecord
    has_many :personajes

    validates :tipo, presence: true
end
