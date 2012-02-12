module PostsHelper
  def status_to_s status
    case
    when 1
      t(:status_published)
    when 2
      t(:status_revision)
    when 3
      t(:status_draft)
    else
      ""
    end
  end
end
