- ES
    - ECMAScript의 약자. 자바스크립트의 명세(표준) 이름이 ECMAScript이다.
    - 브라우저나 JS 엔진들이 이 표준을 구현함.
    - 예: ES5, ES6, ES2016, ES2020 등 버전별 진화.
- ES6
    - ES6의 주요 변화 및 특징
        
        ES6는 자바스크립트의 큰 변화가 있었던 버전이며, 코드 가독성과 기능 확장을 많이 도입함. 대표적인 특징은 아래와 같다:
        
        | 기능 | 설명 / 장점 |
        | --- | --- |
        | `let`, `const` | 블록 스코프 변수를 사용할 수 있게 함. var의 함수 스코프 한계를 보완 |
        | 화살표 함수 (Arrow Function) | 간결한 문법 + `this` 바인딩 방식 개선 [끄적+4F-Lab : 상위 1% 개발자들의 멘토링+4zetawiki.com+4](https://f-lab.kr/insight/modern-javascript-and-ecmascript-6-features?utm_source=chatgpt.com) |
        | 클래스 (class) 문법 | 기존 프로토타입 기반 상속을 문법적으로 표현 가능 |
        | 템플릿 리터럴 (Template Literals) | 백틱(`) 사용, 문자열 내 변수 표현식 삽입, 멀티라인 문자열 가능 [끄적+1](https://itsurvival.tistory.com/33?utm_source=chatgpt.com) |
        | 디스트럭처링 할당 (Destructuring) | 배열이나 객체 값을 구조분해하여 변수에 쉽게 할당 가능 [끄적+2F-Lab : 상위 1% 개발자들의 멘토링+2](https://itsurvival.tistory.com/33?utm_source=chatgpt.com) |
        | 기본 매개변수 (Default Parameters) | 함수 인자에 기본값 지정 가능 [끄적](https://itsurvival.tistory.com/33?utm_source=chatgpt.com) |
        | 스프레드 연산자 / 나머지 매개변수 | 배열/객체 펼치기, 나머지 인자 모음 등 처리 간편 |
        | 모듈 (Module) | `import` / `export` 구문 도입 → 모듈화 가능 [daleseo.com+3eatthefrog+3time to wander+3](https://eatthefrog.tistory.com/6?utm_source=chatgpt.com) |
        | Map, Set, WeakMap, WeakSet 등 자료구조 | 더 다양한 자료구조 지원 [F-Lab : 상위 1% 개발자들의 멘토링+2zetawiki.com+2](https://f-lab.kr/insight/modern-javascript-and-ecmascript-6-features?utm_source=chatgpt.com) |
        | 이터러블 / 제너레이터 / Symbol / 프로미스 등 | 비동기 처리, 반복자 패턴 등 기능 강화 [honbabzone.com+2F-Lab : 상위 1% 개발자들의 멘토링+2](https://honbabzone.com/javascript/javascript-ecmascript6/?utm_source=chatgpt.com) |
    - ES6를 중요시 하는 이유
        - 모던 프레임워크 (React, Vue, Angular 등) 및 라이브러리들이 ES6+ 문법을 기준으로 코드가 작성됨
        - 유지보수성, 가독성 향상
        - 모듈화를 통한 코드 분리 및 의존성 관리가 용이
        - 최신 브라우저 및 JS 엔진에서 ES6 기능 대부분을 지원 → 점점 ES6 기반 코드가 표준이 됨
        - 하위 버전과의 호환성을 고려하면서 점진적 마이그레이션 가능
- ES Module
    
    ES6에 도입된 모듈 시스템이자 표준 방식이다.
    
    기존 스크립트 로딩 방식의 한계 (전역 오염, 파일 순서 문제 등)를 개선한 방식이다.
    
    ### 특징 및 동작 방식
    
    - `export`, `import` 키워드 사용 [판교너굴맨의 개발노트+5time to wander+5daleseo.com+5](https://zubetcha.tistory.com/entry/Javascript-ES-Module?utm_source=chatgpt.com)
    - 모듈은 기본적으로 엄격 모드(strict mode)로 동작
    - 모듈 간 의존성 관계를 명확히 선언할 수 있음
    - 브라우저에서는 `<script type="module">` 로 로드
    - Node.js 환경에서는 `.mjs` 확장자 또는 `package.json` 에 `"type": "module"` 설정 필요 [time to wander+4daleseo.com+4daleseo.com+4](https://www.daleseo.com/js-node-es-modules/?utm_source=chatgpt.com)
    - 트리 쉐이킹(tree shaking)이 가능 → import 하지 않은 코드는 번들에 포함되지 않게 최적화 가능
    - 동적 `import()` 지원 → 런타임에 모듈을 비동기로 로딩 가능 [로그의 죄니](https://jobreview.tistory.com/189?utm_source=chatgpt.com)
    
    ### CommonJS vs ES Module
    
    - CommonJS: `require()`, `module.exports` 방식, 동기 방식 모듈 로딩 [daleseo.com+3스파킷 - SparkIT+3묵마의 블로그+3](https://sparkit.tistory.com/25?utm_source=chatgpt.com)
    - ES Module: `import/export`, 비동기 로딩, 더 유연하고 최적화 가능
    - Node.js에서는 점진적으로 ESM 지원이 확대 중임 [daleseo.com+3daleseo.com+3스파킷 - SparkIT+3](https://www.daleseo.com/js-node-es-modules/?utm_source=chatgpt.com)
- 프로젝트 아키텍처
    - 프로젝트 아키텍처가 중요한 이유
        - 유지보수성: 코드 구조가 명확하면 수정/확장이 쉬움
        - 재사용성: 공통 기능을 모듈화해서 여러 부분에서 사용
        - 책임 분리 (Separation of Concerns): 각 계층 또는 컴포넌트가 자신의 역할만 담당
        - 테스트 용이성: 각 계층/모듈을 독립적으로 테스트 가능
        - 확장성 & 유연성: 요구 변화에 대응하기 쉬움
        - 팀 협업: 역할 분담이 명확해지고 코드 컨벤션이 지켜지기 쉬움
    - Service-Oriented Architecture(Service Layer Pattern)
        - 서비스 지향 아키텍처 (SOA, Service-Oriented Architecture)는 큰 시스템을 여러 서비스 단위로 나누어 구성하는 방식
        - 각 서비스는 독립적으로 배포되고 통신하며, 느슨한 결합(loose coupling)을 지향
        - 마이크로서비스 아키텍처도 SOA의 영향을 받은 구조 중 하나
        - 서비스 레이어 패턴은 애플리케이션 내부에서 “비즈니스 로직 처리 계층 (Service Layer)”를 별도로 두는 패턴
            - 컨트롤러 → 서비스 → 데이터 접근 계층 (DAO/Repository) 순으로 책임 분리
            - 서비스 계층이 트랜잭션 관리, 비즈니스 규칙 처리 등 중심 역할
            - 컨트롤러는 요청 처리 및 응답 제어, 데이터 유효성 검사 등
            - 데이터 접근 계층은 DB 조회/저장 등 처리
        - 이 구조는 코드 중복 방지, 유지보수성과 가독성 확보에 유리
    - MVC 패턴
        - MVC: Model, View, Controller의 세 역할로 분리하는 패턴
            - **Model**: 데이터 구조 및 비즈니스 상태
            - **View**: 사용자 인터페이스, 화면 표시
            - **Controller**: 사용자 입력을 받고 처리하며, Model과 View 간 중재자 역할
        - 웹 애플리케이션에서 많이 사용됨
        - 단점 및 보완: 비즈니스 로직이 Controller에 몰릴 수 있어 코드 복잡해짐 → Service 계층 같이 별도 계층 도입
        - MVC 패턴 안에서도 Model을 더 세분화 (엔티티, 도메인 모델, DTO 등)
    - 그 외 다른 프로젝트 구조
        - 계층형 (Layered) 아키텍처: 프리젠테이션, 비즈니스, 데이터 접근 계층 등으로 구분 (3‑계층 구조) [T_era](https://t-era.tistory.com/213?utm_source=chatgpt.com)
        - 클린 아키텍처 (Clean Architecture)
            - 비즈니스 규칙/도메인 중심, 외부 의존성을 내부로부터 분리
            - 의존성 규칙: 외부가 내부를 참조할 수 없고 내부가 외부를 참조할 수 있게 설계 [aslog.kr](https://www.aslog.kr/clean-architecture?utm_source=chatgpt.com)
            - 계층: 엔티티 → 유스케이스 / 인터페이스 어댑터 → 프레임워크/드라이버
        - 헥사고날 아키텍처 (Hexagonal / Ports & Adapters)
            - 내부 도메인 로직과 외부 인터페이스(웹, DB, 메시지 등)를 포트/어댑터 구조로 분리
        - 수직 슬라이싱 아키텍처 (Vertical Slice)
            - 기능 단위로 모듈 구분: UI → 서비스 → 데이터 흐름이 하나의 슬라이스 단위로 구성
        - 마이크로서비스 아키텍처 (Microservices)
            - 기능 단위를 여러 개의 독립된 서비스로 분리 → 서비스 간 통신 (REST, 메시징 등)
            - 서비스들이 독립 배포 가능
        - 도메인 주도 설계 (DDD, Domain-Driven Design) 기반 아키텍처 (Onion Architecture, Clean, Hexagonal 등 변형)
- 비즈니스 로직
    - 애플리케이션에서 핵심 도메인 규칙, 데이터 처리 흐름, 조건 처리, 계산, 검증 등을 수행하는 로직
    - 사용자 요청 처리 → 단순 CRUD 이상의 규칙, 조건, 계산 등이 필요하면 이 로직에 포함됨
    - 컨트롤러 레벨이 아닌 서비스 또는 도메인 계층에서 책임지는 것이 일반적
    - 예: 사용자의 주문이 특정 조건을 만족해야 한다거나, 점수 계산, 통계 산출 등이 비즈니스 로직
    - 비즈니스 로직은 외부 인프라 (DB, UI, 네트워크 등)와 독립적으로 유지하는 것이 바람직 — 의존성 역전 원칙 등을 활용
- DTO
    - 계층 간 데이터 전송을 위해 사용하는 단순 객체
    - 주 목적은 계층 간 불필요한 의존성을 줄이고, 필요한 데이터만 전달하기 위함
    - 예: 클라이언트 요청 → Controller에서 RequestDTO로 받고 → Service 계층에 전달
    - 응답도 ResponseDTO로 포장하여 클라이언트에 전달
    - DTO와 엔티티(Entity)를 분리하는 이유:
        - 보안/노출 제어: 엔티티 전체를 노출하는 대신 필요한 필드만 DTO로 전달
        - 변경 대응성: 뷰나 API 요구사항이 바뀔 때 엔티티 수정 없이 DTO만 바꾸는 경우
        - 계층 간 결합 최소화
        - 테스트, 직렬화/역직렬화 용이
    - DTO는 일반적으로 로직을 포함하지 않는 단순한 데이터 구조체여야 한다는 관점이 많음
    - 다만 DTO에 유효성 검사를 포함할지 말지는 설계 관점 차이가 있음