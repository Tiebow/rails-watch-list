class ChangePosterUrlToMovies < ActiveRecord::Migration[6.0]
  def change
    change_column :movies, :poster_url, :text
  end
end
