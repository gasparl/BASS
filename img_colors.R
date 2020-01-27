library('neatStats')
library('imager')
library('png')
library('jpeg')
change_cols = function(replace_black, replace_white, theimg) {
    r_b = col2rgb(replace_black) / 255
    r_w = col2rgb(replace_white) / 255
    theimg[theimg == 1] <- 2
    for (i in 1:3) {
        theimg[, , i][theimg[, , i] == 0] <- r_b[i]
    }
    for (i in 1:3) {
        theimg[, , i][theimg[, , i] == 2] <- r_w[i]
    }
    return(theimg)
}

setwd(path_neat('300x300/orig'))
file_names = list.files(pattern = "\\.jpg$|\\.png$") # will be jpeg
setwd(path_neat('300x300'))

if (exists("imgs_data")) {
    rm(imgs_data)
}

for (f_name in file_names) {
    # f_name = "triumph3.png"
    cat(f_name, fill = T)
    im <- load.image(paste0('orig/', f_name))
    im2 = colorise(im,  ~ . < 0.9, "black")
    new_img = colorise(im2,  ~ . >= 0.9, "white")
    f_name = sub('.jpg', '', f_name, fixed = TRUE)
    f_name = sub('.png', '', f_name, fixed = TRUE)
    newfile = paste0('bw/', f_name, '_bw.png')
    imager::save.image(new_img, newfile)

    img = readPNG(newfile)
    # if .jpg: img = readJPEG(newfile)

    newimg = 1 - img
    writePNG(newimg, sub('_bw.', '_wb.', newfile, fixed = TRUE))

    r_img = as.raster(img)
    tab <- table(r_img)
    tab <- data.frame(color = names(tab), count = as.integer(tab))
    if (sum(tab$count) != 90000) {
        stop("sum(tab$count) ", sum(tab$count))
    }
    RGB <- t(col2rgb(tab$color))
    tab <- cbind(tab, RGB)
    main_colors <- tab[order(-tab$count), ]
    main_colors$color = as.character(main_colors$color)
    if (length(main_colors$color) != 2) {
        stop("length(main_colors$color) ",
             length(main_colors$color))
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

cat('"', paste(imgs_data$file, collapse = '", "'), '"', sep = "")
imgs_data$SUM = imgs_data$black + imgs_data$white
