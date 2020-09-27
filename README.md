# IN PROGRESS – WILL BE UPDATED SOON

**Repository for the _Bicolor Affective Silhouettes & Shapes_ (_BASS_) images, rating data, and other material, see below.**

### The Images

The BASS images are all under the _images_ folder.

(The original full set contained 612 images, out of which 29 were removed because they were found to be relatively unclear in their meaning, and they were not rated in the main study. They are available under "imgs_excluded" folder. The ratings from the pilot study are available as "supplementary material" at https://osf.io/anej6/, but not included in any of the files here.)

### Rating Data

The rating data can be downloaded as XLSX, TXT, or CSV.

In all files, each row contains the data of a single image (hence 583 rows, plus headers), in the following columns.

- file_name: The image file name.

- val_mean_us: The mean of all valence ratings ("_us" = US sample).

- aro_mean_us: The mean of all arousal ratings.

- val_sd_us: The SD of all valence ratings.

- aro_sd_us: The SD of all arousal ratings.

- val_n_us: The number of valence ratings.

- aro_n_us: The number of arousal ratings.

- val_cilo_us: Lower limit of 95% CI for the mean of all valence ratings.

- val_ciup_us: Upper limit of 95% CI for the mean of all valence ratings.

- aro_cilo_us: Lower limit of 95% CI for the mean of all arousal ratings.

- aro_ciup_us: Upper limit of 95% CI for the mean of all arousal ratings.

The columns listed above are the same for the ratings for Chinese sample, indicated with "_ch" suffix instead of "_us". (E.g., val_mean_ch:  The mean of all valence ratings from Chinese sample, etc.)

- val_diff: The difference between the means of US and Chinese valence ratings (val_mean_us minus val_mean_ch).
- aro_diff: The difference between the means of US and Chinese arousal ratings (aro_mean_us minus aro_mean_ch).
- val_bf_10: Wilcoxon Bayes factor in support of difference between US and Chinese valence ratings.
- val_bf_01: Wilcoxon Bayes factor in support of equivalence between US and Chinese valence ratings.
- aro_bf_10: Wilcoxon Bayes factor in support of difference between US and Chinese arousal ratings.
- aro_bf_01: Wilcoxon Bayes factor in support of equivalence between US and Chinese arousal ratings.
- black_px: Number of black pixels in the image.
- white_px: Number of white pixels in the image.


### Website

All images along with rating data can be browsed at https://gasparl.github.io/BASS.

This is just for cursory exploration, to easily filter and sort the rating data, download the files (see above) and use e.g. Excel or R or similar.

### R Scripts

*color_switcher.R*: Switches black and white pixels in PNG images to any chosen alternative colors. 

*pix_per_colors.R*: Counts the number of black pixels and the number of white pixels in given PNG images. 

See comments inside the script files for usage options, and visit the OSF website for information about BASS: https://osf.io/anej6/


### Permanent Archive

All files in this repository are permanently stored at https://doi.org/10.5281/zenodo.4051547

[![DOI](https://zenodo.org/badge/234654207.svg)](https://zenodo.org/badge/latestdoi/234654207)

### Citation

Kawai, C., Lukács, G., & Ansorge, U. (2020). Bicolor Affective Silhouettes and Shapes. https://github.com/gasparl/BASS