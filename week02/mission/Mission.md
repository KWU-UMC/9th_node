## 1번: 내가 진행중, 진행 완료한 미션 모아서 보는 쿼리(페이징 포함)

```sql
SELECT m.id, m.content
FROM Mission as m
JOIN User-Mission as um ON m.id = um.mission
WHERE um.user = userId(입력받기) AND um.isProgress = 1(진행 중, 2: 진행 완료)
LIMIT 10 
OFFSET ((페이지) - 1) * 10;
```

## 2번: 리뷰 작성하는 쿼리, 사진의 경우는 일단 배제

```sql
INSERT INTO Review (store, reviewer, score, content)
VALUE (작성가게, 작성자, 별점입력, 내용입력);
```

## 3번: 홈 화면 쿼리 (현재 선택 된 지역에서 도전이 가능한 미션 목록, 페이징 포함)

```sql
SELECT u.point, ur.count, m
FROM User u
JOIN User-Region ur ON u.id = ur.user
JOIN Region r ON ur.region = r.id
JOIN User-Mission um ON u.id = um.user
JOIN Mission m ON m.id = um.mission
WHERE u.id = userId(입력받기) AND r.name = regionName(입력받기) AND um.isProgress = 0
ORDER BY um.start_at asc, id asc
LIMIT 10
OFFSET ((페이지) - 1) * 10;
```

## 4번: 마이 페이지 화면 쿼리

```sql
SELECT u.name, u.email, u.point
FROM User u
WHERE u.id = userId(입력받기);
```