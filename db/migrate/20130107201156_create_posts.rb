class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :title
      t.text :body
      t.text :friendly_url
      t.boolean :show, :default => 0

      t.timestamps
    end
  end
end
