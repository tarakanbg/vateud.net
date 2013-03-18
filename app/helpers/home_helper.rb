module HomeHelper
  def randomizer(total, desired)
    (0..total).to_a.sample desired
  end

  def random_horizontal_images(desired)
    image_array = []
    path = "stock/horizontal/"
    for number in randomizer(horizontal_images_count, desired)
      image_array << path + number.to_s + ".jpg"
    end
    image_array
  end

  def horizontal_images_count
    41
  end

  def random_rounded_small_images(desired)
    image_array = []
    path = "stock/rounded_small/"
    for number in randomizer(horizontal_images_count, desired)
      image_array << path + number.to_s + ".png"
    end
    image_array
  end
end
