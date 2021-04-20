## This script joins two separate tables with NFL game data

select 'American Football' as Sport, g.date as Date,
case when month(g.date) = 1 then year(g.date)-1
     else year(g.date) end as Season,
g.home_team as Home_team, g.away_team as Away_Team, if(g.home_team=g.Winner, g.pts_win, g.pts_loss) as Home_Team_Score,
if(g.away_team=g.Winner, g.pts_win, g.pts_loss) as Away_Team_Score,
case when g.tie!='' then 'Tie'
	 when g.home_team=g.Winner then 'Home'
     else 'Away' end as Winner, 
if(g.tie='' and g.home_team=g.Winner, 1, 0) as Home_Team_Won, a.weekly_attendance as Attendance, 0 as During_COVID
from nfl_attendance a join nfl_games g on (a.year = g.year and a.week = g.week and a.home_team=g.home_team);
 