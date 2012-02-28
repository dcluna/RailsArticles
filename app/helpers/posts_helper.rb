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

  def translated_statuses # translates statuses
    Post.statuses.collect {|key,value| [I18n.t(key),key]}
  end
end
