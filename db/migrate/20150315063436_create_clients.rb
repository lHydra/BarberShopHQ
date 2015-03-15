class CreateClients < ActiveRecord::Migration
  def change
  	create_table :clients do |t|
  		t.text :name #столбец name с типом text
  		t.text :phone
  		t.text :datestamp
  		t.text :barber
  		t.text :color

  		t.timestamps
  	end
  end
end
