class Scratchifier
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

    @width/16.times do |x|
      random_x = SecureRandom.random_number(@width)
      row = []

      @height.times do |y|
        row << @image[x, y]
      end

      local_y = 0
      row.each do |item|
        @image[random_x, local_y] = ChunkyPNG::Color('white @ 0.0')#item
        local_y+=1
      end
    end
    @end_time = Time.now
    processed
  end

  def processed
    save_image(@image)
  end
end
