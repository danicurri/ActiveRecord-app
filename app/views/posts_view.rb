class PostsView
  def ask_for_attribute(attribute_name)
    puts "Enter #{attribute_name}:"
    gets.chomp
  end

  def ask_for_id
    puts "Give a post id:"
    gets.chomp.to_i
  end

  def display_posts(posts)
    posts.each do |post|
      puts "[#{post.id}] #{post.title} - #{post.url} (#{post.votes} votes)"
    end
  end
end
