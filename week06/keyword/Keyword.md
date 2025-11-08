- ORM
    
    **정의:**
    
    ORM은 객체 지향 프로그래밍 언어에서 사용하는 객체(Object)와 관계형 데이터베이스의 테이블(Table)을 자동으로 매핑해주는 기술이다.
    
    즉, SQL 쿼리를 직접 작성하지 않고 객체(클래스) 단위로 DB 작업을 수행할 수 있게 해준다.
    
    **특징:**
    
    - 객체지향적 사고방식으로 데이터베이스 접근
    - 데이터베이스 테이블 구조를 코드(Entity/Model)로 추상화
    - SQL 대신 고수준 API 사용 (ex. `User.findMany()`)
    
    **장점:**
    
    - 생산성 향상: 반복적인 SQL 작성 감소
    - 유지보수 용이: 스키마 변경 시 코드 레벨에서 추적 가능
    - DB 독립성: ORM이 DB 추상화를 제공 → MySQL → PostgreSQL 교체 용이
    
    **단점:**
    
    - 복잡한 쿼리(조인, 서브쿼리)는 비효율적
    - 성능 저하: ORM 내부에서 SQL을 자동 생성할 때 불필요한 쿼리 발생 가능
    - 러닝 커브: ORM 고유 문법/DSL 이해 필요
- Prisma 문서 살펴보기
    - ex. Prisma의 Connection Pool 관리 방법
        - Prisma는 내부적으로 **Data Proxy 또는 Query Engine*를 통해 커넥션 풀링을 수행한다.
        - **Connection Pooling**은 DB 연결을 재사용하여 성능을 높이는 기법으로, 각 요청마다 새 연결을 여는 대신 기존 연결을 재사용한다.
        - 기본적으로 **`DATABASE_URL`** 환경변수에서 제공된 DB 드라이버가 커넥션 풀링을 처리한다.
        - 예시:
            
            ```bash
            DATABASE_URL="mysql://user:password@localhost:3306/mydb?connection_limit=10"
            ```
            
            → `connection_limit` 파라미터로 최대 연결 개수를 제한할 수 있다.
            
        - 대규모 서버 환경에서는 **PgBouncer**나 **Neon Data Proxy** 등 외부 풀링 솔루션과 병행 사용을 권장한다.
    - ex. Prisma의 Migration 관리 방법
        - Prisma는 스키마(`schema.prisma`)를 기반으로 DB 구조를 자동 동기화한다.
        - 주요 명령어:
            
            ```bash
            npx prisma migrate dev --name init
            npx prisma migrate deploy
            npx prisma db push
            ```
            
        - **`migrate dev`**: 로컬 개발 환경에서 DB에 실제 마이그레이션 파일 생성 및 적용
        - **`migrate deploy`**: 배포 환경에서 이미 생성된 migration 파일을 실행
        - **`db push`**: 빠르게 스키마를 동기화하되, migration 파일은 생성하지 않음 (임시 작업용)
        
        **장점:** DB 스키마 변경이 코드와 버전으로 관리됨 → 협업 및 배포 시 안정적
        
        **단점:** 스키마와 실제 DB가 일시적으로 불일치할 수 있음 (특히 수동 수정 시)
        
- ORM(Prisma)을 사용하여 좋은 점과 나쁜 점
    
    
    | 구분 | 장점 | 단점 |
    | --- | --- | --- |
    | 코드 생산성 | 타입 자동 생성, 쿼리 자동화 | 직접 SQL 제어가 어려움 |
    | 안정성 | 스키마 기반, 마이그레이션 관리 | Migration 충돌 가능성 |
    | 성능 | 일반 CRUD 최적화 | 대규모 조인/집계는 비효율적 |
    | 개발 편의성 | 타입 지원, 자동 완성 | ORM 문법 학습 필요 |
- 다양한 ORM 라이브러리 살펴보기
    
    
    | 라이브러리 | 언어 | 특징 |
    | --- | --- | --- |
    | **Prisma** | Node.js | 스키마 기반, 타입 안전성, 최신형 ORM |
    | **TypeORM** | Node.js | Active Record / Data Mapper 패턴 지원 |
    | **Sequelize** | Node.js | 오래된 전통 ORM, 문법 간결하지만 타입 안정성 부족 |
    | **Hibernate** | Java | 가장 대표적인 ORM, JPA 구현체 |
    | **SQLAlchemy** | Python | 풍부한 API, 복잡한 쿼리 제어 가능 |
    | **Django ORM** | Python | 프레임워크 내장 ORM, 모델 선언 기반 |