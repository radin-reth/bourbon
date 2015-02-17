activate :autoprefixer
activate :directory_indexes

set :css_dir, "assets/stylesheets"
set :js_dir, "assets/javascripts"
set :images_dir, "assets/images"
set :fonts_dir, "assets/fonts"

configure :development do
  activate :livereload
  set :debug_assets, true
end

configure :build do
  activate :minify_css
  activate :minify_html
  activate :minify_javascript
end

configure :deploy do
  # deploy.method = :git
end

helpers do
  def nav_link(link_text, page_url, options = {})
    options[:class] ||= ""
    if current_page.url.length > 1
      current_url = current_page.url.chop
    else
      current_url = current_page.url
    end
    options[:class] << " is-active" if page_url == current_url
    link_to(link_text, page_url, options)
  end
end
