# Project_01_PublicHealthStudy
### <b>ABOUT</b>

This project carries out a large-scale study on undernutrition in the world.

The hunger problem is complex and can have multiple causes, which differ from country to country. The preliminary stage of this study is to establish a "state of the art" of the research already published and carry out a statistical study intended to direct research towards particular countries and highlight various causes of hunger.

### <b>CONDITIONS</b>

This project deals with the concepts of relational algebra via data frames. Knowledge of basic SQL queries is also needed for this project.

### <b>DATA</b>

There are 5 datasets used in this project, available in [P1_01_AdhocDatasets](https://github.com/KatrinaJMD/Project_01_PublicHealthStudy/tree/main/P1_01_adhoc/P1_01_AdhocDatasets) folder.

- population.csv: world population by country in 2013
- animaux.csv: multiple production indicators for animal products in 2013
- vegetaux.csv: multiple production indicators for plant products in 2013
- cereales.csv: quantity of cereals produced worldwide in 2013
- sousalim.csv: number of undernourished people in the world from 2013 to 2017

## Missions
### <b>Mission n°1 : Calculation results for 2013</b>
Among the Food Balance Sheet documents downloaded, there is redundant information detected. Indeed, for a given country, some of this information can be calculated from other variables:

- Production
- Imports
- Exports
- Stock variation
- Domestic Availability
- Seeds
- Losses
- Food (also called Food Availability)
- Animal food
- Treatment
- Other uses

### <b>Mission n°2 : Detection of data discrepancies</b>
Redundancies are identified in the form of a mathematical formula (no code needed).
> It is a 3-term type equation (a_1 + a2 + [...] = b_1 + b_2 + [...] = c_1 + c_2 + [...]) including each of the 11 variables given above.

This equation is illustrated with the example of wheat in France. For a hint, click on "Definitions and Standards" on the [data download page](http://www.fao.org/faostat/fr/#data/FBS).

### <b>Mission n°3 : Calculation of food availability (kcal) and protein (kg) for each country and each product</b>
Calculation is done using this information down below:
- Population of each country
- Food availability: given for each product and country (kcal/person/day)
- Food availability in protein: given for each product and country (g/person/day)

### <b>Mission n°4 : Energy/Weight ratio calculation in kcal/kg for each product</b>
Calculations are made using the information from the previous mission and the food availability weight (for each country and product).

The consistency of the calculation was reviewed by comparing the obtained ratio to the data available on the internet (i.e., by looking at the [caloric value of an egg](https://fr.wikipedia.org/wiki/%C5%92uf_(aliment)).

> *Indication: The FAO calculates food availability in kcal/person/day by: ((food quantity * energy/weight ratio (kcal/kg)) / country's population) / 365*

The goal here is to find the energy/weight ratio that the FAO used in its calculation.
 
The protein percentage of each product and country is also calculated by following the same methodology. This percentage is obtained by calculating the "protein weight/total weight" ratio (pay attention to the units used).
 
The consistency of the calculation was reviewed by comparing the obtained ratio to the data available on the internet (i.e., by looking at the [protein content of oats](https://fr.wikipedia.org/wiki/Avoine_cultiv%C3%A9e)).

### <b>Mission n°5: List of 5 foods among the 20 most caloric foods, using the energy/weight ratio, and among the 20 highest protein foods</b>
Surprisingly, it happens that the ratio is different per country. Therefore, it will be necessary to use the average for each food per country. If you want to work on this project, you will need to create a new table using an aggregation. Make sure to remove values equal to 0 not to distort the average calculation.

### <b>Mission n°6: Calculation of global domestic availability for plant product in kcal</b>

> *For Mission n°7 to n°9, the results are given in calories and proteins, then the percentage ratio of the world's population.*

### <b>Mission n°7: Number of humans fed if all of the world's domestic supply of plant products were used for food</b>
### <b>Mission n°8: Number of humans fed if all food availability of plant products, plant food for animals, and waste plant products were used for food</b>
### <b>Mission n°9: Number of humans fed with the global food supply</b>
### <b>Mission n°10: Proportion of the world's population considered to be undernourished</b>
The undernourished data ([sousalim.csv](https://github.com/KatrinaJMD/Project_01_PublicHealthStudy/blob/ff2f210ed61eeab6e691e949cadfa471434356b2/P1_01_adhoc/P1_01_AdhocDatasets/sousalim.csv)) is used to answer this question

Listing of products (and their code) considered as cereals according to the [FAO](https://fr.wikipedia.org/wiki/Organisation_des_Nations_unies_pour_l%27alimentation_et_l%27agriculture). A boolean type column "is_cereal" is created to distinguish cereal information in the data.

> *FAO: Food and Agriculture Organization of the United Nations (FAO), one of the bodies that make up the UN*

### <b>Mission n°11: Proportion of cereals intended for animal food</b>
This part only takes into account the cereals intended for food uses (human and animal)

### <b>Mission n°12: 15 most exported products</b>
This part only considers the information of the countries with undernourished people identified by the FAO from the food balance sheet data.

### <b>Mission n°13: 200 most imported products</b>
The information used is from the food balance sheet data at the global level.
> *1 import = a quantity of a given product imported by a given country*

### <b>Mission n°14: Group imported products by products</b>
The results should show a list of 15 products.

### <b>Mission n°15: Ratio for each product in terms of:</b>
- the ratio between the quantity intended for "Other uses" and domestic availability
- the ratio between the quantity intended for animal food and the quantity intended for food (animal + human)


### <b>Mission n°16: List of 3 products with the highest ratios from the previous calculations</b>
There will be 6 lists of products in total.

### <b>Mission n°17: Tons of grain freed up if the US cut its production of animal products by 10%</b>
### <b>Mission n°18: Proportion of exported cassava produced in Thailand</b>
### <b>Mission n°18: Proportion of undernourished people in Thailand</b>

## SQL
### <b>Query n°1: Integrate data into a relational database</b>
The data is transformed into a conducive format for end-users, used for SQL queries.

There are 4 datasets exported to the database:
1. **population** (of each country in 2013 with the following information):
  - country
  - country code
  - year
  - population

2. **dispo_alim** (for each country and product in 2013 with the following information):
  - country
  - country code
  - year
  - product
  - product code
  - product type (animal or vegetal)
  - food availability in tons
  - food availability in Kcal/person/day
  - food availability of protein in g/person/day
  - food availability of fat in g/person/day

3. **equilibre_prod** (for each country and product in 2013 with the following information):
  - country
  - country code
  - year
  - product
  - product code
  - interior availability
  - animal food
  - seed
  - losses
  - transformed
  - food
  - other uses

4. **sous_nutrition** (number of undernourished people for each country in 2013):
  - country
  - country code
  - year
  - number of people

### <b>Query n°2: Setting a primary key for the population table</b>
### <b>Query n°3: Setting a primary key for the dispo_alim table</b>
### <b>Query n°4: Setting a primary key for the equilibre_prod table</b>
### <b>Query n°5: Setting a primary key for the sous_nutrition table</b>
### <b>Query n°6: SQL query answers</b>
- List of 10 countries with the highest food availability/capita ratio of protein (kg) per capita
- List of 10 countries with the highest food availability/capita ratio of calories (kcal) per capita
- Total quantity (kg) of products lost per country in 2013
- List of 10 countries with the highest number of undernourished people
- List of 10 countries with the highest Other uses/Domestic availability ratio

### <b>Query n°7: List of "other uses" of products from the last query (internet research)</b>

<b>SKILLS ASSESSED</b>
- Recover data from an identified source
- Perform complex queries in SQL
- Master the basics of Python
- Use technical documentation
- Use specialized libraries for Data Science
- Apply relational algebra in Python
