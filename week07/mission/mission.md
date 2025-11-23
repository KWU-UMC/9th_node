![image.png](attachment:27084a4a-1817-4b3c-bfc4-77e680ed9439:image.png)

![image.png](attachment:1db38a13-d835-4e5b-8fe2-f6cb584f1fa9:image.png)

![image.png](attachment:6c292aa5-8cf7-4b0f-9021-d6fbc282484a:image.png)

미들웨어가 무엇인가

Express에서 요청(req)과 응답(res) 사이에 끼워 넣는 함수들.

app.use((req, res, next) => { ...; next(); }) 형태로 등록하고, 순차적으로 실행되며 필요하면 응답을 끝내거나 next()로 다음 단계로 넘김.

공통 로깅, 인증, 파서(express.json), 쿠키 파서, 정적 파일 제공, 에러 처리 등을 각각 독립 함수로 두고 체인처럼 묶어두는 것임

- morgan: 요청 로그 미들웨어
- cookieParser: 쿠키를 req.cookies 로 파싱
- express.json, express.urlencoded: 바디 파싱 미들웨어
- 커스텀 404 핸들러와 errorHandler: 라우트 이후 실행되는 에러 처리 미들웨어

![image.png](attachment:b92a70fa-a400-4088-883d-7fc5d3ea8bce:image.png)

에러 미들웨어는 서버 라우팅 체인 맨 끝에 붙어서 모든 예외를 한 번에 처리하는 안전장치이이다. 먼저 AppError 계열인지 확인해서, 우리가 의도적으로 던진 에러라면 그대로 쓰고, 그렇지 않으면 new AppError 로 감싸서 메시지·상태코드를 표준 형태로 바꿔준다. 개발 모드에서는 원본 스택을 details 로 남기고 console.error 로 로그를 찍지만, 운영 모드에서는 메시지만 노출하도록 구분했다. 최종적으로 { success: false, code, message } 구조의 JSON을 내려주기 때문에, 컨트롤러 어디에서 오류가 나도 클라이언트는 동일한 실패 응답 포맷을 받을 수 있다.