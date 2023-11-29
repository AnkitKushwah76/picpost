module ApplicationHelper
  include Pagy::Frontend

  def modal_title
    # params[:controller] == 'posts' ? 'New Post' : 'New Comment'
  end
end
