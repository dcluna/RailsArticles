module PostsHelper
  def status_to_s post
    case
    when post.published?
      t(:status_published)
    when post.in_revision?
      t(:status_revision)
    when post.draft?
      t(:status_draft)
    else
      ""
    end
  end
end
