module ApplicationHelper
	def selected_if_page page_name=''
		'selected' if page_name == @section_name
	end
end
