class AddSlugToAnnouncements < ActiveRecord::Migration[6.1]
  def change
    add_column :announcements, :slug, :string
  end
end
