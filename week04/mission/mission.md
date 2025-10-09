# 미션 기록

### 로컬 DB 세팅

![Image](https://github.com/user-attachments/assets/e84eca6f-3e22-4c2d-bb8b-c01c3d40d147)

![스크린샷(112).png](https://github.com/user-attachments/assets/4085c1a1-bc94-4cc7-9c0b-e9c107d1da85)

테이블 생성

```sql
CREATE DATABASE umcmission;

USE umcmission;

CREATE TABLE `store` (
	`id`	bigint	NOT NULL,
	`region_id`	bigint	NOT NULL,
	`name`	varchar(30)	NULL,
	`number`	int	NULL,
	`thumbnail`	varchar(255)	NULL,
	`work_time`	time	NULL,
	`region`	varchar(10)	NULL,
	`address`	varchar(255)	NULL
);

CREATE TABLE `notification` (
	`id`	bigint	NOT NULL,
	`user_id`	bigint	NOT NULL,
	`type`	varchar(30)	NULL,
	`content`	varchar(255)	NULL,
	`status`	boolean	NULL,
	`created_at`	datetime(6)	NULL
);

CREATE TABLE `mission` (
	`id`	bigint	NOT NULL,
	`store_id`	bigint	NOT NULL,
	`status`	varchar(10)	NULL,
	`content`	varchar(255)	NULL,
	`deadline`	date	NULL,
	`point`	int	NULL,
	`created_at`	datetime(6)	NULL,
	`updated_at`	datetime(6)	NULL
);

CREATE TABLE `food` (
	`id`	bigint	NOT NULL,
	`type`	varchar(10)	NULL
);

CREATE TABLE `user` (
	`id`	bigint	NOT NULL,
	`email`	varchar(30)	NULL,
	`name`	varchar(10)	NOT NULL,
	`gender`	varchar(10)	NULL,
	`birth`	date	NULL,
	`address`	varchar(255)	NULL,
	`point`	int	NULL,
	`created_at`	datetime(6)	NULL,
	`updated_at`	datetime(6)	NULL,
	`status`	varchar(15)	NULL,
	`inactive_date`	datetime	NULL,
    `phone_num`	varchar(20)	NULL
);

CREATE TABLE `user_food` (
	`id`	bigint	NOT NULL,
	`user_id`	bigint	NOT NULL,
	`food_id`	bigint	NOT NULL
);

CREATE TABLE `region` (
	`id`	bigint	NOT NULL,
	`name`	varchar(30)	NULL
);

CREATE TABLE `review` (
	`id`	bigint	NOT NULL,
	`user_id`	bigint	NOT NULL,
	`store_id`	bigint	NOT NULL,
	`content`	varchar(255)	NULL,
	`star`	int	NULL,
	`imageUrl`	varchar(255)	NULL,
	`created_at`	datetime(6)	NULL,
	`updated_at`	datetime(6)	NULL
);

CREATE TABLE `inquiry` (
	`id`	bigint	NOT NULL,
	`user_id`	bigint	NOT NULL,
	`type`	varchar(30)	NULL,
	`title`	varchar(50)	NULL,
	`content`	varchar(255)	NULL,
	`imageUrl`	varchar(255)	NULL,
	`status`	varchar(15)	NULL,
	`created_at`	datetime(6)	NULL
);

CREATE TABLE `user_mission` (
	`id`	bigint	NOT NULL,
	`user_id`	bigint	NOT NULL,
	`mission_id`	bigint	NOT NULL,
	`status`	boolean	NULL,
	`created_at`	datetime(6)	NULL,
	`completed_at`	datetime(6)	NULL
);

CREATE TABLE `setting` (
	`id`	bigint	NOT NULL,
	`user_id`	bigint	NOT NULL,
	`locationInfo`	boolean	NULL,
	`marketingInfo`	boolean	NULL,
	`newEvent`	boolean	NULL,
	`reviewNotice`	boolean	NULL,
	`inquiryNotice`	boolean	NULL,
	`created_at`	datetime(6)	NULL,
	`updated_at`	datetime(6)	NULL
);

ALTER TABLE `store` ADD CONSTRAINT `PK_STORE` PRIMARY KEY (
	`id`,
	`region_id`
);

ALTER TABLE `notification` ADD CONSTRAINT `PK_NOTIFICATION` PRIMARY KEY (
	`id`,
	`user_id`
);

ALTER TABLE `mission` ADD CONSTRAINT `PK_MISSION` PRIMARY KEY (
	`id`,
	`store_id`
);

ALTER TABLE `food` ADD CONSTRAINT `PK_FOOD` PRIMARY KEY (
	`id`
);

ALTER TABLE `user` ADD CONSTRAINT `PK_USER` PRIMARY KEY (
	`id`
);

ALTER TABLE `user_food` ADD CONSTRAINT `PK_USER_FOOD` PRIMARY KEY (
	`id`,
	`user_id`,
	`food_id`
);

ALTER TABLE `region` ADD CONSTRAINT `PK_REGION` PRIMARY KEY (
	`id`
);

ALTER TABLE `review` ADD CONSTRAINT `PK_REVIEW` PRIMARY KEY (
	`id`,
	`user_id`,
	`store_id`
);

ALTER TABLE `inquiry` ADD CONSTRAINT `PK_INQUIRY` PRIMARY KEY (
	`id`,
	`user_id`
);

ALTER TABLE `user_mission` ADD CONSTRAINT `PK_USER_MISSION` PRIMARY KEY (
	`id`,
	`user_id`,
	`mission_id`
);

ALTER TABLE `setting` ADD CONSTRAINT `PK_SETTING` PRIMARY KEY (
	`id`,
	`user_id`
);

ALTER TABLE `store` ADD CONSTRAINT `FK_region_TO_store_1` FOREIGN KEY (
	`region_id`
)
REFERENCES `region` (
	`id`
);

ALTER TABLE `notification` ADD CONSTRAINT `FK_user_TO_notification_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`id`
);

ALTER TABLE `mission` ADD CONSTRAINT `FK_store_TO_mission_1` FOREIGN KEY (
	`store_id`
)
REFERENCES `store` (
	`id`
);

ALTER TABLE `user_food` ADD CONSTRAINT `FK_user_TO_user_food_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`id`
);

ALTER TABLE `user_food` ADD CONSTRAINT `FK_food_TO_user_food_1` FOREIGN KEY (
	`food_id`
)
REFERENCES `food` (
	`id`
);

ALTER TABLE `review` ADD CONSTRAINT `FK_user_TO_review_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`id`
);

ALTER TABLE `review` ADD CONSTRAINT `FK_store_TO_review_1` FOREIGN KEY (
	`store_id`
)
REFERENCES `store` (
	`id`
);

ALTER TABLE `inquiry` ADD CONSTRAINT `FK_user_TO_inquiry_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`id`
);

ALTER TABLE `user_mission` ADD CONSTRAINT `FK_user_TO_user_mission_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`id`
);

ALTER TABLE `user_mission` ADD CONSTRAINT `FK_mission_TO_user_mission_1` FOREIGN KEY (
	`mission_id`
)
REFERENCES `mission` (
	`id`
);

ALTER TABLE `setting` ADD CONSTRAINT `FK_user_TO_setting_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`id`
);
```

데이터 삽입

```sql
-- region
INSERT INTO region (id, name) VALUES 
(1, '서울'), (2, '부산');

-- store
INSERT INTO store (id, region_id, name, number, thumbnail, work_time, region, address)
VALUES 
(1, 1, '카페', 123456, NULL, '09:00:00', '강남', '서울 강남구 123'),
(2, 2, '식당', 789012, NULL, '10:00:00', '해운대', '부산 해운대구 456');

-- user
INSERT INTO user (id, email, name, gender, birth, address, point, created_at, updated_at, status, inactive_date, phone_num) VALUES
(1, 'test1@email.com', '김이박', '남', '1990-01-01', '서울시 강남구', 1000, NOW(), NOW(), 'active', NULL, '010-1111-2222'),
(2, 'test2@email.com', '농담곰', '여', '1995-05-05', '부산시 해운대구', 500, NOW(), NOW(), 'active', NULL, '010-3333-4444');

-- mission
INSERT INTO mission (id, store_id, status, content, deadline, point, created_at)
VALUES 
(1, 1, 'ongoing', '커피 1잔 주문', '2025-12-31', 10, NOW()),
(2, 1, 'ongoing', '디저트 주문', '2025-12-31', 20, NOW()),
(3, 2, 'ongoing', '점심 식사', '2025-12-31', 15, NOW());

-- user_mission
INSERT INTO user_mission (id, user_id, mission_id, status, created_at, completed_at) VALUES
(1, 1, 1, TRUE, NOW(), NULL),   -- 진행중
(2, 1, 2, FALSE, NOW() - INTERVAL 2 DAY, NOW() - INTERVAL 1 DAY); -- 완료

-- review
INSERT INTO review (id, user_id, store_id, content, star, created_at)
VALUES
(1, 1, 1, '맛있어요', 5, NOW()),
(2, 2, 2, '좋아요', 4, NOW());

```

### 실습

> **GitHub 저장소 주소**
> 
> 
> https://github.com/gpdnjs8/umc_mission 
> 

![스크린샷(115).png](https://github.com/user-attachments/assets/b08189a2-0b18-405e-83a2-707c67da95ff)

- 지난 주차 실습 결과다.

![스크린샷(116).png](https://github.com/user-attachments/assets/19f2d58a-403c-4b4f-859b-c3121a85d36d)

- `node_modules`: Node.js 라이브러리들이 저장되어 있는 폴더
- `public`: 정적 파일들을 사용할 때 사용
- `src`: 소스 코드를 저장하는 폴더
    - `controllers`: Controller 코드를 저장하는 곳
    - `dtos`: DTO 코드를 저장하는 곳
    - `repositories`: 데이터 조작과 관련한 코드를 저장하는 곳
    - `services`: Service 관련 코드를 저장하는 곳

![스크린샷(117).png](https://github.com/user-attachments/assets/95a1e166-ef1b-4e97-b097-165278b015e1)

- dotenv 패키지를 설치한 후 .env 파일을 생성하였다. 또한 .gitignore 파일에 .env를 포함시켜 깃에 업로드되지 않도록 설정하였다.

![스크린샷(121).png](https://github.com/user-attachments/assets/31bab433-574d-4b22-bcbd-1b16126d4abf)

- feature/chapter-04 브랜치를 통해 깃허브에 워크북 코드를 업로드하였다.