## 🔥 미션
1주차 때 설계한 데이터베이스를 토대로 아래의 화면에 대한 쿼리를 작성

---

1. 

내가 진행중, 진행 완료한 미션 모아서 보는 쿼리(페이징 포함)

```sql
SELECT s.name AS store_name, m.title, m.reward_points, um.status
FROM user_missions um
JOIN missions m ON um.mission_id = m.id
JOIN stores s ON m.store_id = s.id
WHERE um.user_id = :user_id
ORDER BY um.updated_at DESC
LIMIT :page_size OFFSET :offset;
```

**→** ‘사용자가 수행한 미션’이 주제이므로, 사용자와 미션의 연결고리인 user_missions 테이블에서 쿼리를 시작했다.

**→** 상세 정보(미션 제목, 가게 이름)를 보충하기 위해 missions, stores 테이블을 조인했다.

**→** 사용자 경험을 위해, 최근 활동을 먼저 보여주도록 updated_at 기준으로 내림차순 정렬했다.

2. 

리뷰 작성하는 쿼리,
* 사진의 경우는 일단 배제

```sql
INSERT INTO reviews (
    user_mission_id,
    user_id,
    store_id,
    content,
    rating,
    created_at,
    updated_at
) VALUES (
    :user_mission_id,
    :user_id,
    :store_id,
    :content,
    :rating,
    NOW(),
    NOW()
);
```

**→** ‘미션을 완료해야만 리뷰를 쓸 수 있다’는 서비스의 핵심 규칙을 데이터베이스 차원에서 강제해야 했다.

**→** 그래서 INSERT할 때 어떤 미션 완료 건에 대한 리뷰인지를 특정하는 user_mission_id를 필수값으로 포함시켰다.


3. 

홈 화면 쿼리
(현재 선택 된 지역에서 도전이 가능한 미션 목록, 페이징 포함)

```sql
SELECT s.name AS store_name, m.title, m.reward_points
FROM missions m
JOIN stores s ON m.store_id = s.id
JOIN regions r ON s.region_id = r.id
WHERE r.name = :region_name
    AND NOT EXISTS (
        SELECT 1
        FROM user_missions um
        WHERE um.mission_id = m.id AND um.user_id = :user_id
    )
ORDER BY m.created_at DESC
LIMIT :page_size OFFSET :offset;
```

→ 먼저, 미션, 가게, 지역 정보를 한 번에 가져와야 해서 missions, stores, regions 테이블을 JOIN했다.

**→** ‘사용자가 아직 도전하지 않은 미션’이라는 조건을 위해, user_missions 테이블에 사용자 기록이 없는 (NOT EXITS) 미션만 필터링했다.

**→** 성능을 위해 LIMIT와 OFFSET으로 페이징을 적용했다.

4. 

마이 페이지 화면 쿼리

```sql
SELECT nickname, email, total_points
FROM users
WHERE id = :user_id;
```

**→** 필요한 정보(닉네임, 이메일, 포인트)가 모두 users ****테이블 하나에 다 있었다.

**→** JOIN 없이 WHERE절로 특정 사용자만 바로 찾는 게 가장 직접적이고 빠른 방법이라 선택했다.