<aside>
💡 주요 내용들을 정리하고, 여러분만의 생각을 통해 정리해보세요!

- 레퍼런스를 참고하여 정의, 속성, 장단점 등을 적어주셔도 괜찮습니다.
- 조사는 공식 홈페이지 **Best**, 블로그(최신 날짜) **Not Bad**
</aside>

- ORM
    
    Object-Relational Mapping
    
    객체와 관계형 데이터베이스의 데이터를 자동으로 매핑해주는 것을 말함.
    
    객체 지향 프로그래밍은 클래스를 사용하고, 관계형 데이터베이스는 테이블을 이용함.
    
    ORM을 통해 객체 간의 관계를 바탕으로 SQL을 자동적으로 생성하여 객체 모델과 관계형 모델 간에 불일치를 해결함.
    
- Prisma 문서 살펴보기
    - ex. Prisma의 Connection Pool 관리 방법
        
        Prisma 자체는 Connection Pool을 직접 관리하지 않고, 대신 사용하는 데이터베이스 드라이버의 connection pool 기능을 사용한다. MYSQL의 경우에는 Prisma가 내부적으로 mysql2 드라이버를 사용한다. .env 파일의 DATABASE_URL에 쿼리 스트링으로 설정할 수 있다. Prisma Client는 애플리케이션 전체에서 단 1번만 생성해야하기 때문에 요청마다 새로 생성하면 Pool 누수와 연결 과다 문제가 생길 수 있기 때문에 주의해야한다.
        
    - ex. Prisma의 Migration 관리 방법
        
        Migration은 데이터베이스 스키마의 버전을 안전하게 관리하고 추적하기 위한 방법이다. 데이터베이스 구조(테이블, 컬럼 등)을 변경하는 코드를 의미한다. Prisma에서 크게 2단계를 거쳐 마이그레이션을 관리한다.
        
        1. prisma/schema.prisma 수정 스키마 파일에서 모델(테이블)을 수정하거나 추가한다.
        2. 명령어로 마이그레이션 생성 및 적용 `npm exec prisma migrate dev` 이 명령어를 수행하여 변경된 스키마를 기반으로 SQL migration 파일을 생성하고, 로컬 DB에 마이그레이션을 자동 적용한다.
- ORM(Prisma)을 사용하여 좋은 점과 나쁜 점
    - 장점
    
    ORM은 데이터베이스 작업을 객체 지향적인 방식으로 처리하게 해준다. 이를 이용하여 개발자는 SQL 쿼리를 작성하는 대신 객체를 이용하여 데이터베이스와 상호작용으로 인해 코드가 간결해지고 개발속도 또한 빨라져 생산성 향상에 도움이 된다.
    
    - 단점
    
    ORM은 추상화된 레이어를 추가하므로 직접 SQL 쿼리를 작성하는 것보다 성능이 떨어지며 복잡한 쿼리나 대량 데이터 처리 시 성능 문제가 발생할 수 있다.
    
- 다양한 ORM 라이브러리 살펴보기
    
    **ex. Sequelize**
    
    Sequelize는 JavaScript/TypeScript에서 사용하는 Node.js에서 가장 오래되고 널리 쓰이는 ORM 중 하나이다. Sequlize의 특징으로는 모델 정의를 코드에서 직접해주어야하고, 쿼리 작성은 체인 기반 ORM 스타일로 작성한다는 것이 있다. Prisma에 비해 타입 지원이 불안전하고, 마이그레이션을 sequelize-cli를 통해 수동 스크립트로 작성해야한다는 단점이 있지만 사용 난이도가 비교적 간단하고 오래된 만큼 문서의 양이 방대하고 커뮤니티가 활발하다는 장점을 갖고있다.
    
    **ex. TypeORM**
    
    TypeORM은 node.js에서 실행되고 typeScript로 작성된 객체 관리형 매퍼 라이브러리이다. Entity 클래스 중심이고 TypeScript에 최적화되어 데코레이터(Entity, Column)으로 모델을 정의한다는 특징을 가진다. 또한 NestJS와의 호환이 뛰어나다. 타입 안정성과 마이그레이션 평의성 및 관계 설정이 Prisma보다 불편하다는 단점을 갖고있다.
    
- 페이지네이션을 사용하는 다른 API 찾아보기
    - ex. https://docs.github.com/en/rest/using-the-rest-api/using-pagination-in-the-rest-api?apiVersion=2022-11-28
        
        서비스에서 한 번에 모든 데이터를 모두 보낸다면 작업의 속도가 굉장히 느려지고 서버에도 부담이 커질 것이다. 그렇기 때문에 데이터 전체를 보내지 않고, 데이터의 일부만 보내는 페이지네이션이라는 방식을 사용한다.
        
        GitHub에서는 per_page와 page 쿼리 파라미터 방식을 널리 사용하는데 per_page는 한 번에 받을 항목 개수(최대 100개), page는 몇 번째 페이지를 요청할지를 의미한다. ex) ?per_page=10&page=1 → 첫 번째 페이지의 10개를 불러온다.
        
        Link 헤더에 next, prev, last, first 같은 링크들이 있어서 API 요청을 보낼 때 응답 헤더에 다음 요청 주소를 같이 보내서 다음 페이지 여부를 알려줄 수 있다.
        
    - ex. https://developers.notion.com/reference/intro#pagination
        
        Notion API은 Cursor 기반의 Pagination 방식을 주로 사용한다. start_cursor는 “어디서부터 시작할지”를 알려주는 포인터이고, has_more는 다음 데이터가 더 있는지를 알려주는 boolean 값이다. next_cursor는 다음 요청에서 사용할 수 있는 start_cursor 값을 의미한다. 요청을 하면 기본적으로 100개의 데이터를 주고, start_cursor부터 데이터를 전달하고 has_more가 false가 될 때 까지 next_cursor를 start_cursor로 변경하여 데이터를 계속 전달하는 방식을 사용한다.