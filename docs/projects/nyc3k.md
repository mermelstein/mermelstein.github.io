# Project: NYC 3K Finder

I developed the NYC 3K Finder to help my family navigate the complex process of finding 3K programs for our kids. My goal was to consolidate information and allows parents to easily explore nearby options.

## The 3K Data

3K is the New York City public funding program for children 3 years old. Originally meant to cover all children in the city, it has been reduced in scope and the slots are limited to specific areas and schools/daycares. It can save parents around $20,000 per year compared to private daycare options. This means it can be extremely competitive to get a spot for your child.

First I needed to scrape and process publicly available data from the NYC Department of Education and MySchools.nyc. That got me: 

* The number of allocated 3K spots per school
* How each school prioritizes applications `(eg current students > siblings of current students > children living near the school > other children in the borough, etc)`
* A categorization for how many applicants in each priority group were offered a seat in the previous year 
* The official name and address of each school
* The official website for each school
* The type of 3K program offered (e.g., Full Day, Half Day, etc.)
* Other data

That's enough to get started. The goal was to process the data in a way that made it easier to search for programs near us and understand whether our children would be likely to get a in if we applied. This turned into in a categorical score for each program and each priority group (eg "High Likelihood" for current students, "Medium Likelihood" for siblings, etc).

## The Tool
For each program, the tool displays:

*   **School Name & Program Type:** The official name and the specific 3K program.
*   **Address:** The physical location.
*   **School Website:** A direct link to the program's official site, where available.
*   **MySchools.nyc Link:** A direct link to the program page on MySchools for deeper research.
*   **3K Spots Available:** The reported number of 3K seats for the most recent available year.
*   **Application Success Rate (ASR):** A breakdown of how many applicants in each priority group were offered a seat in the previous cycle, categorized as High, Medium, Low Likelihood, or No Applicants.

## Application Success Rate

A main feature from a data and usability perspective is the ASR. This gave us an idea of a program's competitiveness for different applicant groups based on historical admission data. It wasn't a guarantee of admission, but it helped us prioritize our applications and understand our chances of getting in.

The ASR is categorized as:

*   **High Likelihood:** All applicants in this category who listed the program were offered a seat in the previous year.
*   **Medium Likelihood:** Some applicants in this category were offered a seat.
*   **Low Likelihood:** No applicants in this group were offered a seat.
*   **No Applicants:** No one in the listed group applied for the program in the previous cycle.

Not every school has admissions data by priority group but most did and it helped clarify the competitive landscape.

## How the Finder Works

### Program Search:

1.  Users can input their home address.
2.  The system then queries and displays 3K programs within a 1-mile radius on an interactive map.

The backend uses Photon for address auto-complete (both while you type and also after search submission to have a more complete address) and we feed that address to Nominatim for lat/long coordinates. Then a quick application of the Haversine formula gets us distances of all schools to our searched address and we filter for those within 1 mile.

### Interactive Map:

*   Nearby programs are represented by blue map pins.
*   Clicking a pin reveals a pop-up with details: name, address, website, available spots, and the ASR.
*   I also integrated a "Directions" link to Google Maps for convenience.

### Filtering Capabilities:

*   Once results are shown, a filter panel allows users to refine their search.
*   Users can filter programs based on where specific applicant groups had a "High Likelihood" of admission in the previous year (e.g., Sibling Priority).
