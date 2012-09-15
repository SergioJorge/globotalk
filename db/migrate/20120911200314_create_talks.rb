class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.string :nome
      t.datetime :data
      t.string :responsavel
      t.text :assunto
      t.text :mais_sobre

      t.timestamps
    end
  end
end
