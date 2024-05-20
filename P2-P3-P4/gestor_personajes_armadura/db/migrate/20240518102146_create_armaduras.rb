class CreateArmaduras < ActiveRecord::Migration[7.1]
  def change
    create_table :armaduras do |t|
      t.string :tipo

      t.timestamps
    end
  end
end
