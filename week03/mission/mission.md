# 1. 홈 화면

- End Point : /home
- Method : GET
- Request
    - Body:
        
        ```json
        GET 메서드이기 때문에 필요 없음
        ```
        
- Request Header : `Authorization: accessToken (String)`
- Query String : `GET/home?region=안암동`
- Path Variable : X

---

# 2. 마이 페이지 리뷰 작성

- End Point : /user/{user_id}/reviews
- Method : POST
- Request
    - Body:
        
        ```json
        {
        	"user_id" : 628,
        	"store" : "반이학생마라탕",
        	"score" : 4.5,
        	"text" : "존맛~"
        }
        ```
        
- Request Header : `Authorization: accessToken (String)`
- Query String : `GET/user/{user_id}/reviews?store=반이학생마라탕`
- Path Variable : X

---

# 3. 미션 목록 조회(진행중, 진행 완료)

- End Point : /user/mission
- Method : GET
- Request
    - Body:
        
        ```json
        GET 메서드이기 때문에 필요 없음
        ```
        
- Request Header : `Authorization: accessToken (String)`
- Query String : `GET/user/mission?state=진행중` , `GET /user/mission?state=진행완료`
- Path Variable : X

---

# 4. 미션 성공 누르기

- End Point : /user/mission/{mission_id}/complete
- Method : POST
- Request
    - Body:
        
        ```json
        {
        	"state": "completed",
          "missionId": 0628
        }
        ```
        
- Request Header : `Authorization: accessToken (String)`
- Query String : X
- Path Variable : X

---

# 5. 회원가입하기

- End Point : /user/register
- Method : POST
- Request
    - Body:
        
        ```json
        {
        	"email" : "abc@kw.ac.kr",
        	"password" : "1234",
        	"name" : "김소정",
        	"phone" : "01012345678",
        	"gender" : "F",
        	"age" : 24,
        	"address" : "서울시 노원구 월계동",
        	"spec_address" : "광운대학교"
        }
        ```
        
- Request Header : X
- Query String : X
- Path Variable : X