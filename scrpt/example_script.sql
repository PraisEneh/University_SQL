select S.name, S.salary
from instructor as S, instructor as T
where S.salary>T.salary and T.dept_name='Biology';

select name, salary
from instructor
where salary > all (select salary from instructor
					 where dept_name='Biology');
                     
select course_id from section
where year=2009 and semester='Fall'
and course_id IN( select course_id from section where year=2010 and semester='Spring');

select dept_name, avg(salary)
from (select dept_name, avg(salary) as avg_salary
	  from instructor
      group by dept_name)
group by dept_name
having avg(salary) > 42000;




select dept_name, budget
from department, (select max(budget) as max_v from department)as max_budget 
where department.budget = max_budget.max_v;

create table instructor_a
select * from instructor;

delete from instructor_a
where dept_name='Finance';