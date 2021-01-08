# North Atlantic Whale Project
- Summer project from 2020. Worked with Professor Steve Wang and Horace Shew, all from Swarthmore College. Previous contributors are mentioned in the Rcode.
- In this project, we predict the population size of North Atlantic Whales, an almost extinct species.
- Data is pulled from NARWC
# Gap time code v1
- Gap time code v1 analyses the average gap time of all whales (thus, for whales that are seen again)
# Gap time code v2
- Gap time code v2 is different than v1 in that:
  1. It counts the number of individual whales observed in the year t
  2. Then, it looks at t+1 through t+5 years and checks if the whales from year t are observed again.
  
These two methods are efforts to more appropriately calculate probaliveold, vector of survival rates of individual whales (identified by unique whale IDs) that are later to be adjusted by our model.
