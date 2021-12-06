class AddStyleToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :style, :string
  end
end
