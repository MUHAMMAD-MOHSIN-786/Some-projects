data_folder = "/project_omair/pokemon_data-2/"
path_for_images = paste0(data_folder,'images/abomasnow.png')
path_to_save_output = './goldsmith_project/even_more_advanced/'
path_for_data = paste0(data_folder,'pokemon_copy.csv')
library(magick)
data_file = read.csv(path_for_data)
head(data_file)
images = data_file$Name
images

# let's make watermark
making_watermark = function(watermark_part1){
  image_1 = paste0(data_folder, "images_copy/", image , ".png")
  #if (image == data_file$Name)
  single_row = subset(data_file, data_file$Name == image)
  water_mark_part1 = single_row[,2]
  water_mark_part1
}

# Let's add a watermark now
watermark_applied = function(pokemon_image){image_1 = paste0(data_folder, "images_copy/", image , ".png")
pokemon_image = image_read(image_1)
pokemon_image
image_with_watermark = image_annotate(pokemon_image, text = making_watermark(watermark_part1),
                                      gravity = "Center", 
                                      location = "+0+10", # Moving the mark down by 15 pixels from its 'Center' gravity point
                                      size = 20,  
                                      color = "#00000399",
                                      strokecolor = NULL, 
                                      boxcolor = NULL)
image_write(image_with_watermark,
            path = paste0(path_to_save_output,"output/",image,".png"))
}



#image_with_watermark
for (image in images)
  making_watermark(watermark_part1)
  watermark_applied(pokemon_image)
