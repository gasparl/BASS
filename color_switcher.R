## --- load packages

# if the packages are not yet installed, use install.packages()
library('png')
library('neatStats')

## --- settomgs

# give replacement colors as "hex" (hexadecimal) color codes
# see e.g. https://www.w3schools.com/colors/colors_picker.asp
color_to_replace_black = '#00FF00'
color_to_replace_white = '#0000FF'

# set path to original images whose colors should be replaced
original_path = path_neat('') # sets path to script's folder, see ?path_neat
# original_path = 'give/path/here' # custom path

new_suffix = '_new' # to be added to file names
# e.g. car.png will become car_new.png

# set path where the new images should be saved
destination_path = path_neat('') # sets path to script's folder, see ?path_neat
# original_path = 'give/path/here' # custom path

# Warning:  if destination_path is same as original_path, and new_suffix is
# empty ("" or ''), the original images will be overwritten


## --- execute

setwd(original_path)
file_names = list.files(pattern = "\\.png$") # list all png files at path
for (f_name in file_names) {
    cat("converting:", f_name, fill = T)
    newimg = readPNG(f_name)
    r_b = col2rgb(color_to_replace_black) / 255
    r_w = col2rgb(color_to_replace_white) / 255
    newimg[newimg == 1] <- 2
    for (i in 1:3) {
        newimg[, , i][newimg[, , i] == 0] <- r_b[i]
    }
    for (i in 1:3) {
        newimg[, , i][newimg[, , i] == 2] <- r_w[i]
    }
    
    newname = sub('.png', paste0(new_suffix, '.png'), f_name, fixed = TRUE)
    writePNG(newimg, newname)
}
