-- 코드를 작성해주세요
-- 아이템의 희귀도가 'RARE'인 아이템들의 / 모든 다음 업그레이드 아이템의 아이템 ID(ITEM_ID), 아이템 명(ITEM_NAME), 아이템의 희귀도(RARITY)를 출력하는 SQL 문을 작성해 주세요.
-- 이때 결과는 아이템 ID를 기준으로 내림차순 정렬주세요.


-- 1. ITEM_ID = PARENT_ITME_ID,
-- 2. ITEM_NAME, RARITY


WITH CTE AS (
    SELECT ITEM_ID
    FROM ITEM_INFO
    WHERE RARITY = 'RARE'
)


SELECT II.ITEM_ID, II.ITEM_NAME, II.RARITY
FROM ITEM_INFO II

JOIN ITEM_TREE TR
ON II.ITEM_ID = TR.ITEM_ID

JOIN CTE
ON TR.PARENT_ITEM_ID = CTE.ITEM_ID

ORDER BY II.ITEM_ID DESC 



