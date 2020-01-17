library('neatStats')
library("ggplot2")
library('imager')
library('jpeg')

setwd(path_neat('300x300'))
file_names = list.files(pattern = "\\.jpg$")

if (exists("imgs_data")) {
    rm(imgs_data)
}

for (f_name in file_names) {
    # f_name = "boy_bicycle.jpg"
    cat(f_name, fill = T)


    im <- load.image(f_name)
    im2 = colorise(im,  ~ . < 0.1, "black")
    new_img = colorise(im2,  ~ . >= 0.1, "white")
    newfile = paste0('bw/', f_name)
    imager::save.image(new_img, newfile)

    img = readJPEG(newfile)

    img <- as.raster(new_img)
    tab <- table(img)
    tab <- data.frame(color = names(tab), count = as.integer(tab))
    if (sum(tab$count) != 90000) {
        stop("sum(tab$count) ", sum(tab$count))
    }
    RGB <- t(col2rgb(tab$color))
    tab <- cbind(tab, RGB)
    main_colors <- tab[order(-tab$count),]
    main_colors$color = as.character(main_colors$color)
    if (!("#FFFFFF" %in% main_colors$color[1:2] &
          "#000000" %in% main_colors$color[1:2])) {
        stop("#FFFFFF/#000000 not in ", main_colors$color[1:2])
    }
    c_b = main_colors$count[main_colors$color == "#000000"]
    c_w = main_colors$count[main_colors$color == "#FFFFFF"]
    c_g = sum(main_colors$count[main_colors$color != "#FFFFFF" &
                                    main_colors$color != "#000000"])
    if ((c_b + c_w + c_g) != 90000) {
        stop("c_b + c_w + c_g ", c_b + c_w + c_g)
    }
    thisimg = data.frame(
        file = f_name,
        black = c_b,
        white = c_w,
        gray = c_g,
        stringsAsFactors = FALSE
    )
    if (exists("imgs_data")) {
        imgs_data = rbind(imgs_data, thisimg)
    } else {
        imgs_data =  thisimg
    }
}
imgs_data$SUM = imgs_data$black + imgs_data$white + imgs_data$gray

barplot(main_colors$count,
        col = main_colors$color,
        names.arg = main_colors$color)
