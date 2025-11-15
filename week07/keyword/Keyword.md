- 미들웨어
    
    ## **1) 정의**
    
    - Express에서 **요청(request) → 응답(response)** 과정 중간에 위치해 **기능을 수행하는 함수**.
    - 모든 요청은 미들웨어 파이프라인을 따라 흐르며, 미들웨어는 요청/응답 객체를 수정하거나, 특정 조건에서 응답을 종료하거나, 다음 미들웨어(next)를 호출할 수 있음.
    
    ## **2) 특징**
    
    - `app.use()` 또는 라우터 단위로 적용 가능.
    - 순서 기반 → **정의 순서가 매우 중요함**.
    - 요청/응답 가공, 인증, 로깅, 에러 처리 등에 사용.
    
    ## **3) 실무에서 자주 쓰는 타입**
    
    | 종류 | 설명 |
    | --- | --- |
    | Application Middleware | `app.use()`로 전체 적용 |
    | Router Middleware | 특정 router에만 적용 |
    | Built-in Middleware | `express.json()`, `express.urlencoded()` |
    | Third-party | `cors`, `morgan`, `helmet` |
    | Error Handling Middleware | 에러 처리 전용(4개의 인자 필요) |
- HTTP 상태 코드
    
    ## **1) 개요**
    
    클라이언트 요청에 대해 서버가 어떤 상태인지 의미하는 3자리 숫자.
    
    ## **2) 범위별 특징**
    
    | 범위 | 의미 | 예시 |
    | --- | --- | --- |
    | **1xx** | 정보 | 100 Continue |
    | **2xx** | 성공 | 200 OK, 201 Created |
    | **3xx** | 리다이렉트 | 301 Moved Permanently |
    | **4xx** | 요청 오류 | 400 Bad Request, 401 Unauthorized, 403 Forbidden, 404 Not Found |
    | **5xx** | 서버 오류 | 500 Internal Server Error, 503 Service Unavailable |
    
    ## **3) 실무에서 자주 사용하는 코드 정리**
    
    ### ✔ 200 OK
    
    정상 응답
    
    → 조회 성공, 리스트 조회 등
    
    ### ✔ 201 Created
    
    리소스 생성 완료
    
    → 회원가입, 글쓰기 성공
    
    ### ✔ 400 Bad Request
    
    클라이언트 요청이 잘못됨
    
    → body 부족, 파라미터 이상
    
    ### ✔ 401 Unauthorized
    
    인증 필요
    
    → JWT 토큰 없거나 유효하지 않음
    
    ### ✔ 403 Forbidden
    
    권한 부족
    
    → 관리자만 가능한 요청인데 일반 유저가 요청
    
    ### ✔ 404 Not Found
    
    URL 또는 리소스가 존재하지 않음
    
    ### ✔ 500 Internal Server Error
    
    서버 코드 내부 오류
    
    → try/catch에서 잡히지 못한 에러
    
- 에러 핸들링(Error Handling)
    
    ## **1) 에러 핸들링이 중요한 이유**
    
    - 프로덕션 서비스는 실패를 무조건 고려해야 함.
    - 에러가 나도 서버가 죽지 않아야 함.
    - 클라이언트에 일관된 에러 구조를 전달해야 함.
    
    `TypeError: object is not iterable` 같은 내부 에러가 그대로 외부로 노출됨 → 매우 위험.