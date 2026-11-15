# Progress 8 Data Across England
This repo contains the source files for a Tableau visualisation that I made. The visualisation displays national trends in provisional Progress 8 data from mainstream schools across England, and is available at [this link](https://public.tableau.com/views/progress_8/Dashboard?:language=en-GB&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link). I have also uploaded a copy of my PGCE essay on how systems of assessment like Progress 8 can affect the educational outcomes of disadvantaged pupils.

## Demo

![demo](demo.gif)

You can:
- Hover over points or bars to bring up more information.
- Click on the names of regions in the bar chart to filter data.
- Explore the map to look at local authorities.
- Highlight individual schools using the searchbox.

Progress 8 does not account for socioeconomic factors, and individual scores are based on small and highly variable  sample sizes. P8 is useful when looking at trends, but should not be treated as a ranking tool or an absolute measure of school effectiveness.

The graphs in this visualisation were inspired by the work at FFT Education Datalab. They have written more about the limits of P8 here: https://ffteducationdatalab.org.uk/2024/05/contextualising-progress-8/ 
Please check out their research!


## Files in external repos
I have not included these files as they are from external sites. They can be found at the following links:
- `england_ks4_provisional` - Provisional progress data from the DfE, available at https://www.compare-school-performance.service.gov.uk/download-data
- `la_and_region_codes_meta` - A list of local authority names, available from the DfE at https://www.compare-school-performance.service.gov.uk/download-data
- `CTYUA_DEC_2024_UK_BFC.shp` - Shapefiles for LAs in England, avaliable from the ONS at https://geoportal.statistics.gov.uk/datasets/e0e00383f27d4437ae87d26e673c2d54_0/explore. Tableau needs this for geocoding LAs.

## Files in this repo
- `assessment.pdf` - A copy of my PGCE essay _A Critical Review of How Systems of Assessment Affect Social Mobility_.
- `pcodes.sql` - Prepares latitude and longitude data for school postcodes. Tableau needs this for plotting as its UK postcode geographic role only stores outcode data.
- `la_data_extract.sql` - Prepares local authority progress data from `england_ks4_provisional.csv`
- `pcodes_fixed.csv` - A list of postcodes that I had to manually fix because the dataset was using outdated postcodes.
- `dfe_pcode_coords.csv` - Coordinates of school postcodes.
- `LEA_P8_data.csv` - Extracted LA P8 data.

Note that I could not upload the Tableau `.twbx` file as it is greater than 25 MB. It can be downloaded from this [public link](https://public.tableau.com/views/progress_8/Dashboard?:language=en-GB&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link).
