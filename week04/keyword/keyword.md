## 🎯 핵심 키워드

- ES
    
    JavaScript의 표준 사양(문법, 동작)을 정의한 공식 표준
    
    JavaScript 엔진은 ES 명세를 기반으로 동작함
    
- ES6
    - ES6의 주요 변화 및 특징
        
        ES는 버전 업데이트가 꾸준히 이루어지며 뒤의 숫자가 그 버전을 의미함
        
        ES6(ECMAScript 2015)는 2015년에 발표된 가장 큰 변화가 있었던 버전
        
        새로운 문법과 기능이 대거 추가되어 가독성, 유지보수성, 개발 생산성이 크게 향상됨
        
    - ES6를 중요시 하는 이유
        
        현대 JavaScript의 기반이 되는 핵심 버전
        
        가독성 및 유지보수성 향상: let/const, 클래스, 모듈 도입
        
        대규모 프로젝트 대응력 강화: 모듈화, 객체지향 패턴, 비동기 처리 개선
        
- ES Module
    
    ES6에서 새로 도입된 모듈 시스템
    
    JavaScript 코드를 파일 단위로 분리하고 재사용할 수 있게 해주는 표준 방식
    
- 프로젝트 아키텍처
    - 프로젝트 아키텍처가 중요한 이유
        
        유지보수성 향상
        
        코드 재사용성 증가
        
        협업 시 역할 분리 명확
        
    - Service-Oriented Architecture(Service Layer Pattern)
        
        개념: 비즈니스 로직을 Controller, Repository 등과 분리하여 Service Layer에 모아두는 구조
        
        역할 구분
        
        - Controller: 요청 수신, 데이터 검증, 서비스 호출
        - Service: 비즈니스 로직 처리
        - Repository/DAO: DB 접근
        
        장점: 재사용 가능한 로직 관리, 코드 책임 분리
        
    - MVC 패턴
        
        개념: 애플리케이션을 세 가지 역할(Model, View, Controller)로 나눈 아키텍처 패턴
        
        역할 구분
        
        - Model: 데이터 및 비즈니스 로직 담당
        - View: UI 담당
        - Controller: 사용자 입력 처리, Model과 View 연결 담당
        
        장점: 역할 분리로 유지보수 용이
        
        단점: 프로젝트가 커질수록 Controller 복잡도 증가 가능
        
    - 그 외 다른 프로젝트 구조
        
        
        | 구조 | 설명 |
        | --- | --- |
        | MVVM | ViewModel이 View와 Model을 연결 (React의 상태관리 패턴 유사) |
        | Clean Architecture | 의존성 역전 원칙(DIP)을 적용해 도메인 중심 설계 |
        | Hexagonal Architecture (Ports and Adapters) | 외부 의존성을 최소화하여 테스트 용이성 강화 |
- 비즈니스 로직
    
    정의: 애플리케이션의 핵심 동작 규칙 또는 도메인 규칙을 구현한 코드
    
    위치: 일반적으로 Service Layer에 존재
    
    목적: 기능적 요구사항 구체화, 코드 중복 방지
    
- DTO
    
    정의: 계층 간 데이터 전달만을 위한 순수 데이터 객체 
    
    특징
    
    - 비즈니스 로직 없음 (단순 데이터 보관)
    - Controller ↔ Service ↔ Repository 간 데이터 전달 용도
    - API 요청/응답 시에도 자주 사용됨
    
    장점: 계층 간 결합도 낮춤, 불필요한 데이터 노출 방지


## 🧩 요약 정리

1. Node.js
    - JavaScript 실행 환경, Chrome V8 엔진 위에서 동작
2. Node.js 동작 방식
    - 싱글 스레드: 메인 스레드 하나로 실행
    - 논블로킹 I/O: 작업이 완료되면 콜백/Promise로 결과만 처리
    - 이벤트 루프: 백그라운드에서 완료된 작업을 언제 메인 스레드에 전달할지 관리하는 스케줄러
3. Service-Oriented Architecture
    - Client → Controller → Service → Repository → DB
    - DTO를 통해 데이터를 주고 받음
4. 프로젝트 디렉토리 구조
    
    ```sql
    /project
     ┣ 📂 node_modules   → 설치 라이브러리 (자동 생성)
     ┣ 📂 public         → 정적 파일 (이미지 등)
     ┣ 📂 src
     ┃ ┣ 📂 controllers  → 요청을 처리하는 Controller
     ┃ ┣ 📂 dtos         → DTO 정의 파일
     ┃ ┣ 📂 repositories → DB 접근 코드
     ┃ ┗ 📂 services     → 비즈니스 로직 코드
     ┣ package.json
     ┗ server.js
    
    ```
    