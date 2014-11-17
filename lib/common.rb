module Common
  def save_image(image)
    puts "Image Processor: Saving image..."
    @save_time_start = Time.now
    @image.save("./data/results/image_#{SecureRandom.uuid}.png", :fast_rgba)
    puts "Image Processor: Save time: #{Time.now-@save_time_start}."
  end
end