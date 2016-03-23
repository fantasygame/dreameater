class DreamDecorator < Draper::Decorator
  delegate_all

  def like_count
    get_likes.size
  end
end
