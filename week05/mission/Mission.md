## ✅ 1-1. 특정 지역에 가게 추가하기 API

### API 명세

### Method & EndPoint

`POST /mypage/addStore`

### Request Header

```json
Authorization: Bearer {access_token}
```

### Request Body

```json
{
	"store": {
		"name": "가게이름",
		"time": "월 12시-20시",
		"address": "서울특별시 노원구 광운로 20"
	},
	"region": 1
}
```

### Response Body

```sql
{
	"success": true
	"code": 200,
	"message": "가게 추가가 완료되었습니다.",
	"data": {
		"storeId": 1
	}
}
```

### 해결

### 서버 로그
<img width="823" height="238" alt="image" src="https://github.com/user-attachments/assets/4839c33a-3b86-4a9b-9900-1c04b57aa007" />

### DB 저장 결과
<img width="583" height="412" alt="image" src="https://github.com/user-attachments/assets/0ef95f07-918d-4907-8772-ff52e9e04808" />

### Postman 테스트 결과
<img width="583" height="412" alt="image" src="https://github.com/user-attachments/assets/87e4cefe-6a5e-430f-a0e3-732823fb04a3" />

## ✅ **1-2. 가게에 리뷰 추가하기 API**

- 리뷰를 추가하려는 가게가 존재하는지 검증이 필요합니다.

### API 명세

### Method & EndPoint

`POST /review/new`

### Request Header

```json
Authorization: Bearer {access_token}
```

### Request Body

```json
{
	"storeId": 2,
	"text": "string",
	"score": 4,
	"images": [
		"url1",
		"url2"
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

### 해결

### 서버 로그
<img width="522" height="55" alt="image" src="https://github.com/user-attachments/assets/2941caef-0984-4932-b826-41d8db9075ce" />

### DB 저장 결과

<img width="340" height="267" alt="image" src="https://github.com/user-attachments/assets/dabe93d5-1167-4fb1-adad-e700cb3aed10" />
review 테이블

<img width="313" height="280" alt="image" src="https://github.com/user-attachments/assets/5e1dba41-f5e9-4493-91dd-ca08e154eb94" />
picture 테이블

<img width="370" height="277" alt="image" src="https://github.com/user-attachments/assets/4fc26687-830b-41cd-84ca-75e29991dd05" />
review와 picture 매핑테이블

### Postman 테스트 결과
<img width="453" height="672" alt="image" src="https://github.com/user-attachments/assets/0271e71e-d817-4919-b49a-dd23eed7bfb1" />

## ✅ 1-3. 가게에 미션 추가하기 API

- 미션을 추가하려는 가게가 존재하는지 검증이 필요합니다
- 미션을 추가하는 주체가 가게의 주인이 맞는지 확인합니다

### API 명세

### Method & EndPoint

`POST /store/addMission`

### Request Header

```json
Authorization: Bearer {access_token}
```

### Request Body

```json
{
	"storeId": 2,
	"content": "string",
	"point": 100
}
```

### Response Body

```sql
{
	"success": true
	"code": 200,
	"message": "미션 추가가 완료되었습니다.",
	"data": {
		"missionId": 1
	}
}
```

### 해결

### 서버 로그
<img width="425" height="73" alt="image" src="https://github.com/user-attachments/assets/144faf06-fc08-49cc-af84-9bec395d98f2" />

### DB 저장 결과
<img width="425" height="73" alt="image" src="https://github.com/user-attachments/assets/954c4e0b-c170-4d0f-8ebe-7311755ba8d3" />

### Postman 테스트 결과
<img width="286" height="265" alt="image" src="https://github.com/user-attachments/assets/b0ce4023-8373-4e45-aa55-dbf0ddd88774" />

## ✅ **1-4. 가게의 미션을 도전 중인 미션에 추가(미션 도전하기) API**

- 도전하려는 미션이 이미 도전 중이지는 않은지 검증이 필요합니다.
- 1-3번 API를 구현하지 않은 경우, 1-4번에서는 DB에 미션 정보를 수동으로 기입한 후 진행해야 합니다.

### API 명세

### Method & EndPoint

`POST /mission/challenge`

### Request Header

```json
Authorization: Bearer {access_token}
```

### Request Body

```json
{
	"missionId": 1
}
```

### Response Body

```sql
{
	"success": true
	"code": 200,
	"message": "미션 도전이 완료되었습니다.",
	"data": {
		"mappingId": 1
	}
}
```

### 해결

### 서버 로그
<img width="210" height="68" alt="image" src="https://github.com/user-attachments/assets/19476d0d-21d9-4b37-a543-eea4ea37d71d" />

### DB 저장 결과
<img width="480" height="266" alt="image" src="https://github.com/user-attachments/assets/9a9ad2cc-fc5d-4b1a-b023-1269765f7c70" />

### Postman 테스트 결과
<img width="446" height="672" alt="image" src="https://github.com/user-attachments/assets/9603e8b9-dfaa-4f73-acd7-a6045c0bfde9" />

