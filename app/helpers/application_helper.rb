module ApplicationHelper
	def is_active?(link_path)
    if link_path.size == 1
      current_page?(link_path.first) ? "active" : ""
    elsif link_path.size > 1
      link_path.include?(request.path) ? "active" : ""
    end
  end
end
