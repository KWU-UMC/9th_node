### 홈 화면

**API Endpoint**

`GET /api/v1/users/{userId}/regions/{regionName}/missions`

Method: GET

**Request Body**

x (단순 조회 API)

**Request Header**

Content-type: application/json

Authorization: Bearer {accessToken}

**query String**

cursor: number (조회 시작 위치)

limit: number (기본값 10)

**Path variable**

userId: 조회할 사용자의 Id

regionName: 조회할 지역 이름


### 마이 페이지 리뷰 작성

**API Endpoint**

`POST /api/v1/reviews`

Method: POST

**Request Body**

```json
{
  "userId": 1,
  "storeId": 22,
  "content": "커피가 맛있고 분위기가 좋아요!",
  "star": 5,
  "imageUrl": "https://example.com/review.jpg"
}

```

**Request Header**

Content-type: application/json

Authorization: Bearer {accessToken}

**query String**

x 

**Path variable**

x (리뷰 Id는 생성 시점에 부여되므로 전달할 값 없음)

### 미션 목록 조회(진행중, 진행 완료)

**API Endpoint**

`GET /api/v1/users/{userId}/missions`

Method: GET

**Request Body**

x (단순 조회 API)

**Request Header**

Content-type: application/json

Authorization: Bearer {accessToken}

**query String**

status: 진행중(inprogress), 완료(completed) → 미션 상태에 따른 필터링 필요

cursor: number

limit: number (기본값 10)

**Path variable**

userId: 조회할 사용자의 Id

### 미션 성공 누르기

**API Endpoint**

`PATCH /api/v1/users/{userId}/missions/{userMissionId}/complete`

Method: PATCH (일부 수정)

**Request Body**

```json
{
  "status": true
}
```

**Request Header**

Content-type: application/json

Authorization: Bearer {accessToken}

**query String**

x

**Path variable**

userId: 사용자 Id

userMissionId: 완료 처리할 사용자 미션 Id

### 회원 가입 하기(소셜 로그인 제외)

**API Endpoint**

`POST /api/v1/users/signup`

Method: POST

**Request Body**

```json
{
  "email": "test@example.com",
  "password": "00001111",
  "name": "농담곰",
  "gender": "F",
  "birth": "2003-08-08",
  "address": "서울특별시 노원구",
  "phone_num": "010-0000-0000",
}

```

**Request Header**

Content-type: application/json

Authorization: x (회원가입 API이므로 로그인 없이 요청 가능)

**query String**

x (사용자 입력값으로만 처리 가능)

**Path variable**

x