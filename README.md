# Bajaj Finserv Health | Qualifier 1 | JAVA

This Spring Boot app runs automatically on startup:
1. Calls `generateWebhook` to get a unique webhook URL and JWT access token.
2. Picks the SQL question based on the last two digits of your `regNo`.
3. Submits your **final SQL query** to the webhook with the JWT in the `Authorization` header.

## Configure
Edit `src/main/resources/application.yml`:
```yaml
app:
  name: "YOUR NAME"
  regNo: "REG12XX"
  email: "you@example.com"
  bearerPrefix: ""   # or "Bearer "
```

> If the platform expects `Authorization: <accessToken>`, leave `bearerPrefix` empty (default).
> If it expects `Authorization: Bearer <accessToken>`, set `bearerPrefix` to `"Bearer "`.

Paste your SQL into:
- `SqlSolutions.QUESTION1_SQL` for odd last-two digits
- `SqlSolutions.QUESTION2_SQL` for even last-two digits

## Build
```bash
mvn -q -e -DskipTests package
```

## Run
```bash
java -jar target/bfh-java-qualifier-1.0.0.jar
```

The app writes your SQL to `finalQuery.sql` locally before submitting.

## Notes
- Uses `RestTemplate` and runs via `CommandLineRunner` (no controllers).
- Submits `{"finalQuery": "<SQL>"}` as JSON with `Authorization` header set to the received token.
