<aside>
💡

**홈 화면, 마이 페이지 리뷰 작성, 미션 목록 조회(진행중, 진행 완료), 미션 성공 누르기,
회원 가입 하기(소셜 로그인 고려 X)**

</aside>

## 홈화면

<img width="375" height="812" alt="홈" src="https://github.com/user-attachments/assets/ea1c9a33-ec61-4b2b-ada3-62b201686252" />

### Method & EndPoint

`GET /home`

### Request Header

```json
Authorization: Bearer {access_token}
```

### Response Body

```sql
{
	"success": true
	"code": 200,
	"message": "/home요청이 성공적입니다.",
	"data": {
		"point": 999999,
		"NewAlarm": true,
		"region": {
			"name": "안암동",
			"achieveCount": 7
		},
		"missions": [
			{
				"store": {
					"id": 1,
					"name": "반이학생마라탕"
				},
				"text": "10,000원 이상의 식사",
				"compensation": 500,
				"dDay": 7
			},
			{
				"store": {
					"id": 2,
					"name": "반삼학생마라탕"
				},
				"text": "20,000원 이상의 식사",
				"compensation": 500,
				"dDay": 7
			}
		]
	}
}
```

## 마이 페이지 리뷰 작성

<img width="375" height="812" alt="X - 10" src="https://github.com/user-attachments/assets/9b50db00-8dcf-4033-b12e-7ac78ac76ea7" />

### Method & EndPoint

`POST /review/new`

### Request Header

```json
Authorization: Bearer {access_token}
```

### Request Body

```json
{
	"storeId": 1,
	"text": "string",
	"images": [
		"image": "url",
		"image": "url"
	]
}
```

### Response Body

```sql
{
	"success": true
	"code": 200,
	"message": "리뷰 작성이 완료되었습니다.",
	"data": {
		"reviewId": 1
	}
}
```

## 미션 목록 조회

<img width="360" height="800" alt="미션(홈)" src="https://github.com/user-attachments/assets/d13ce43b-36e3-4458-b6dd-07e5ce595de9" />

### Method & EndPoint

`GET /missions`

### Query String

| status | 0, 1 | 0은 진행 중, 1은 진행 완료 |
| --- | --- | --- |

### Request Header

```json
Authorization: Bearer {access_token}
```

### Response Body

```sql
{
	"success": true
	"code": 200,
	"message": "미션 목록 조회가 성공적입니다.",
	"data": {
		"missions": [
			{
				"id": 1,
				"store": {
					"id": 1,
					"name": "가게이름a"
				},
				"text": "12,000원 이상의 식사",
				"compensation": 500,
				"status": 0   //0은 진행 중, 1은 진행 완료
				"dDay": 7
			},
			{
				"id": 2,
				"store": {
					"id": 2,
					"name": "가게이름b"
				},
				"text": "10,000원 이상의 식사",
				"compensation": 500,
				"status": 0   //0은 진행 중, 1은 진행 완료
				"dDay": 7
			}
		]
	}
}
```

## 미션 성공 누르기

<img width="360" height="800" alt="미션(홈)" src="https://github.com/user-attachments/assets/beeafc1e-2268-4b76-a0a6-5340b5fe73c0" />

### Method & EndPoint

`PATCH /missions/success`

### Request Header

```json
Authorization: Bearer {access_token}
```

### Request Body

```json
{
	"id": 1
}
```

### Response Body

```sql
{
	"success": true
	"code": 200,
	"message": "미션 성공 요청이 완료되었습니다.",
	"data": null
}
```

## 회원가입

<img width="375" height="812" alt="회원가입1" src="https://github.com/user-attachments/assets/7ae0ecba-30d3-4146-8121-8cb0a483abe7" />

### Method & EndPoint

`POST /users/signup`

### Request Body

```json
{
	"id": "string",
	"password": "string",
	"name": "string",
	"gender": 0   //0은 남자, 1은 여자
	"birth": 'YYYY-MM-DD",
	"address1": "string",
	"address2": "string"
}
```

### Response Body

```sql
{
	"success": true
	"code": 200,
	"message": "회원가입 요청이 완료되었습니다.",
	"data": {
		"access_token": "string",
		"refresh_token": "string"
	}
}

```
