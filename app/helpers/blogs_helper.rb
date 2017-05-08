module BlogsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_blogs_path #newアクション、confirmアクションの時はconfirm_blogs_pathを返す
    elsif action_name == 'edit'
      blog_path #editアクションの時はblog_pathを返す
    end
  end
end