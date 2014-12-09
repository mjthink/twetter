module UsersHelper

    def format_content(content)
        mention = content.gsub(/[>| ]@(?<mention>\w+)/, '<a href="/\k<mention>"> @\k<mention></a>')
#        mention = content.gsub(/\s@(?<mention>\S+)/, content_tag(:a, '@\k<mention>', href =>'\k<mention>'))
        return mention.html_safe
    end
end