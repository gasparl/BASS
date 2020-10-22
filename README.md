**Repository for the _Bicolor Affective Silhouettes & Shapes_ (_BASS_) images, rating data, and other material.**

### The Images

The BASS images can all be found under the _images_ folder, though they are easiest to download as a ZIP file [here](https://gasparl.github.io/BASS/BASS_images.zip) (1.6 MB). But you can also just download this entire repository as ZIP (only 3.7 MB), via the green download button at the top right, which will also include the data tables etc.

(The original full set contained 620 images, out of which 37 were removed because they were found to be relatively unclear in their meaning, and they were not rated in the main study. They are available under "imgs_excluded" folder. The ratings from the pilot study are available as "supplementary material" at https://osf.io/anej6/, but not included in any of the files here.)

### Rating Data

The rating data is available in three file types: [XLSX](https://gasparl.github.io/BASS/BASS_data.xlsx) | [TXT](https://gasparl.github.io/BASS/BASS_data.txt) | [CSV](https://gasparl.github.io/BASS/BASS_data.csv). (Click to open or right click and "Save link as..." to download.)

In all files, each row contains the data of a single image (hence 583 rows, plus headers), in the following columns.

- _file_name_: The image file name.
- _val_mean_us_: The mean of all valence ratings ("__us_" = US sample).
- _aro_mean_us_: The mean of all arousal ratings.
- _val_sd_us_: The SD of all valence ratings.
- _aro_sd_us_: The SD of all arousal ratings.
- _val_n_us_: The number of valence ratings.
- _aro_n_us_: The number of arousal ratings.
- _val_cilo_us_: Lower limit of 95% CI for the mean of all valence ratings.
- _val_ciup_us_: Upper limit of 95% CI for the mean of all valence ratings.
- _aro_cilo_us_: Lower limit of 95% CI for the mean of all arousal ratings.
- _aro_ciup_us_: Upper limit of 95% CI for the mean of all arousal ratings.

The columns listed above are the same for the ratings for Chinese sample, indicated with "__ch_" suffix instead of "__us_". (E.g., _val_mean_ch_:  The mean of all valence ratings from Chinese sample, etc.)

- _val_diff_: The difference between the means of US and Chinese valence ratings (_val_mean_us_ minus _val_mean_ch_).
- _aro_diff_: The difference between the means of US and Chinese arousal ratings (_aro_mean_us_ minus _aro_mean_ch_).
- _val_bf_10_: Wilcoxon Bayes factor in support of difference between US and Chinese valence ratings.
- _val_bf_01_: Wilcoxon Bayes factor in support of equivalence between US and Chinese valence ratings.
- _aro_bf_10_: Wilcoxon Bayes factor in support of difference between US and Chinese arousal ratings.
- _aro_bf_01_: Wilcoxon Bayes factor in support of equivalence between US and Chinese arousal ratings.
- _val_resid_: Linear regression residuals for valence ratings: observed values minus fitted values for the US-Chinese mean ratings relations for the entire sample. A larger value means larger US mean valence rating than Chinese mean valence rating, relative to what is expected when values are perfectly correlated (linear fitted values). The closer this value is to zero, the more likely it is that the given image is suitable for cross-cultural measurement of valence. (Nonetheless, this value is quite close to _val_diff_, which is more straightforward to interpret.)
- _aro_resid_: Linear regression residuals for arousal ratings (same as for valence, see above).
- _black_px_: Number of black pixels in the image.
- _white_px_: Number of white pixels in the image.
- _keywords_: Keywords for the given image.
- _source_: Source of the given image.

### Website

All images along with rating data can be browsed at https://gasparl.github.io/BASS.

This is just for cursory exploration – to easily filter and sort the rating data, download the files (see above) and use e.g. Excel or R or similar.

### R Scripts

*color_switcher.R*: Switches black and white pixels in PNG images to any chosen alternative colors. 

*pix_per_colors.R*: Counts the number of black pixels and the number of white pixels in given PNG images. 

See comments inside the script files for usage options, and visit the OSF website for information about BASS: https://osf.io/anej6/


### Permanent Archive

All files in this repository are permanently stored at https://doi.org/10.5281/zenodo.4051546

[![DOI](https://zenodo.org/badge/234654207.svg)](https://zenodo.org/badge/latestdoi/234654207)

### License and Citation

The contents of this repository are licensed under [CC-BY 4.0 International](https://github.com/gasparl/BASS/blob/master/LICENSE.md). In essence, you can use all images and data for any purpose as long as you give credit to the original authors in a reasonable manner (e.g. cite it in case of a publication).

An appropriate reference for citation is:

Kawai, C., Lukács, G., & Ansorge, U. (2020). A New Type of Pictorial Database: The Bicolor Affective Silhouettes and Shapes (BASS). https://gasparl.github.io/BASS/