class Comment < ActiveRecord::Base
  attr_accessible :article_id, :body, :email, :name
  belongs_to :article
  #added the email validation just for kicks. It was originally in the user model.
 #validates :email, :uniqueness => true, :length => {:within => 5..50}, :format => { :with =>/^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i}


  def article_should_be_published
   errors.add(:article_id, "Is not yet published.") if article && !article.published?
 end
 
 after_create :email_article_author
 validates :name, :email, :body, :presence => true
 validate :article_should_be_published
 
  def email_article_author
    puts "We will notify #{article.user.email} in Chapter 9."
  end


 def after_create
   puts "We will notify the author in Chapter 9."
 end


end
