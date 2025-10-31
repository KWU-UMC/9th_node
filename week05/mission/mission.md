**1. 특정 지역에 가게 추가하기 API**

![Image](https://private-user-images.githubusercontent.com/156819279/438709786-a136bd68-2c70-4161-9d0d-28dfde3518f7.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NjE4ODkzMDksIm5iZiI6MTc2MTg4OTAwOSwicGF0aCI6Ii8xNTY4MTkyNzkvNDM4NzA5Nzg2LWExMzZiZDY4LTJjNzAtNDE2MS05ZDBkLTI4ZGZkZTM1MThmNy5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUxMDMxJTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MTAzMVQwNTM2NDlaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT02OTMzNDUzNDcwYjcyMjFkZjUwNDY1MDZhNmI3YzlmNTQzZWEyZTEyYWIzNmY4OTRjODM3MjFiMGViNTY0ZTllJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.k-3AxYEXRj5Ve20n-HmXlvQs4hYj3V6CSaZynOhLBJM)

| **항목** | **값** |
| --- | --- |
| Method | POST |
| URL | http://localhost:3000/stores |
| Headers | [Key] Content-Type [Value] application/json |
| Headers | [Key] Authorization [Value] Bearer testtoken |
| Body | {"name": "김밥천국 강남점","address": "서울시 강남구 어딘가","regionId": 3} |

**2. 가게에 리뷰 추가하기 API**

![Image](https://private-user-images.githubusercontent.com/156819279/438709282-7a4de01e-c03e-4dce-aea7-6096dc830d80.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NjE4ODkzMDksIm5iZiI6MTc2MTg4OTAwOSwicGF0aCI6Ii8xNTY4MTkyNzkvNDM4NzA5MjgyLTdhNGRlMDFlLWMwM2UtNGRjZS1hZWE3LTYwOTZkYzgzMGQ4MC5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUxMDMxJTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MTAzMVQwNTM2NDlaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT01ZDVhYTRmMWFjYTBmOGQ5ODI5MGE2ZjRhMGI1NDVlMjE0NWUwODBjNjZjZGRjOThjZjYyM2QwMzg3MGRkOTlhJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.fHpFwHTjUDOWuPw18nMPYfAhFRzhbfZT2kPA4wOM-5E)

| **항목** | **값** |
| --- | --- |
| Method | POST |
| URL | http://localhost:3000/reviews |
| Body | {"memberId": 3,"storeId": 10,"body": "음식이 정말 맛있었어요!","score": 5} |

**3. 가게에 미션 추가하기 API**

![Image](https://private-user-images.githubusercontent.com/156819279/438710701-a7a13961-8b0f-471f-9a8f-bfeba5ad0510.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NjE4ODkzMDksIm5iZiI6MTc2MTg4OTAwOSwicGF0aCI6Ii8xNTY4MTkyNzkvNDM4NzEwNzAxLWE3YTEzOTYxLThiMGYtNDcxZi05YThmLWJmZWJhNWFkMDUxMC5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUxMDMxJTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MTAzMVQwNTM2NDlaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT04MjE0OTgwOTYxMDAwZjkwZGUzOTYwNmZhNmJlNTBmZTEzOTQ4MGE1YzE3YWU0YTNhM2NiNTJkMWE1Njk4MGJkJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.emuyU-Lng5DI--zx9D8P-J_CXwRC8tdJwUf1zNvhf2k)

| **항목** | **값** |
| --- | --- |
| Method | POST |
| URL | http://localhost:3000/stores/10/missions |
| Headers | [Key] Content-Type [Value] application/json |
| Headers | [Key] Authorization [Value] Bearer testtoken |
| Body | {"title": "10,000원 이상 주문하기","category": "한식","reward": "500 포인트"} |

**4. 가게의 미션을 도전 중인 미션에 추가(미션 도전하기) API**

![Image](https://private-user-images.githubusercontent.com/156819279/438711467-622b1eb8-224b-464e-8c9f-a653f215098b.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NjE4ODkzMDksIm5iZiI6MTc2MTg4OTAwOSwicGF0aCI6Ii8xNTY4MTkyNzkvNDM4NzExNDY3LTYyMmIxZWI4LTIyNGItNDY0ZS04YzlmLWE2NTNmMjE1MDk4Yi5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUxMDMxJTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MTAzMVQwNTM2NDlaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT04NTQ4OGJjMGU0NWFiNWI5Y2E0NTVmMjEyN2Y1YjZmMDRlNTQ0MTAwNGE0MWQyODAxYTk0ZjVhYjFjOGI5MjlkJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.6AW95pnwwhKfBX0hagEr0b8atXrRnti-xR0TmqHrLS0)

| **항목** | **값** |
| --- | --- |
| Method | POST |
| URL | http://localhost:3000/member-missions |
| Headers | [Key] Content-Type [Value] application/json |
| Headers | [Key] Authorization [Value] Bearer testtoken |
| Body | {"memberId": 3,"missionId": 7} |