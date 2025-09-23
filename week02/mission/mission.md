- **미션 기록**
    
    # 1. 내가 진행중, 진행 완료한 미션 모아서 보는 쿼리

```sql
SELECT ms.reward,
	s.name,
	ms.mission_spec,
	mbms.status
FROM member_mission mbms
JOIN mission ms ON mbms.mission_id = ms.id
JOIN store s ON ms.store_id = s.id
WHERE mbms.member_id = :memberID AND mbms.status IN ('진행중', '진행완료')
ORDER BY mbms.updated_at DESC
LIMIT 10 OFFSET 0;
```

---

# 2. 리뷰 작성하는 쿼리

```sql
INSERT INTO review (
    member_id,
    store_id,
    body,
    score,
    created_at,
    updated_at
)

VALUES (
    :member_id,
    :store_id,
    :body,
    :score,
    NOW(),
    NOW()
);
```

---

# 3. 홈 화면 쿼리

```sql
SELECT
  r.name,
  s.name,
  fc.name,
  ms.mission_spec,
  ms.reward,
  ms.deadline,
  ms.id
FROM mission ms
JOIN store s ON ms.store_id = s.id
JOIN region r ON s.region_id = r.id
LEFT JOIN food_category fc ON s.category_id = fc.id
WHERE s.region_id = :regionId
ORDER BY ms.deadline ASC
LIMIT 10 OFFSET 0;
```

---

# 4. 마이페이지 쿼리

```sql
SELECT
  m.name
  m.email
  m.point
FROM member m
WHERE m.id = :memberId;
```