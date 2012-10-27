class CreateCampaigns < ActiveRecord::Migration
	def change
	    create_table :campaigns do |t|
	      t.integer :user_id
	      t.string :category
	      t.string :coop_name
	      t.string :coop_location
	      t.string :short_description	
	      t.string :long_description
	      t.string :video_link
	      t.boolean :active, default: false

	      t.timestamps
    	end
	    add_index :campaigns, [:user_id, :created_at]
	    add_index :campaigns,:category
	    add_index :campaigns,:coop_name
	    add_index :campaigns,:coop_location
	    add_index :campaigns,:active
	end
end