library('neatStats')
library("ggplot2")
library('imager')
library('png')
library('grid')
library('raster')

setwd(path_neat('300x300'))
file_names = list.files(pattern = "\\.png$") # will be jpeg

if (exists("imgs_data")) {
    rm(imgs_data)
}

for (f_name in file_names) {
    # f_name = "bear.png"
    cat(f_name, fill = T)

    im <- load.image(f_name)
    im2 = colorise(im,  ~ . < 0.8, "black")
    new_img = colorise(im2,  ~ . >= 0.2, "white")
    newfile = paste0('bw/', sub('.jpg', '_bw.png', f_name, fixed = TRUE))
    imager::save.image(new_img, newfile)
    plot(new_img)

    img = readPNG(newfile)
    img <- as.raster(img)

    img_white = img
    img_white[img_white == "#000000"] <- 'red'
    img_white[img_white == "#FFFFFF"] <- '#000000'
    img_white[img_white == "red"] <- '#FFFFFF'

    png('file.png', height=nrow(img_white), width=ncol(img_white))
    plot(img_white)
    dev.off()

    writePNG(img_white, sub('_bw.', '_wb.', f_name, fixed = TRUE))

    tab <- table(img)
    tab <- data.frame(color = names(tab), count = as.integer(tab))
    if (sum(tab$count) != 90000) {
        stop("sum(tab$count) ", sum(tab$count))
    }
    RGB <- t(col2rgb(tab$color))
    tab <- cbind(tab, RGB)
    main_colors <- tab[order(-tab$count),]
    main_colors$color = as.character(main_colors$color)
    if (length(main_colors$color) != 2) {
        stop("length(main_colors$color) ", length(main_colors$color))
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

