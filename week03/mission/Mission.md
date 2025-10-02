<aside>
💡

**홈 화면, 마이 페이지 리뷰 작성, 미션 목록 조회(진행중, 진행 완료), 미션 성공 누르기,
회원 가입 하기(소셜 로그인 고려 X)**

</aside>

## 홈화면

![홈.png](attachment:93e47c50-9303-4950-a3f0-67da73339081:홈.png)

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

![X - 10.png](attachment:dd86057b-8044-4997-a047-d7597faf9e14:X_-_10.png)

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

![미션(홈).png](attachment:c3743b37-4301-4848-8cad-e7be9507d85a:미션(홈).png)

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

![미션(홈).png](attachment:032d5e06-abb4-4ccf-b6f1-1658c1e2a34c:미션(홈).png)

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

![회원가입1.png](attachment:d6586c93-067f-481b-bf7b-13a6b9b9f757:회원가입1.png)

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