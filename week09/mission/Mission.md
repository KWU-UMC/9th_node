## 해야할 미션

1. 기존에 사용자의 정보를 하드 코딩 부분 수정
2. 자기 자신의 정보를 수정하는 API 제작
3. 기존 API에 JWT 인증 적용

---

## 1. 사용자 정보 하드코딩 부분 수정

### 기존

- `Bearer access-token-for-user-{id}` 로 access-token 설정 중
- 해당 access-token에 대해 id를 가져오는 로직 보유 중

### 수정

- access-token을 자체적인 토큰 방식말고 jwt를 사용하여 sign진행

### 결과

- isLogin 미들웨어 추가

<img width="446" height="47" alt="1" src="https://github.com/user-attachments/assets/d97607d1-d7f5-489b-b85e-6f9eb8d4cbfd" />

- 작성자에 대한 올바른 응답

<img width="518" height="395" alt="2" src="https://github.com/user-attachments/assets/b019750d-7467-43a4-88b4-73b9c35e4c1f" />

---

## 2. 자기 자신의 정보 수정 API 제작

### 추가

- Method: `POST`
- EndPoint: `/mypage/edit`
- Request Body
    
    ```json
    {
    	"name": "string",
    	"gender": 0     // 0이면 남자, 1이면 여자
    	"birth": "2025-11-25",
    	"address": "string",
    	"subaddr": "string"
    }
    ```
    
- Response Body
    
    ```json
    {
    	"success": true,
    	"code": 200,
    	"message": "사용자 정보가 수정되었습니다",
    	"data": {
    		"userId": 1
    	}
    }
    ```
    

### 결과

<img width="787" height="632" alt="3" src="https://github.com/user-attachments/assets/919ab4f1-3f35-42bd-a9c1-e8c2683e0ca0" />

---

## 3. 기존 API들에 JWT 인증 적용

### 기존

- `Bearer access-token-for-user-{id}` 로 access-token 설정 중

### 수정

- access-token을 자체적인 토큰 방식말고 jwt를 사용하여 인증받을 수 있도록 수정

### 결과

- isLogin 미들웨어를 통해 인증

<img width="600" height="164" alt="4" src="https://github.com/user-attachments/assets/0064cadf-45a8-41ac-8877-42921faa6dde" />
