# ImageProcessing
A simple project exploring image manipulation in Ruby using Chunky_PNG.

# Usage
`ruby image-processing.rb "./path/to/image.png" ClassNameOfProcessor`

For example:
`ruby image-processing.rb image.png Dotifier`

# Processors
* `Dotifier` Adds a grid of large, round, semi-transparent circles.
* `PixelShuffle` Randomly sets pixels from other pixels.
* `Scratchifier` Adds vertical white lines.
