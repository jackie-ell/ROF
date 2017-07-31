module ApplicationHelper

  def get_first_word(category)
    category.to_s.split.first
  end
end
