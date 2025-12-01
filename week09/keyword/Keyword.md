- OAuth 2.0
    
    ### 📌 **정의**
    
    OAuth 2.0은 **사용자의 비밀번호를 노출하지 않고도** 제3자 앱이 제한된 접근 권한을 얻도록 해주는 **인증·인가 프로토콜**이다.
    
    예: Google 로그인, Naver 로그인, GitHub 로그인 등이 모두 OAuth 2.0 기반.
    
    ---
    
    ### 📌 **특징**
    
    - **인가(Authorization) 중심 프로토콜** → 로그인/인증 자체는 OpenID Connect(OIDC)가 담당.
    - Access Token을 통해 권한 부여.
    - 다양한 인증 플로우 제공
        - Authorization Code Flow (가장 일반적)
        - Implicit Flow
        - Resource Owner Password Credentials Flow
        - Client Credentials Flow
    - 토큰 기반으로 작동 → 서버는 세션 유지 없이 인증 처리 가능.
    
    ---
    
    ### 📌 **장점**
    
    - 비밀번호를 외부 앱과 공유하지 않아도 된다 → **보안 강화**
    - 다양한 플랫폼(웹, 모바일, 서버)에 유연하게 적용
    - 확장성 높음 (SNS 로그인, 서드파티 API 호출 등)
    
    ### 📌 **단점**
    
    - 구현이 복잡함 (Redirect, Token Exchange 등)
    - 올바른 Flow를 선택하지 않으면 보안 취약 가능
    - Access Token 유출 시 위험
- JWT
    
    ### 📌 **정의**
    
    JWT는 JSON 형식의 데이터를 **서명(Signature)** 하여 안전하게 전송하기 위한 **토큰 기반 인증 기술**이다.
    
    Access Token, ID Token 등에 주로 사용됨.
    
    `HEADER.PAYLOAD.SIGNATURE` 구조로 이루어짐.
    
    ---
    
    ### 📌 **특징**
    
    - 클라이언트에 저장되는 **Self-contained Token**
    - 서버가 세션 정보를 저장하지 않아도 됨(Stateless)
    - 보통 Base64URL 로 인코딩된 문자열 형태
    
    ---
    
    ### 📌 **장점**
    
    - 서버 확장성(Stateless) → 세션 저장소 필요 없음
    - 다양한 플랫폼에서 쉽게 사용 가능
    - 서명(Signature) 검증으로 데이터 위변조 방지
    
    ### 📌 **단점**
    
    - 토큰이 탈취되면 만료 전까지 계속 사용 가능
    - Payload 내용이 평문(Base64URL)이라 **암호화된 게 아님**
        
        → 민감 정보를 절대 넣으면 안 됨!
        
    - 토큰 사이즈가 세션 ID보다 큼(대략 1KB+)
- Bearer Token
    
    ### 📌 **정의**
    
    “Bearer”는 **소유하고 있는 것만으로 인증됨**을 의미하는 토큰 타입이다.
    
    즉, 토큰을 가진 사람은 누구든 요청을 보낼 수 있음.
    
    ---
    
    ### 📌 **특징**
    
    - OAuth 2.0의 Access Token 대부분이 Bearer 방식
    - 별도 암호화나 인증 과정 없음 → **소유 = 권한**
    - HTTPS 환경에서 사용해야 안전함
    
    ---
    
    ### 📌 **장점**
    
    - 단순하고 빠른 인증 방식
    - 다양한 API에서 표준처럼 사용됨
    
    ### 📌 **단점**
    
    - 탈취되면 그대로 사용할 수 있어 위험도가 높음
    - 반드시 HTTPS 사용해야 함