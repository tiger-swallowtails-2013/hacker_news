class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.references :posts
      t.references :comments
    end
  end
end


      
