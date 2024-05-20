class PersonajeSerializer < ActiveModel::Serializer
    attributes :id, :arma, :habilidad, :tipoPersonaje, :usuario, :created_at, :updated_at
  
    belongs_to :armadura
end
  