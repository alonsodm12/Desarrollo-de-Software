class Personaje < ApplicationRecord
  belongs_to :armadura

  validates :arma, :habilidad, :tipoPersonaje, :usuario, presence: true
end
