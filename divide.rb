require 'opencv'
require 'pry'
include OpenCV

 #template  = CvMat.load("753.png")
 #match_image = CvMat.load("nana.jpg")
image = OpenCV::IplImage.load(ARGV[0])
nichi = image.threshold(0x44, 0xFF, :binary)
template = OpenCV::IplImage.load("temp2.png")

# 1枚目の処理

result = image.match_template(template,:sqdiff_normed)
pt1 = result.min_max_loc[2]
pt2 = CvPoint.new(pt1.x + template.width, pt1.y + template.height)
image.rectangle!(pt1, pt2, :color => CvColor::Yellow, :thickness => 3)
sub = image.sub_rect(0,0,pt2.x,pt1.y)
sub.save_image("./koma/match_one.png")

# 2枚目以降

main = image.sub_rect(0,pt2.y,(image.width-1),(image.height-1 - pt2.y))
main.save_image("rect_without_one.png")

result = main.match_template(template,:sqdiff_normed)

pt1 = result.min_max_loc[2]
pt2 = CvPoint.new(pt1.x + template.width, pt1.y + template.height)
main.rectangle!(pt1, pt2, :color => CvColor::Yellow, :thickness => 3)
#binding.pry
sub_a = main.sub_rect(0,0,pt2.x,pt1.y)
sub_a.save_image("./koma/match_two.png")

# 3枚目

main_two = main.sub_rect(0,pt2.y,main.width,(main.height - pt2.y))
main_two.save_image("rect_without_two.png")

binding.pry
window = OpenCV::GUI::Window.new("canvas")
window.show(main_two)
GUI::wait_key
