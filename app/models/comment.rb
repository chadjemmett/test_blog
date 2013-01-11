class Comment < ActiveRecord::Base
  attr_accessible :article_id, :body, :email, :name
  belongs_to :article
  validates :email, :uniqueness => true, :length => {:within => 5..50}, :format => { :with =>/^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i}

  def article_should_be_published
   errors.add(:article_id, "Is not yet published.") if article && !article.published?
 end

 validates :name, :email, :body, :presence => true
 validates :article_should_be_published




end
