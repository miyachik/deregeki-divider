require 'opencv'
require 'pry'
include OpenCV

image = OpenCV::IplImage.load(ARGV[0])

# Todo
# 再帰処理化

sub = image.sub_rect(0,0,480,515)
sub.save_image("./koma/#{ARGV[0]}_1.png")

sub = image.sub_rect(0,555,480,350)
sub.save_image("./koma/#{ARGV[0]}_2.png")

sub = image.sub_rect(0,950,480,350)
sub.save_image("./koma/#{ARGV[0]}_3.png")

sub = image.sub_rect(0,1345,480,350)
sub.save_image("./koma/#{ARGV[0]}_4.png")

sub = image.sub_rect(0,1745,480,350)
sub.save_image("./koma/#{ARGV[0]}_5.png")



window = OpenCV::GUI::Window.new("canvas")
window.show(sub)
GUI::wait_key
