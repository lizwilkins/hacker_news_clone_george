class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.column :title, :string
      t.column :url, :string

      t.timestamps
    end
  end
end
