- Swagger
    - **API 설명서를 자동으로 만들어주는 도구**
    - 백엔드에서 만든 API를 시각화해 문서처럼 보여줌
    - Swagger UI를 통해 브라우저에서 API 목록, 파라미터, 응답 구조 등을 확인 가능
    - 코드에 주석만 달아도 문서가 자동 생성됨
    (`swagger-jsdoc`, `swagger-ui-express` 등 사용)
    - 프론트엔드, 기획자, QA와 협업 시 커뮤니케이션 비용 절감
    - API를 직접 테스트할 수 있는 UI 제공
    
    **장점**
    
    - 문서 자동 생성 → 유지보수 편함
    - UI로 한눈에 확인 가능
    - 팀 협업에 최적화
    
    **단점**
    
    - OpenAPI 3.1 완전 지원 부족
    - 복잡한 커스터마이징 어려움
- OpenAPI
    - **REST API 명세를 위한 표준 포맷 (YAML 또는 JSON)**
    - Swagger는 이 OpenAPI 명세를 읽고 문서를 생성함
    → OpenAPI는 “언어”, Swagger는 “뷰어” 역할
    - `paths`, `parameters`, `requestBody`, `responses` 등 구조화된 형태로 API를 정의함
    - 도구와 언어 상관없이 동일한 규칙으로 API를 문서화 가능
    
    **장점**
    
    - 문서 표준화
    - 다양한 툴과 연동 쉬움
    - Git 등으로 버전 관리 가능
    
    **단점**
    
    - 문법이 복잡하게 느껴질 수 있음
    - 작성 규칙에 익숙해지는데 시간 필요
- OpenAPI Component
    - **OpenAPI 문서에서 공통되는 항목을 재사용 가능하게 묶어둔 곳**
    - 중복된 객체(예: `User`, `ErrorResponse`)를 하나만 정의하고 참조 가능
    - 유지보수 편리, 문서 가독성 향상
    
    ```yaml
    components:
      schemas:
        User:
          type: object
          properties:
            id:
              type: integer
            name:
              type: string
    ```