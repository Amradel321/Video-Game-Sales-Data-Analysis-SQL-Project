select*
from sales;




CREATE TABLE `sales_staging` (
  `img` text,
  `title` text,
  `console` text,
  `genre` text,
  `publisher` text,
  `developer` text,
  `critic_score` text,
  `total_sales` double DEFAULT NULL,
  `na_sales` double DEFAULT NULL,
  `jp_sales` double DEFAULT NULL,
  `pal_sales` double DEFAULT NULL,
  `other_sales` double DEFAULT NULL,
  `release_date` text,
  `last_update` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


insert sales_staging
select*
from sales;


select*
from sales_staging;


UPDATE sales_staging 
SET critic_score = NULL 
WHERE critic_score = '';  -- Handles empty strings before conversion

UPDATE sales_staging 
SET critic_score = CAST(critic_score AS DECIMAL(3,1));



alter table sales_staging
modify column critic_score decimal(3,1);


update sales_staging
set `release_date` = str_to_date(release_date, '%m/%d/%Y');


alter table sales_staging
modify column release_date date;




select distinct release_date
from sales_staging
where release_date = '' or  release_date is null;


update sales_staging
set release_date = null
where  release_date = '';






update sales_staging
set last_update = str_to_date(last_update, '%m/%d/%Y');


alter table sales_staging
modify column last_update date;




select distinct last_update
from sales_staging
where last_update = '' or  last_update is null;


update sales_staging
set last_update = null
where  last_update = '';



-- remove duplicates
with row_num_cte as
(
select*,
row_number() over(partition by title, console, genre, publisher, developer, critic_score,total_sales, na_sales, jp_sales, pal_sales,
other_sales,release_date,last_update) as row_num
from sales_staging
)
select*
from row_num_cte
where row_num>1;


-- there is no duplicates


select release_date
from sales_staging
order by 1;
-- 2nd step: standardize the data(spelling mistakes and stuff)

select distinct publisher
from sales_staging
order by 1;

select distinct title, publisher,release_date
from sales_staging
where publisher like'Milestone%'
order by 1;



update sales_staging
set publisher = 'Bandai Namco'
where publisher like '%bandai%' or  publisher like 'namco%';


update sales_staging
set publisher = 'D3 Publisher'
where publisher like 'D3%';



update sales_staging
set publisher = 'Kalypso Media'
where publisher like 'Kalypso%';


update sales_staging
set publisher = 'Koei Tecmo'
where publisher like '%Koei%'  or publisher like 'tecmo%';


update sales_staging
set publisher = 'Konami Digital Entertainment'
where publisher like 'Konami%';


update sales_staging
set publisher = 'Marvelous Inc.'
where publisher like '%Marvelous%';


update sales_staging
set publisher = 'Microsoft Studios'
where publisher like 'Microsoft%';

update sales_staging
set publisher = 'Milestone S.r.l.'
where publisher like 'Milestone%';


update sales_staging
set publisher = 'Sony Interactive Entertainment'
where publisher like 'Sony computer Entertainment%';



update sales_staging
set publisher = 'Square Enix'
where publisher like 'Square%';


update sales_staging
set publisher = 'Warner Bros. Interactive Entertainment'
where publisher like 'Warner Bros. Interactive%';










select distinct developer
from sales_staging
order by 1;

update sales_staging
set developer = '2K Studios'
where developer like '2k%';



update sales_staging
set developer = 'Aki Corporation'
where developer like 'Aki%';

update sales_staging
set developer = 'Atlus'
where developer like 'Atlus Co.';


update sales_staging
set developer = 'Bandai Namco'
where developer like 'Bandai%';



select*
from sales_staging
where developer like 'new%';


update sales_staging
set developer = 'Bethesda'
where developer like 'Bethesda%';




update sales_staging
set developer = 'BioWare'
where developer like 'BioWare%';




update sales_staging
set developer = 'Capcom'
where developer like 'Capcom Production Studio 1%'  or developer like 'Capcom Production Studio 2'
 or developer like 'Capcom Production Studio 4'  or developer like 'CapcomÂ ProductionÂ StudioÂ 1';
 
 
 
 update sales_staging
 set developer = 'Cavia Inc.'
 where developer like 'Cavia%';
 
 
 
 update sales_staging
 set developer = 'Climax Studios'
 where developer like 'Climax%';
 
 
 
 
 update sales_staging
 set developer = 'Codemasters'
 where developer like 'Codemasters%';
 
 
 
  update sales_staging
 set developer = 'Cooking Mama Ltd.'
 where developer like 'Cooking Mama%';
 
 
 
 
  update sales_staging
 set developer = 'Criterion Games'
 where developer like 'Criterion%';
 
 
  update sales_staging
 set developer = 'Dream Factory'
 where developer like 'DreamFactory%';
 
 
   update sales_staging
 set developer = 'Electronic Arts'
 where developer like 'EA%';
 
 
 
   update sales_staging
 set developer = 'Firaxis Games'
 where developer like 'Firaxis%';
 
 
 update sales_staging
 set developer = 'Frontier Developments'
 where developer like 'Frontier%';
 
 
 
 update sales_staging
 set developer = 'Gaijin Games'
 where developer like 'Gaijin Games%';
 
 
 
 
  update sales_staging
 set developer = 'Griptonite Games'
 where developer like 'Griptonite%';
 
 
   update sales_staging
 set developer = 'Guerrilla Games'
 where developer like 'Guerrilla%';
 
 
 
 

 
select distinct developer
from sales_staging
order by 1;




   update sales_staging
 set developer = 'Hitmaker'
 where developer like 'Hit maker%';




 update sales_staging
 set developer = 'Idol Minds'
 where developer like 'Idol Minds%';
 
 
 
update sales_staging
 set developer = 'Koei Tecmo'
 where developer like 'Koei Tecmo Games%' or developer = 'koei';
 
 
 
 update sales_staging
 set developer = 'Konami Digital Entertainment'
 where developer like 'Konami Computer Entertainment%' or developer = 'konami';
 
 
 
 
 update sales_staging
 set developer = 'LightWeight'
 where developer like 'Light Weight%';
 
 
 
 
 
 update sales_staging
 set developer = 'Luxoflux'
 where developer like 'Luxoflux%';
 
 
 
 
  update sales_staging
 set developer = 'Marvelous Inc.'
 where developer like 'Marvelous%';
 
 
 
  update sales_staging
 set developer = 'Milestone S.r.l'
 where developer like 'Milestone S.r.l%';
 
 
 
 update sales_staging
 set developer = 'Mistwalker Corporation'
 where developer like 'Mistwalker Corporation%';
 
 
 
UPDATE sales_staging
SET developer = 'Monolith Soft'
WHERE developer LIKE 'Monolith Productions%';


UPDATE sales_staging
SET developer = 'Monster Games'
WHERE developer LIKE 'Monstars Inc.%'
OR developer LIKE 'Monster Games Inc.%';




UPDATE sales_staging
SET developer = 'Bandai Namco'
WHERE developer LIKE 'Namco%'
   OR developer LIKE 'Namco Bandai%';







UPDATE sales_staging
SET developer = 'Natsume'
WHERE developer LIKE 'Natsume Atari%';




UPDATE sales_staging
SET developer = 'Neversoft'
WHERE developer LIKE 'Neversoft Entertainment%';



UPDATE sales_staging
SET developer = 'Next Entertainment'
WHERE developer = 'Nex Entertainment';


select distinct developer
from sales_staging
order by 1;



UPDATE sales_staging
SET developer = 'Nihilistic Software'
WHERE developer = 'Nihilistic';



UPDATE sales_staging
SET developer = 'Nintendo'
WHERE developer like 'Nintendo%';


UPDATE sales_staging
SET developer = 'Nippon Ichi Software'
WHERE developer LIKE 'Nippon Ichi Software%';



UPDATE sales_staging
SET developer = 'Omega Force'
WHERE developer LIKE 'Omega Force%';


UPDATE sales_staging
SET developer = 'PlatinumGames'
WHERE developer LIKE 'PlatinumGames%';




UPDATE sales_staging
SET developer = 'Q Entertainment'
WHERE developer LIKE 'Q Entertainment%';



UPDATE sales_staging
SET developer = 'Rockstar Games'
WHERE developer LIKE 'Rockstar%';



UPDATE sales_staging
SET developer = 'Sega'
WHERE developer LIKE 'Sega%';




UPDATE sales_staging
SET developer = 'SNK Corporation'
WHERE developer LIKE 'SNK%';


UPDATE sales_staging
SET developer = 'Sony Interactive Entertainment '
WHERE developer LIKE 'sce%' or developer like 'sony%'  or developer like 'sie%';





UPDATE sales_staging
SET developer = 'Spike'
WHERE developer LIKE 'Spike / Bandai Namco Games%';




UPDATE sales_staging
SET developer = 'Square Enix'
WHERE developer LIKE 'Square%' ;




UPDATE sales_staging
SET developer = 'Takara Tomy'
WHERE developer LIKE 'Takara%';



UPDATE sales_staging
SET developer = 'Koei Tecmo'
WHERE developer LIKE 'tecmo%' or developer like 'koei%';




select distinct developer
from sales_staging
order by 1;



UPDATE sales_staging
SET developer = 'Toy Box Studios'
WHERE developer LIKE 'Toy Box%' OR developer LIKE 'Toybox%';



UPDATE sales_staging
SET developer = 'Tri-Crescendo'
WHERE developer ='tri-Ace' OR developer LIKE 'Tri-Crescendo%';



UPDATE sales_staging
SET developer = 'Turn 10 Studios'
WHERE developer LIKE 'Turn 10 Studio%';



UPDATE sales_staging
SET developer = 'Ubisoft Montpellier'
WHERE developer LIKE 'UBIart Montpellier%';

UPDATE sales_staging
SET developer = 'Ubisoft'
WHERE developer LIKE 'Ubisoft%';




UPDATE sales_staging
SET developer = 'Visual Sciences Ltd.'
WHERE developer = 'VisualÂ SciencesÂ Ltd.';



UPDATE sales_staging
SET developer = 'WayForward Technologies'
WHERE developer = 'Way Forward Technologies';




UPDATE sales_staging
SET developer = "Yuke's"
WHERE developer like "Yuke's%" or developer like "Yukie's%" ;



select*
from sales_staging;



select*
from sales_staging
where critic_score is null;



select distinct title
from sales_staging
order by 1;







-- exploring the data
-- 1.Identify the top 10 best-selling games of all time.
with ranking_cte as
(
select title, sum(total_sales) as total_sales
from sales_staging
group by title
)
select title, total_sales,
rank() over( order by total_sales desc ) as ranking
from ranking_cte
limit 10;

-- 2-which year had the most game releases
with release_date_cte as
(
select year( release_date) as release_year, count(distinct title) as num_of_games
from sales_staging
group by release_year
)
select  release_year,num_of_games
from release_date_cte
order by num_of_games desc 
limit 1
;


select distinct title
from sales_staging
where year(release_date) ='2020'
order by title;



-- 3-Determine the most popular gaming platforms by sales.

with platforms_cte as
(
select console , sum(total_sales) as total_sales
from sales_staging
group by console
)
select console, total_sales,
rank() over(order by total_sales desc ) as ranking 
from platforms_cte
order by total_sales desc
limit 3;



-- 4- Find out which genre sells the most overall.

select genre, sum(total_sales) as total_sales,
rank() over(order by sum(total_sales) desc) as rankings
from sales_staging
group by genre
order by sum(total_sales) desc;



-- 5-Compare the sales of action vs. adventure vs. shooter games.

select  genre, sum(total_sales) as total_sales
from sales_staging
where genre ='Action' or genre ='Adventure'  or genre ='Shooter'
group by  genre
order by  total_sales desc ;


--  Average Sales Per Game (Genre Popularity)
select genre, count(distinct title) as num_of_games,sum(total_sales) as total_sales,
round(sum(total_sales)/count(distinct title),2) as avg_sales_per_game
from sales_staging
where genre ='Action' or genre ='Adventure'  or genre ='Shooter'
group by  genre
order by  avg_sales_per_game desc ;


-- Top 3 consoles Per genre
with genre_ranking_cte as
(
select console, genre, sum(total_sales) as total_sales,
rank() over(partition by genre order by sum(total_sales) desc) as ranking
from sales_staging
where genre ='Action' or genre ='Adventure'  or genre ='Shooter'
group by console, genre
)
select genre, console,total_sales,ranking
from genre_ranking_cte
WHERE ranking <= 3
order by total_Sales desc,genre, ranking ;
 
 -- 6-Analyze how genres' popularity has changed over the years.
 
 SELECT YEAR(release_date) AS release_year, genre, 
       SUM(total_sales) AS total_sales
FROM sales_staging
GROUP BY release_year, genre
ORDER BY release_year, total_sales DESC;

 
 
 -- Most Popular Genre for Each Year
 with popularity_cte as
 (
select year(release_date) as release_year, genre, round(sum(total_sales),2) as total_sales
from sales_staging
group by release_year, genre
),
ranked_genre as
(
select release_year, genre,total_sales,
rank() over(partition by release_year order by total_sales desc) as ranking,
total_sales / SUM(total_sales) OVER(PARTITION BY release_year) * 100 AS market_share

from popularity_cte
)
select release_year, genre,total_sales,market_share
from ranked_genre
where ranking = 1
order by release_year, total_sales desc;




-- 7-Compare North America vs. Europe vs. Japan in terms of sales.

select*
from sales_staging;

-- game sales in eaqch region
select  title, sum(na_sales) as na_sales, sum(pal_sales) as pal_sales, sum(jp_sales) as jp_sales,
  ROUND(SUM(na_sales) / (SUM(na_sales) + SUM(pal_sales) + SUM(jp_sales)) * 100, 2) AS na_market_share,
  ROUND(SUM(pal_sales) / (SUM(na_sales) + SUM(pal_sales) + SUM(jp_sales)) * 100, 2) AS pal_market_share,
  ROUND(SUM(jp_sales) / (SUM(na_sales) + SUM(pal_sales) + SUM(jp_sales)) * 100, 2) AS jp_market_share
from sales_staging
group by title
order by na_sales desc , pal_sales desc ,  jp_sales desc;


-- console sales in each region(most popular console in each region)

SELECT console, 
       ROUND(SUM(na_sales),2) AS na_sales, 
       ROUND(SUM(pal_sales),2) AS pal_sales, 
       ROUND(SUM(jp_sales),2) AS jp_sales,
       ROUND(SUM(na_sales) / (SUM(na_sales) + SUM(pal_sales) + SUM(jp_sales)) * 100, 2) AS na_market_share,
       ROUND(SUM(pal_sales) / (SUM(na_sales) + SUM(pal_sales) + SUM(jp_sales)) * 100, 2) AS pal_market_share,
       ROUND(SUM(jp_sales) / (SUM(na_sales) + SUM(pal_sales) + SUM(jp_sales)) * 100, 2) AS jp_market_share
FROM sales_staging
GROUP BY console
ORDER BY na_sales DESC, pal_sales DESC, jp_sales DESC;



with console_sales as
(
select console, ROUND(SUM(na_sales),2) AS na_sales, 
       ROUND(SUM(pal_sales),2) AS pal_sales, 
       ROUND(SUM(jp_sales),2) AS jp_sales,
       ROUND(SUM(na_sales) / (SUM(na_sales) + SUM(pal_sales) + SUM(jp_sales)) * 100, 2) AS na_market_share,
       ROUND(SUM(pal_sales) / (SUM(na_sales) + SUM(pal_sales) + SUM(jp_sales)) * 100, 2) AS pal_market_share,
       ROUND(SUM(jp_sales) / (SUM(na_sales) + SUM(pal_sales) + SUM(jp_sales)) * 100, 2) AS jp_market_share
from sales_staging
group by console
)
select console, na_sales, pal_sales, jp_sales,na_market_share, pal_market_share, jp_market_share,
       RANK() OVER (ORDER BY na_sales DESC) AS na_rank,
       RANK() OVER (ORDER BY pal_sales DESC) AS pal_rank,
       RANK() OVER (ORDER BY jp_sales DESC) AS jp_rank
from console_sales;






-- 8- Analyze which publishers dominate each region.

-- by market share

select publisher, ROUND(SUM(na_sales),2) AS na_sales, ROUND(SUM(pal_sales),2) AS pal_sales,  ROUND(SUM(jp_sales),2) AS jp_sales,
round(ROUND(SUM(na_sales),2)+ROUND(SUM(pal_sales),2)+ROUND(SUM(jp_sales),2),2) as total_sales,
 ROUND(SUM(na_sales) / (SUM(na_sales) + SUM(pal_sales) + SUM(jp_sales)) * 100, 2) AS na_market_share,
 ROUND(SUM(pal_sales) / (SUM(na_sales) + SUM(pal_sales) + SUM(jp_sales)) * 100, 2) AS pal_market_share,
 ROUND(SUM(jp_sales) / (SUM(na_sales) + SUM(pal_sales) + SUM(jp_sales)) * 100, 2) AS jp_market_share
from sales_staging
group by publisher
order by total_sales desc ;




-- Most Dominant Publisher in Each Region

with publisher_rank as
(
select publisher, ROUND(SUM(na_sales),2) AS na_sales, ROUND(SUM(pal_sales),2) AS pal_sales,  ROUND(SUM(jp_sales),2) AS jp_sales
from sales_staging
group by publisher
),
ranking_cte as(
select publisher, na_sales, pal_sales, jp_sales,
rank() over( order by na_sales desc) as na_rank,
rank() over( order by pal_sales desc) as pal_rank,
rank() over( order by jp_sales desc) as jp_rank
from publisher_rank
)
select publisher, na_sales, pal_sales, jp_sales, na_rank, pal_rank,jp_rank
from ranking_cte
WHERE na_rank <= 1 OR pal_rank <= 1 OR jp_rank <= 1
order by publisher;



-- 9-Identify the top-selling publishers.(top 10)
select publisher, round(sum(total_Sales),2) as total_sales
from sales_staging
group by publisher
order by total_sales desc
limit 10;


with publisher_marketshare as
(
select publisher, round(sum(total_sales),2) as total_Sales
from sales_staging
group by publisher
)
select publisher, total_Sales,
round((total_sales/sum(total_sales) over()*100),2) as market_Share
from publisher_marketshare
order by total_Sales desc;




-- 10-Find out which publishers have the most consistent hits

with hit_games as
(
    SELECT publisher, title, sum(total_sales) as total_sales,
           NTILE(10) OVER (ORDER BY sum(total_sales) DESC) AS sales_percentile
    FROM sales_staging
    group by publisher, title
)
select publisher,count(*) as hits
from hit_games
where sales_percentile =1
group by publisher
order by hits desc
limit 5;




