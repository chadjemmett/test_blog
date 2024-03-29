class Article < ActiveRecord::Base
  attr_accessible :body, :excerpt, :location, :published_at, :title
    validates :title,  :presence => true
    validates :body,  :presence => true
    belongs_to :user
    has_and_belongs_to_many :categories
    has_many :comments
    
    scope :published, where("articles.published_at IS NOT NULL")
    scope :draft, where("articles.published_at IS NULL")
    scope :recent, lambda {published.where("articles.published_at > ?", 1.week.ago.to_date)}
    scope :where_title, lambda {|term| where("articles.title LIKE ?", "%#{term}%")}

  def long_title
    "#{title} - #{published_at}"
  end #end of long title method.

  def published?
    published_at.present?
  end

end #end of articles class.

