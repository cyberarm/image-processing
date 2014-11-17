require "pp"
require "oily_png"
require "securerandom"
require_relative "lib/common"
require_relative "lib/dotifier"
require_relative "lib/scratchifier"
require_relative "lib/pixel_shuffle"
@retries = 0

class ImageProcessor
  include ChunkyPNG

  def initialize(filename=:undefined, method=Scratchifier)

    puts "Image Processor: Loading image... please wait, this can take awhile..."
    start_time = Time.now
    if filename == :undefined
      @image = Image.from_file("./data/waterfalls.png")
    else
      @image = Image.from_file(filename)
    end
    end_time = Time.now

    puts "Image Processor: Loaded image in #{end_time-start_time}. Starting processor..."
    method.new(@image)
  end
end

begin
  ImageProcessor.new(ARGV.first, Kernel.const_get(ARGV[1]))
rescue Errno::ENOENT => e
  puts "#{e}, Please check your spelling and ensure that you include the full path from '#{Dir.pwd}' to the file."

rescue NameError => e
  if @retries > 1
    puts "Can't find a modifier by the name of: #{ARGV[1]}, please check your spelling."
    raise e
  else
    @retries+=1
    ARGV[1] = ARGV[1].capitalize
    retry
  end
end
