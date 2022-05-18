-- 가장 많이 발생한 암 종류를 암종, 발생자수 출력
select 암종,발생자수
from cancer0
where 발생자수 =(
select MAX(발생자수)
from cancer0
where 암종 not in('모든암(C00-C96)'));

-- 가장 많이 발생한 암 종류 1~ 5위까지 자료 출력
select 암종, rank() over (ORDER by 발생자수 DESC)
from cancer0
where ROWNUM <=5;

-- 분율이 10%이상인 자료출력
select 암종,분율
from (select 암종, 분율
from cancer0
where 암종 not in('모든암(C00-C96)'))
where 분율>=10;

-- 백혈병의 발생자수를 출력하시오
select 암종, 발생자수
from cancer0
where 암종='백혈병(C91-C95)';