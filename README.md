<h1 align="center">

PYFOREST

</h1>

<h2 align="center">

Informing Forest Conservation Regulations in Paraguay


<h2 align="center">

<img src="https://github.com/cp-PYFOREST/.github/blob/main/img/pyforest_hex_sticker.png" alt="Banner" width="200">

</h2>

# Land Use Assessment 


<h2 align="center">

[Land-Use-Assesment](https://github.com/cp-PYFOREST/Land-Use-Assessment) | [Land-Use-Plan-Simulation](https://github.com/cp-PYFOREST/Land-Use-Plan-Simulation) | [PYFOREST-ML](https://github.com/cp-PYFOREST/PYFOREST-ML) | [PYFOREST-Shiny](https://github.com/cp-PYFOREST/PYFOREST-Shiny)

</h2> 

 # Documentation
 For more detailed information about our project, including our methodologies, data sources, and technical specifications, please refer to our [technical documentation](https://bren.ucsb.edu/projects/informing-forest-conservation-regulations-paraguay).
  
 ## Table of Contents
- [Description](#description)
- [Land Use Plan Assessment](#land-use-plan-assessment)
- [Deforestation Rates](#deforestation-rates)
- [Forest Cover](#forest-cover)
- [Results](#results)
- [Data Information](#data-information)
- [License](#license)
- [Contact](#contact)
  
## Description
To understand and mitigate the impacts of deforestation, it is crucial to evaluate property owners' compliance with their approved LUPs and accurately quantify deforestation rates and forest cover. This region, rich in biodiversity, has been experiencing significant deforestation, making it a crucial study area.
  
The first task is to assess whether property owners are executing their approved LUPs as intended. This involves a detailed analysis of various datasets, including property boundaries, LUPs, and forest loss data, all provided by INFONA, the National Forestry Institute of Paraguay.
  
By leveraging geospatial overlays, we compare forest loss data against permitted land use. This approach allows us to identify areas where deforestation has occurred without authorization, which is a key indicator of non-compliance with approved LUPs. This approach allows us to identify areas where deforestation has occurred without authorization, providing valuable insights into the effectiveness of current forest regulations and land management practices.

## Methods

### Land Use Plan Assessment

-The assessment process involves determining the active private properties for each year of analysis, using the Property Boundary dataset. The active-inactive.qmd and active-lup.qmd files preprocess the data to identify the unique identifiers of active properties and active LUPs for each year from 2011 to 2020. These identifiers are then used to subset the Land Use Plan dataset.
- Each row of a LUP subset is a vector polygon of the approved land use type. The analysis done in lup_{year}-compliance.qmd uses the yearly subsets of LUPs and overlays them with the corresponding ‘Forest Loss’ dataset to determine the cell count per land use type. Each cell of the ‘Forest Loss’ dataset is a deforested area. 
- Yearly subsets of the Land use dataset contain a categorical column of 'GRUPOS,' identifying the approved land use type. The analysis done in each lup_{year}-compliance.qmd uses the 'GRUPOS' column to filter by the land use types of 'authorized area' and 'forest reserve' ('AREA_AUTORIZADA,' 'BOSQUES').
- Pixel counts were converted to an area for each property and land use type. Pixel counts greater than zero in the area designated as a forest reserve is considered illegal deforestation, placing the property out of compliance with its approved land use plan.
  
<h2 align="center">

<img src="https://github.com/cp-PYFOREST/.github/blob/main/img/obj1lup.png" alt="Land Use Plan">

</h2>

### Deforestation Rates 
- A time series analysis was performed on the output of the land use plan assessment to determine deforestation rates and quantify total areas at the national, department, district, and property levels.

### Forest Cover 
- The same approach was applied to quantify forest cover across time using the yearly ‘forest cover’ datasets in conjunction with the Study Boundary dataset. This dataset was then subset into districts and departments.

## Results
- This analysis has determined that between 2019 and 2020, 44% of the deforestation within LUPs occurred in protected areas and was considered unauthorized, totaling 21,321 ha of illegal deforestation.
  
 <h2 align="center">

<img src="https://github.com/cp-PYFOREST/.github/blob/main/img/obj1stats.png" alt="LUP Results">

</h2>
  
  
 - Out of a total of 1800 properties, 311 (or approximately 17%) did not comply with their LUPs. A relatively small proportion of properties primarily drives the high percentage of deforestation in protected areas. This result will allow INFONA to explore the underlying factors or patterns driving this behavior and better determine how to mitigate unauthorized deforestation within LUPs.
  
 <h2 align="center">

<img src="https://github.com/cp-PYFOREST/.github/blob/main/img/obj1spatial.png" alt="Spatial Distribution">

</h2>
  
 - The spatial distribution of properties that committed illegal deforestation in 2019 leans heavily towards the furthest western boundary of the study region in the Boqueron Department. This distribution aligns with this study's analysis of the deforestation of the entire Paraguayan Chaco. 
  
 - Boqueron experienced an approximately 14% decrease in forest cover from 2011 to 2020, declining from ~67% to ~53%. The yearly percentages of deforestation in Boqueron reflect the decreases observed in unauthorized deforestation within LUPs. In 2011, 2017, and 2020,  Boqueron had percentages of area lost by year of 1.88,  2.12, and 0.53, respectively. Though the rate of deforestation decreased over the study period, Boqueron leads in comparison to the departments’ Alto Paraguay and Presidente Hayes.

- For the same three years of 2011, 2017, and 2020 Alto Paraguay had comparable decreases in percentages of 1.43, 0.75, 0.2.  Forest cover decreased by 10% in the ten year period, 74% down to 64%. 

- The values for the percentage of the area lost by year for Presidente Hayes are significantly lower than the other two departments within our study boundary, at 0.76, 0.75, and 0.28 for 2011, 2017, and 2020, respectively. An important point concerning the reported low values is that Presidente Hayes had the least forest cover to begin the ten-year period, with an approximate 50% coverage reduced to ~45.87% in 2020.

Table 2:  Data Information - Objective 1
| Dataset | Year(s) | Source | Data Type | Spatial Reference/Resolution | Metadata |
|---------|----------|----------|---------|----------|----------|
| Forest Cover |	2000-2020 |	INFONA |	Rasters |	CRS: WGS 84 / UTM zone 21S | Resolution: 30m x 30m |	Metadata |
| Forest Loss | 2000-2020 |	INFONA |	Rasters |	CRS: WGS 84 / UTM zone 21S | Resolution: 30m x 30m |	Metadata |
| Permitted land use | 	1994-2022 |	INFONA |	Polygons |	CRS: WGS 84 / UTM zone 21S |	Metadata |

