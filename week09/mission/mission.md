# 1️⃣ 하드 코딩 부분 수정

해당 없음

---

# 2️⃣ 이미 존재하는 사용자도 정보 갱신 가능

```jsx
export const getUserByEmail = async (email) => {
  return prisma.user.findUnique({ where: { email } });
};

export const updateUser = async (userId, data) => {
  const user = await prisma.user.findUnique({ where: { id: userId } });
  if (!user) {
    throw new NotFoundError("사용자를 찾을 수 없습니다.");
  }
  await prisma.user.update({ where: { id: userId }, data });
};

export const deleteUserPreferences = async (userId) => {
  await prisma.userFavorCategory.deleteMany({ where: { userId } });
};
```

user.repository.js

```jsx
export const userSignUp = async (data) => {
  const existingUser = await getUserByEmail(data.email);
  let userId;

  if (existingUser) {
    await updateUser(existingUser.id, {
      name: data.name,
      gender: data.gender,
      birth: data.birth,
      address: data.address,
      detailAddress: data.detailAddress,
      phoneNumber: data.phoneNumber,
    });
    await deleteUserPreferences(existingUser.id);
    userId = existingUser.id;
  } else {
    userId = await addUser({
      email: data.email,
      name: data.name,
      gender: data.gender,
      birth: data.birth,
      address: data.address,
      detailAddress: data.detailAddress,
      phoneNumber: data.phoneNumber,
    });
  }

  for (const preference of data.preferences) {
    await setPreference(userId, preference);
  }

  const user = await getUser(userId);
  const preferences = await getUserPreferencesByUserId(userId);
  const access_token = generateAccessToken(user);
  const refresh_token = generateRefreshToken(user);

  return responseFromUser({
    user: { ...user, access_token, refresh_token },
    preferences,
  });
};
```

user.service.js

```jsx
export const responseFromUser = ({ user, preferences }) => {
  if (!user) throw new NotFoundError("사용자 정보를 찾을 수 없습니다.");

  const preferFoods = (preferences ?? [])
    .map((preference) => preference.foodCategory?.name ?? preference.name)
    .filter(Boolean);

  return {
    access_token: user.access_token,
    refresh_token: user.refresh_token,
    profile: {
      email: user.email,
      name: user.name,
      preferCategory: preferFoods,
    },
  };
};
```

user.dto.js

---

# 3️⃣ JWT를 기존 API들에 적용 (로그인한 사용자만 쓸 수 있도록)

```jsx
import jwt from "jsonwebtoken";
import { prisma } from "../configs/db.config.js";
import { asyncHandler } from "../utils/async-handler.js";
import { UnauthorizedError } from "../utils/errors.js";

export const requireAuth = asyncHandler(async (req, res, next) => {
  const raw = (req.get("Authorization") ?? "").trim();
  const parts = raw.split(/\s+/).filter(Boolean);
  const token = parts.length > 1 ? parts[parts.length - 1] : parts[0];
  if (!token) throw new UnauthorizedError("Authorization 헤더가 필요합니다.");

  const secret = process.env.JWT_SECRET;
  if (!secret) throw new UnauthorizedError("서버 JWT 설정이 되어 있지 않습니다.");

  let payload;
  try { payload = jwt.verify(token, secret); }
  catch { throw new UnauthorizedError("유효하지 않은 토큰입니다."); }

  const user = await prisma.user.findUnique({ where: { id: payload.id } });
  if (!user) throw new UnauthorizedError("사용자 정보를 찾을 수 없습니다.");

  req.user = user;
  next();
});
```

auth.middleware.js