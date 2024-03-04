show databases;
create database olmpic_events;
use olmpic_events;
show tables;
select * from olympic_events;
select count(*) from olympic_events;

/*Q1 Write an SQL query to find out in which sport or event India has won the medals along with the count */

select Event, count(medal)
from olympic_events
where Team = 'India' and Medal <> 'NA'
group by Event;

/*Q2 Query to find out in which sport or event India has won the medals and break it up year wise*/
select Year, Event, count(medal)
from olympic_events
where Team = 'India' and Medal <> 'NA'
group by Year, Event;

/*Q3 Identify the sports or event which was played most in the summer olympic games ordered by the year played*/
select Year, Event, count(Event) from olympic_events
where Season = 'Summer'
group by Year, Event
order by count(Event) desc;

/*Q4 SQL query to fetch the detals of all the countries which have won most number of silver and bronze medals and at least 1 gold medal*/

select Team, sum(Silver), sum(Bronze), sum(Gold)
from
(select *,
	case Medal when 'Silver' then 1 else 0 end as Silver,
	case Medal when 'Bronze' then 1 else 0 end as Bronze,
	case Medal when 'Gold' then 1 else 0 end as Gold
from olympic_events) subquery
group by Team
having sum(Gold) > 0
order by sum(Silver) desc;

/*Q5 Which player has won the maximum number of Gold? */

select Name, sum(Gold_Medal_Count) as GoldMedalCount
from
(select *, if(Medal = 'Gold', 1, 0) as Gold_Medal_Count
from olympic_events) as subquery
group by Name
order by sum(Gold_Medal_Count) desc;

 /*Q6 Which sport has maximun events? */
select Sport, Event, count(Event) as count_of_events
from olympic_events
group by Sport, Event
order by count_of_events desc;

 /*Q7 Which year has shown maximun number of events? */
 select Year, count(Year) as Number_of_events
 from olympic_events
 group by Year
 order by Number_of_events desc

