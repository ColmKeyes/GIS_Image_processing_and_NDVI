#! /usr/bin/ bash

for filename in /home/colm/Desktop/QGIS_Data/Sentinel_data/* ; do

   	cd $filename
	for file in *.jp2 ; do
		# translate .jp2 to GTiff
		echo $filename
		gdal_translate -of GTiff $file $(echo "${file%.jp2}"| cut -d'_' -f 3,4).tiff		
	done

	for file in *.tiff ; do	
		#cut images to polygon	
		gdalwarp -cutline /home/colm/Desktop/QGIS_Data/Carrickmacross_layer_reprojected.shp -crop_to_cutline -dstnodata -9999 -dstalpha $file ${file%.tiff}_Carrickmacross_cropped.tiff
   	done
done



