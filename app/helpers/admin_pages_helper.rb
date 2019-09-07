module AdminPagesHelper
	def render_page_status_badge_class(page)
		badge_class = 'badge-success text-white'
		badge_class = 'badge-secondary' if page.published_at.nil?
		badge_class
	end
end