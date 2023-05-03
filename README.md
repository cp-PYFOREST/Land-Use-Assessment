<h1 align="center">

PYFOREST

</h1>

<h2 align="center">

Informing Forest Conservation Regulations in Paraguay


<h2 align="center">

<img src="https://github.com/cp-PYFOREST/Land-Use-Plan-Simulation/blob/main/img/pyforest_hex_sticker.png" alt="Banner" width="200">

</h2>

# Land Use Assessment 


<h2 align="center">

[Land-Use-Assesment](https://github.com/cp-PYFOREST/Land-Use-Assessment) | [Land-Use-Plan-Simulation](https://github.com/cp-PYFOREST/Land-Use-Plan-Simulation) | [PYFOREST-ML](https://github.com/cp-PYFOREST/PYFOREST-ML) | [PYFOREST-Shiny](https://github.com/cp-PYFOREST/PYFOREST-Shiny)

</h2> 

## Description
To evaluate the compliance of property owners' execution of their approved LUPs and quantify  deforestation rates and forest cover, we have used geospatial overlays to compare forest cover data against permitted land use. This approach allows us to identify areas where deforestation has occurred without authorization, providing valuable insights into the effectiveness of current forest regulations and land management practices.


### Land Use Plan Assessment:

- For each year of the analysis, it is necessary to determine which private property is considered active from the Permitted land use dataset. The active_inactive.qmd file performs the preprocessing required to determine the unique identifier of the active properties for each year between 2011 to 2020. Each subset of yearly properties provides the unique identifiers required to subset the Land use dataset, as these are the approved LUPs.
- Each row of a LUP subset is a vector polygon of the approved land use type. The analysis done in lup_{year}-compliance.qmd uses the yearly subsets of LUPs and overlays them with the corresponding ‘Forest Loss’ dataset to determine the cell count per land use type. Each cell of the ‘Forest Loss’ dataset is a deforested area. 
- Yearly subsets of the Land use dataset contain a categorical column of 'GRUPOS,' identifying the approved land use type. The analysis done in each lup_{year}-compliance.qmd uses the 'GRUPOS' column to filter by the land use types of 'authorized area' and 'forest reserve' ('AREA_AUTORIZADA,' 'BOSQUES').
- Pixel counts were converted to an area for each property and land use type. Pixel counts greater than zero in the area designated as a forest reserve is considered illegal deforestation, placing the property out of compliance with its approved land use plan.

### Deforestation Rates: 
- A time series analysis was performed on the output of the land use plan assessment to determine deforestation rates and quantify total areas at the national, department, district, and property levels.

### Forest Cover: 
- The same approach was applied to quantify forest cover across time using the yearly ‘forest cover’ datasets in conjunction with the Study Boundary dataset. This dataset was then subset into districts and departments.

Table 2:  Data Information - Objective 1
| Dataset | Year(s) | Source | Data Type | Spatial Reference/Resolution | Metadata |
|---------|----------|----------|---------|----------|----------|
| Forest Cover |	2000-2020 |	INFONA |	Rasters |	CRS: WGS 84 / UTM zone 21S | Resolution: 30m x 30m |	Metadata |
| Forest Loss | 2000-2020 |	INFONA |	Rasters |	CRS: WGS 84 / UTM zone 21S | Resolution: 30m x 30m |	Metadata |
| Permitted land use | 	1994-2022 |	INFONA |	Polygons |	CRS: WGS 84 / UTM zone 21S |	Metadata |

