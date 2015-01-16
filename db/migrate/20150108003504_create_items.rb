class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.belongs_to :list, index: true

      t.timestamps
    end
  end
end
