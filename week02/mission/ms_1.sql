SELECT 
    m.id AS mission_id,
    s.name AS store_name,
    m.point AS reward,           -- mission.point
    m.content AS mission_spec,   -- mission.content
    um.status AS user_mission_status, -- TRUE(진행중)/FALSE(진행완료)
    um.created_at,
    um.completed_at
FROM user u
JOIN user_mission um ON u.id = um.user_id
JOIN mission m ON m.id = um.mission_id
JOIN store s ON m.store_id = s.id
WHERE u.id = {user_id}                    -- 특정 사용자 ID
  AND um.status = FALSE            -- Boolean 상태값
  AND m.id < {cursor_value}       -- 커서
ORDER BY m.id DESC
LIMIT 10;