class CreateGemItems < ActiveRecord::Migration
  def self.up
    create_table :gem_items do |t|
      t.string :name
      t.string :info
      t.string :version
      t.integer :version_downloads
      t.string :authors
      t.integer :downloads
      t.string :project_uri
      t.string :gem_uri
      t.string :homepage_uri
      t.string :wiki_uri
      t.string :documentation_uri
      t.string :mailing_list_uri
      t.string :source_code_uri
      t.string :bug_tracker_uri
      t.text :dependencies

      t.timestamps
    end
  end

  def self.down
    drop_table :gem_items
  end
end
