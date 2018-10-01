regsvr32 /u c:\windows\system32\PictureButton.ocx
copy c:\windows\system32\PictureButton.ocx c:\windows\system32\PictureButton.tmp
copy picturebutton.ocx c:\windows\system32\PictureButton.ocx
regsvr32 c:\windows\system32\PictureButton.ocx
copy NTGraph.ocx c:\windows\system32\NTGraph.ocx