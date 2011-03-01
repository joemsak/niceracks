class CreateLadies < ActiveRecord::Migration

  def self.up
    create_table :ladies do |t|
      t.string :name
      t.text :bio
      t.integer :photo_id
      t.integer :position

      t.timestamps
    end

    add_index :ladies, :id

    load(Rails.root.join('db', 'seeds', 'ladies.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "ladies"})

    Page.delete_all({:link_url => "/ladies"})

    drop_table :ladies
  end

end
