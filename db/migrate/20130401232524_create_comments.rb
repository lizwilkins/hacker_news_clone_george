class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.column :text, :string
      t.column :story_id, :integer

      t.timestamps
    end

    create_table :story_comments do |t|
      t.column :comment_id, :integer
      t.column :story_id, :integer

      t.timestamps
    end
  end
end
