class RemoveFieldAssuntoFromTalks < ActiveRecord::Migration
  def change
    remove_column :talks, :assunto
  end
end
