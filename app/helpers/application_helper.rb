module ApplicationHelper
  def main_image(prototype)
    prototype.thumbnails[0].content.url
  end
end
