xml.instruct! :xml, version: '1.0'
xml.rss version: '2.0', 'xmlns:atom' => 'http://www.w3.org/2005/Atom' do

  xml.channel do
    xml.title 'Group Buddies Blog'
    xml.description 'This is our blog, designed to share our thoughts about the job we love.'
    xml.link feed_url
    xml.tag! 'atom:link', rel: 'self', type: 'application/rss+xml', href: feed_url

    posts.each do |post|
      xml.item do
        xml.title post.title
        xml.description post.processed_body
        xml.pubDate post.published_at.to_s(:rfc822)
        xml.link post_url(post)
        xml.guid post_url(post)
      end
    end
  end

end
