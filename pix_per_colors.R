## --- load packages

# if the packages are not yet installed, use install.packages()
library('png')
library('neatStats')

## --- settomgs

# set path to images whose pixels per colors is to be counted
original_path = path_neat('') # sets path to script's folder, see ?path_neat
# original_path = 'give/path/here' # custom path

## --- execute

if (exists("imgs_data")) {
    rm(imgs_data)
}
setwd(original_path)
file_names = list.files(pattern = "\\.png$") # list all png files at path
for (f_name in file_names) {
    cat("reading:", f_name, fill = T)
    img = readPNG(f_name)
    r_img = as.raster(img)
    tab <- table(r_img)
    tab <- data.frame(color = names(tab), count = as.integer(tab))
    RGB <- t(col2rgb(tab$color))
    tab <- cbind(tab, RGB)
    main_colors <- tab[order(-tab$count),]
    main_colors$color = as.character(main_colors$color)
    if (length(main_colors$color) != 2) {
        stop(
            "The number of different colors in this image is not 2 but ",
            length(main_colors$color),
            '!'
        )
    }
    if (!("#FFFFFF" %in% main_colors$color &
          "#000000" %in% main_colors$color)) {
        stop("#FFFFFF/#000000 not in ", main_colors$color[1:2])
    }
    c_b = main_colors$count[main_colors$color == "#000000"]
    c_w = main_colors$count[main_colors$color == "#FFFFFF"]
    if ((c_b + c_w) != 90000) {
        stop("c_b + c_w ", c_b + c_w)
    }
    thisimg = data.frame(
        file = f_name,
        black = c_b,
        white = c_w,
        stringsAsFactors = FALSE
    )
    if (exists("imgs_data")) {
        imgs_data = rbind(imgs_data, thisimg)
    } else {
        imgs_data =  thisimg
    }
}
imgs_data$SUM = imgs_data$black + imgs_data$white

print(imgs_data)

## if you want to write table to txt file
# write.table(
#     imgs_data,
#     file = "color_ratios.txt",
#     sep = "\t",
#     quote = F,
#     row.names = F
# )
