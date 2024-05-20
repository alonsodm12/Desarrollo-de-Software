class CreatePersonajes < ActiveRecord::Migration[7.1]
  def change
    create_table :personajes do |t|
      t.string :arma
      t.string :habilidad
      t.string :tipoPersonaje
      t.string :usuario
      t.references :armadura, null: false, foreign_key: true

      t.timestamps
    end
  end
end
