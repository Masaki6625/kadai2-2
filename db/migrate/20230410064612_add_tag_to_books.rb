class AddTagToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :tag, :string
  end
end
