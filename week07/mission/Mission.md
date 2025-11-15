## 할 일

- [x]  표준 응답 규격: 기존에 이미 어느 정도 생각하고 있던 부분이라 헬퍼함수만 지정 필요
- [x]  에러 핸들링: 실습 + Error 던지기

## 헬퍼 함수 지정

```jsx
//헬퍼 함수 지정
app.use((req, res, next) => {
  res.success = (data, statusCode = StatusCodes.OK) => {
    return res.status(statusCode).json({
      success: true,
      code: statusCode,
      data,
    });
  };

  res.error = ({
    statusCode = 500,
    errorCode = "unknown",
    reason = null,
    data = null,
  } = {}) => {
    return res.status(statusCode).json({
      success: false,
      code: errorCode,
      reason,
      data,
    });
  };

  next();
});

//에러 핸들링
app.use((err, req, res, next) => {
  if (res.headersSent) {
    return next(err);
  }

  res.status(err.statusCode || 500).error({
    errorCode: err.errorCode || "unknown",
    reason: err.reason || err.message || null,
    data: err.data || null,
  });
});
```

## ERROR 던지기

<img width="675" height="187" alt="image" src="https://github.com/user-attachments/assets/fe498176-b94a-4ba4-bff5-1c7e97894bc1" />
