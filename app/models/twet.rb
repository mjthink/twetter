class Twet < ActiveRecord::Base
  belongs_to :user

  validates :content, :presence => true, :length => { :minimum => 2, :maximum => 140 }
  validates :user, :presence => true

  # Gets all twets made by the users referenced by the ids passed, starting with the
  # most recent twet made.
  #
  def self.by_user_ids(*ids)
    where(:user_id => ids.flatten.compact.uniq).order('created_at DESC')
  end
  def format_content
    mention = self.content.gsub(/[>| ]@(?<mention>\w+)/, '<a href="/\k<mention>"> @\k<mention></a>')
#    mention = content.gsub(/\s@(?<mention>\S+)/, content_tag(:a, '@\k<mention>', href =>'\k<mention>'))
    return mention.html_safe
  end
end
