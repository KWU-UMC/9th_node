- Swagger
    
    ### 🔹 **정의**
    
    Swagger는 REST API를 문서화하고 테스트할 수 있는 **도구·프레임워크 생태계 전체 이름**이다.
    
    과거에는 “Swagger Specification(스웨거 스펙)"이라는 자체 문서 표준을 사용했지만, 이것이 발전해 **OpenAPI Specification(OAS)**로 이름이 바뀌었다.
    
    현재 Swagger는 다음과 같은 **도구 모음**을 의미한다:
    
    - Swagger UI (API 문서 시각화)
    - Swagger Editor (문서 작성)
    - Swagger Codegen (클라이언트/서버 코드 생성)
    - SwaggerHub (협업 플랫폼)
    - Swagger Parser 등
    
    ### 🔹 **속성 / 특징**
    
    - API 스펙(OpenAPI 기반)을 **자동 UI 페이지로 렌더링**해 보여줌
    - 실시간 API 테스트 가능 (Try it out)
    - JSON/YAML 기반
    - 개발 환경(Spring, Express, NestJS 등)과 쉽게 연동
    
    ### 🔹 **장점**
    
    - UI가 직관적이고 사용하기 쉬움
    - 팀 협업에 매우 유용한 API 문서 제공
    - API 변경 시 자동 업데이트 (코드 기반 swagger generator 사용 시)
    - 백엔드-프론트 협업 속도 향상 (Mock 테스트 가능)
    
    ### 🔹 **단점**
    
    - 복잡한 구조의 API에서는 스펙 관리가 어려울 수 있음
    - 자동 스캐닝 방식은 프레임워크 의존성이 강해질 수 있음
    - 커스텀 스펙을 세밀하게 다루려면 YAML 지식이 필요
- OpenAPI
    
    ### 🔹 **정의**
    
    OpenAPI Specification(OAS)은 RESTful API를 **표준화된 문서 형식으로 정의하는 규격**이다.
    
    즉, "API 문서를 어떻게 작성해야 하는지"에 대한 **공식 표준**.
    
    OpenAPI는 Swagger 스펙의 후속 버전이며
    
    현재 가장 널리 사용되는 API 문서 표준이다.
    
    ### 🔹 **속성 / 특징**
    
    - JSON 또는 YAML로 API 명세 작성
    - 경로(`/users`), 메서드(`GET`, `POST`) 등 API 구조를 명확하게 표현
    - 요청(Request) / 응답(Response) / 스키마(Schema) / 보안(Security) 등 포함
    - Swagger UI 뿐만 아니라 ReDoc, Postman 등 다양한 도구에서 지원
    
    ### 🔹 **장점**
    
    - REST API 문서화의 사실상 표준
    - 다양한 생태계 도구와 호환
    - 문서를 기반으로 코드 자동 생성 가능
    - API 계약(Contract) 기반 개발을 할 수 있도록 지원
    
    ### 🔹 **단점**
    
    - 초보자에게 문법(YAML/JSON)이 복잡하게 느껴질 수 있음
    - 큰 프로젝트에서 관리 비용 증가
    - 단순 문서 표준이라 실행 로직은 직접 구현해야 함
- OpenAPI Component
    
    ### 🔹 **정의**
    
    OpenAPI의 `components`는 **API 문서에서 재사용 가능한 요소들의 집합**이다.
    
    일종의 “공용 컴포넌트 저장소”라고 보면 된다.
    
    여기에는 다음 항목들 포함됨:
    
    - `schemas` (DTO, 데이터 모델)
    - `parameters` (header, query, path 파라미터)
    - `responses` (공통 응답 구조)
    - `requestBodies` (공통 요청 구조)
    - `securitySchemes` (JWT 등 인증 방식)
    - `headers`
    - `examples`
    - `links`
    
    ### 🔹 **역할**
    
    - 반복되는 구조를 모아서 **재사용**
    - 문서 중복 최소화
    - 유지보수성 증가
    - 스키마 정의를 중앙화하여 API 문서 품질 향상
    
    위 구조처럼 `/components/schemas/User`를 재사용할 수 있다.
    
    ### 🔹 **장점**
    
    - 문서가 클수록 components의 효용이 커짐
    - 타입/스키마를 일괄 관리해 오류 감소
    - API 요청·응답 구조가 일관성을 가짐
    
    ### 🔹 **단점**
    
    - 컴포넌트가 많아지면 파일 구조가 복잡해짐
    - 잘못 설계하면 오히려 관리가 어려워짐