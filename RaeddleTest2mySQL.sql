/*1. ���-5 ����� �� ���������� ��������� � �������*/
 select co.name, co.population, ci.name, ci.population 
 from country co, city ci 
 where ci.id=co.capital 
	and co.continent='Europe' 
 order by ci.population desc 
 limit 5;


/* 2.��������� ���-�� �����, ��������� �� ���������� ����� � ������ */
 select sum(c.population) 
 from country c, countrylanguage cl 
 where cl.countrycode=c.code 
	and cl.language='English';
 
 
/*3. ������ ����� � ����� � ����� ������������ �������, � ������� ����������
������������� ������ ��� ������� ����� ������, ��� �����������*/
 
      
SELECT c2.countrycode, sum(c2.isOfficial) as isOffFalse, c1.countrycode, c1.isOffTrue 
  FROM 
  (   select c0.countrycode, sum(c0.isOfficial)as isOffTrue 
		from countrylanguage c0 where c0.isOfficial='T' 
		group by c0.countrycode 
		having sum(isOfficial)>1
  )  as c1, countrylanguage as c2
  where c1.countrycode = c2.countrycode 
	and c2.isOfficial='F' 
  group by c2.countrycode 
  having sum(c2.isOfficial)>(c1.isOffTrue*2);