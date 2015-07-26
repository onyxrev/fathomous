class CreatePosts < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'

    create_table :posts, id: false do |t|
      t.primary_key :id, :uuid, :default => 'uuid_generate_v1()'
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
