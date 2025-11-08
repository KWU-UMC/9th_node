1. 기존에 구현했던 API의 Repository 함수들을 모두 Prisma ORM을 이용하도록 변경해주세요.
    
    했어염
    
2. 내 리뷰 조회
    
    GET
    
    ![image.png](attachment:b65db8cf-b0e5-4646-b390-a9f41e4ad7da:image.png)
    
    cursor를 1로 설정했을 때
    
    ![image.png](attachment:c9156a93-acd1-4ce0-b554-6ea8e0e639c8:image.png)
    
3. 특정 가게 미션 조회하기
    
    ![image.png](attachment:b26fe73e-b58e-42b7-a117-fadef2472ecd:image.png)
    
4. 내가 진행 중인 미션 목록
    
    ![image.png](attachment:20754108-9f51-4c19-a388-5ebe9f22385f:image.png)
    
    데이터가 이런식으로 들어가 있을 때, 내가 진행중인 미션 목록을 조회하기 위해  is_progress가 1인 애들만 조회하게끔 함.
    
    ![image.png](attachment:1bcd9914-d682-4b0c-a373-07864e784a9e:image.png)
    
    user-id를 1로 해서 해당 유저의 미션 중 진행중인 미션만 조회함.
    
5. 내가 진행 중인 미션을 진행 완료로 바꾸기
    
    노진행 → 진행
    
    ![image.png](attachment:ce7d5820-8e51-4453-a493-7d2f33f09062:image.png)
    
    진행 → 완료
    
    ![image.png](attachment:a5e78745-3fc3-4f30-8240-b465bf21a4d5:image.png)