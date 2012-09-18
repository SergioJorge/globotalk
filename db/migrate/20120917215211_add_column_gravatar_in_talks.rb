class AddColumnGravatarInTalks < ActiveRecord::Migration
  def change
    add_column :talks, :gravatar_email, :string
  end
end
