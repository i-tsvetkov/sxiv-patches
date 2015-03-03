# Sxiv Patches
### sxiv-square-thumbnails.patch
  Makes the thumbnails square:  
  ![](preview/2015-03-01-184719_250x250_scrot.png)![](preview/2015-03-01-190007_250x250_scrot.png)
### sxiv-window-fit-image.patch
  Makes the window fit the image when displaying single image:  
  ![](preview/2015-03-01-185650_615x425_scrot.png)![](preview/2015-03-01-184958_800x600_scrot.png)

### sxiv-thumbnail-type-from-image.patch
  Makes sxiv derive the thumbnail type from the image
  so sxiv can support transparent thumbnails:  
  ![](preview/2015-03-01-190252_150x150_scrot.png)![](preview/2015-03-01-190035_150x150_scrot.png)

### sxiv.rb
  Ruby script for finding optimal thumbnail size.  
  The thumbnail size is calculated so that when viewing thumbnails in
  full screen the empty space is minimal.

  The calculation uses the width and height of the display.  
  **If you are using the bottom bar you have to
  substract his height(by default the font size + 2px)
  from the height of the display.**

  The calculation can be done for windows too.
```
sxiv.rb -w <window-width> -h <window-height>
```

  For more information:
```
sxiv.rb --help
```

