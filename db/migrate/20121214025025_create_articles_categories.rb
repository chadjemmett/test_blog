class CreateArticlesCategories < ActiveRecord::Migration
  def up
    create_table :article_categories, :id => false do |t|
      t.references :articles
      t.references :category
    end
  end

  def down
    drop_table :articles_categories
  end
end
