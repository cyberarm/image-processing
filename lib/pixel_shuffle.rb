class PixelShuffle
  include Common

  def initialize(image)
    @image = image
    process
  end

  def process
    puts "Image Processor: Starting processor at #{Time.now}."
    @start_time = Time.now
    @width  = @image.width
    @height = @image.height

    puts "Image Processor: image data: width: #{@width}, height: #{@height}."

    @height.times do |y|
      pixels = []
      count  = 0

      @width.times do |x|
        pixels << @image[x, y] if count.even?
      end

      pixels.each do |pixel|
        count+=1
        if count.even?
          random_x = SecureRandom.random_number(@width)
          random_y = SecureRandom.random_number(@height)
          @image[random_x,random_y] = pixel
        end
      end
    end

    @end_time = Time.now
    puts "Finished processing in #{@end_time - @start_time}."
    processed
  end

  def processed
    save_image(@image)
  end
end
