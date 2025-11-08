## 기존에 구현했던 API의 Repository 함수들을 모두 Prisma ORM을 이용하도록 변경해주세요.

- 기존 파일들을 잘못 관리해서 백업하는 과정에서 다 사라졌습니다….

## 내가 작성한 리뷰 목록

- 참고 화면
    
    ![Untitled](attachment:fc5de1f6-d216-4dbc-9fa6-10b30e8ee348:9864d338-162d-42d6-9605-6f5ca4795c84.png)
    

### API 명세

### Method & EndPoint

`GET /mypage/reviews`

### Request Header

```json
Authorization: Bearer {access_token}
```

### Response Body

```sql
{
	"success": true
	"code": 200,
	"message": "가게 추가가 완료되었습니다.",
	"data": {
		"reviews": [
			{
				"id": 1,
				"store": 1,
				"score": 5,
				"content": "string",
				"images": [
					"url1",
					"url2"
				],
				"created_at": "2025-05-14",
				"is_answer": true,
				"answer": {
					"content": "string",
					"created_at": "2025-05-15"
				}
			}
		],
		"cursor": 5,
		"totalReviews": 100
	}
}
```

### 해결

### 서버 로그

![image.png](attachment:06046467-5e46-4d30-a9e8-1cb1a7528092:image.png)

### Postman 테스트 결과 (cursor X)

```json
{
    "success": true,
    "code": 200,
    "message": "리뷰 목록 조회 요청이 완료되었습니다.",
    "data": {
        "reviews": [
            {
                "id": 9,
                "store": 1,
                "score": "4",
                "content": "테스트9",
                "created_at": "2025-11-07T16:31:24.000Z",
                "images": [],
                "is_answer": true,
                "answer": {
                    "content": "테스트 content 5",
                    "created_at": "2025-11-07T16:50:34.000Z"
                }
            },
            {
                "id": 8,
                "store": 1,
                "score": "1",
                "content": "테스트8",
                "created_at": "2025-11-07T16:31:20.000Z",
                "images": [],
                "is_answer": true,
                "answer": {
                    "content": "테스트 content 4",
                    "created_at": "2025-11-07T16:45:34.000Z"
                }
            },
            {
                "id": 7,
                "store": 1,
                "score": "1",
                "content": "테스트7",
                "created_at": "2025-11-07T16:31:19.000Z",
                "images": [
                    "url4"
                ],
                "is_answer": false,
                "answer": null
            },
            {
                "id": 6,
                "store": 1,
                "score": "2",
                "content": "테스트6",
                "created_at": "2025-11-07T16:31:18.000Z",
                "images": [],
                "is_answer": false,
                "answer": null
            },
            {
                "id": 5,
                "store": 1,
                "score": "4",
                "content": "테스트5",
                "created_at": "2025-11-07T16:31:17.000Z",
                "images": [],
                "is_answer": false,
                "answer": null
            }
        ],
        "cursor": 0,
        "totalReviews": 9
    }
}
```

### Postman 테스트 결과 (cursor 5)

```json
{
    "success": true,
    "code": 200,
    "message": "리뷰 목록 조회 요청이 완료되었습니다.",
    "data": {
        "reviews": [
            {
                "id": 5,
                "store": 1,
                "score": "4",
                "content": "테스트5",
                "created_at": "2025-11-07T16:31:17.000Z",
                "images": [],
                "is_answer": false,
                "answer": null
            },
            {
                "id": 4,
                "store": 1,
                "score": "3",
                "content": "테스트4",
                "created_at": "2025-11-07T16:31:16.000Z",
                "images": [
                    "url3"
                ],
                "is_answer": true,
                "answer": {
                    "content": "테스트 content 3",
                    "created_at": "2025-11-07T16:36:44.000Z"
                }
            },
            {
                "id": 3,
                "store": 1,
                "score": "4",
                "content": "테스트3",
                "created_at": "2025-11-07T16:31:15.000Z",
                "images": [],
                "is_answer": true,
                "answer": {
                    "content": "테스트 content 2",
                    "created_at": "2025-11-07T16:36:34.000Z"
                }
            },
            {
                "id": 2,
                "store": 1,
                "score": "4",
                "content": "테스트2",
                "created_at": "2025-11-07T16:31:14.000Z",
                "images": [],
                "is_answer": false,
                "answer": null
            },
            {
                "id": 1,
                "store": 1,
                "score": "5",
                "content": "테스트1",
                "created_at": "2025-11-07T16:29:34.000Z",
                "images": [
                    "url1",
                    "url2"
                ],
                "is_answer": true,
                "answer": {
                    "content": "테스트 content 1",
                    "created_at": "2025-11-07T16:36:34.000Z"
                }
            }
        ],
        "cursor": 5,
        "totalReviews": 9
    }
}
```