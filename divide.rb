require 'opencv'
require 'pry'
include OpenCV

image = OpenCV::IplImage.load(ARGV[0])
template = OpenCV::IplImage.load("template.png")

# 1枚目の処理

result = image.match_template(template,:sqdiff_normed)
pt1 = result.min_max_loc[2]
pt2 = CvPoint.new(pt1.x + template.width, pt1.y + template.height)
sub = image.sub_rect(0,0,pt2.x,pt1.y)
sub.save_image("./koma/match_one.png")

# 2枚目

main = image.sub_rect(0,pt2.y,(image.width-1),(image.height-1 - pt2.y))
main.save_image("rect_without_one.png")

result = main.match_template(template,:sqdiff_normed)

pt1 = result.min_max_loc[2]
pt2 = CvPoint.new(pt1.x + template.width, pt1.y + template.height)
sub_a = main.sub_rect(0,0,pt2.x,pt1.y)
sub_a.save_image("./koma/match_two.png")

# 3枚目

main_two = main.sub_rect(0,pt2.y,main.width,(main.height - pt2.y))
main_two.save_image("rect_without_two.png")

main_two.save_image("./koma/match_three.png")

window = OpenCV::GUI::Window.new("canvas")
window.show(main_two)
GUI::wait_key
