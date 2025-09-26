SELECT 
    m.id                AS mission_id,
    s.name              AS store_name,
    m.point             AS reward,
    m.content           AS mission_spec,
    m.deadline,
    m.status            AS mission_status,
    um.status           AS user_mission_status,  -- NULL = 아직 도전 안함, TRUE/FALSE = 진행중/완료
    um.created_at       AS user_mission_created_at,
    um.completed_at     AS user_mission_completed_at
FROM mission m
JOIN store s ON m.store_id = s.id
LEFT JOIN user_mission um 
       ON m.id = um.mission_id 
      AND um.user_id = {user_id}           -- 특정 사용자
WHERE s.region_id = {region_id}             -- 선택한 지역
  AND (um.status IS NULL OR um.status = TRUE)  -- 아직 도전 안했거나 진행중
  AND m.id < {cursor_value}                 -- 첫 페이지 조회용 커서
ORDER BY m.id DESC
LIMIT 10;