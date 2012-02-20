module PostsHelper
  def status_to_s post
    case
    when post.published?
      t(:published)
    when post.in_revision?
      t(:in_revision)
    when post.draft?
      t(:draft)
    else
      ""
    end
  end
end
