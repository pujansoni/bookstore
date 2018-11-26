class RenameCoverFilename < ActiveRecord::Migration[5.0]
  def change
    rename_column :books, :cover_filename, :cover
  end
end
