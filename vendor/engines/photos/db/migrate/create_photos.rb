class CreatePhotos < ActiveRecord::Migration

  def self.up
    create_table :photos do |t|
      t.string :caption
      t.integer :picture_id
      t.integer :position

      t.timestamps
    end

    add_index :photos, :id

    load(Rails.root.join('db', 'seeds', 'photos.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "photos"})

    Page.delete_all({:link_url => "/photos"})

    drop_table :photos
  end

end
