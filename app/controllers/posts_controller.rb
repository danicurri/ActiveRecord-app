require_relative "../views/posts_view"

class PostsController
  def initialize
    @view = PostsView.new
  end

  def index
    posts = Post.all
    @view.display_posts(posts)
  end

  def create
    title  = @view.ask_for_attribute(:title)
    url   = @view.ask_for_attribute(:url)

    Post.create(
      title:   title,
      url:    url,
      votes:  0
    )
  end

  def update
    post  = find_post
    title  = @view.ask_for_attribute(:title)
    url   = @view.ask_for_attribute(:url)

    post.update(
      title:   title,
      url:    url
    )
  end

  def destroy
    post = find_post
    post.destroy
  end

  def upvote
    post = find_post
    post.votes += 1
    post.save
  end

  private

  def find_post
    posts = Post.all
    @view.display_posts(posts)

    id = @view.ask_for_id
    Post.find(id)
  end
end
