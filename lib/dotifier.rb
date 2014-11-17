class Dot
  attr_reader :size
  attr_reader :image
  def initialize(size)
    @size = size
    @image = ChunkyPNG::Image.new(size, size, ChunkyPNG::Color::TRANSPARENT)
    @image.circle(@image.width/2, @image.height/2, @image.width/2, ChunkyPNG::Color::TRANSPARENT, ChunkyPNG::Color('black @ 0.5'))
  end
end

class Dotifier
  include Common

  def initialize(image)
    @image = image
    @deviser = 16
    @multiplier = 10
    @spot  = Dot.new((@image.width/@deviser)/@deviser*@multiplier)
    process
  end

  def process
    puts "Image Processor: Starting processor at #{Time.now}."
    @start_time = Time.now
    @circle_counter = 0
    @width  = @image.width
    @height = @image.height

    puts "Image Processor: image data: width: #{@width}, height: #{@height}."
    @number = @image.width/@deviser
    puts "Image Processor: Number of circles: #{@number}, circle size: #{@spot.size}."

    1.upto(@number) do |n|
      y = @image.height/@deviser*n

      1.upto(@number) do |i|
        x = @image.width/@deviser*i
        begin
          @image.compose!(@spot.image, x, y)
          @circle_counter+=1
        rescue ChunkyPNG::OutOfBounds
        end
      end
    end

    @end_time = Time.now
    puts "Image Processor: Processing time: #{@end_time-@start_time}, created: #{@circle_counter} circles (#{(@image.width/@deviser)-@circle_counter} errors)."
    processed
  end

  def processed
    save_image(@image)
  end
end
