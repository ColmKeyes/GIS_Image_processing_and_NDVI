#! /usr/bin bash


for filename in /home/colm/Desktop/QGIS_Data/Sentinel_data/* ; do

	cd $filename
	for B04_file in *B04_Carrickmacross_cropped ; do	
		for B08_file in *B08_Carrickmacross_cropped ; do			
			gdal_calc.py -A $B08_file -B $B04_file  --calc="(A-B)/(A+B)" --NoDataValue -9999 --type=float32 --outfile ${B04_file%B04_Carrickmacross_cropped.tiff}_NDVI.tiff
   		done
	done
done
