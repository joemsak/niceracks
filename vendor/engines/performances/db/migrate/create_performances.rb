class CreatePerformances < ActiveRecord::Migration

  def self.up
    create_table :performances do |t|
      t.string :venue_name
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :cost
      t.text :description
      t.string :link
      t.integer :position

      t.timestamps
    end

    add_index :performances, :id

    load(Rails.root.join('db', 'seeds', 'performances.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "performances"})

    Page.delete_all({:link_url => "/performances"})

    drop_table :performances
  end

end
