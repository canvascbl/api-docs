# Users

These APIs let you get information about users.

You can always use `self` in place of a user's ID to get results for the
calling user.

## User Profile (CanvasCBL)

> Get your own user profile

```shell
curl \
  -X GET \
  -H "Authorization: ilovecanvascbl" \
  "<%= api_base_url %>/api/v1/users/self/profile?\
include[]=extra_info"
```

```javascript
const profileRequest = await axios({
  method: "GET",
  url: "<%= api_base_url %>/api/v1/users/self/profile",
  headers: {
    "Authorization": "Bearer ilovecanvascbl"
  },
  params: {
    include: [
      'extra_info'
    ]
  }
});
```

> Your user profile

```json
{
  "profile": {
    "id": 1,
    "name": "Example Student",
    "email": "student@example.com",
    // only included with ?include[]=extra_info
    "lti_user_id": "averylongstringofnumb3rsandl3tt3rsyoushouldgooglethis",
    "canvas_user_id": 123,
    // CanvasCBL internal-- don't really use this for anything
    // only included with ?include[]=extra_info
    "status": 0
  }
}
```

Get a bit of info about a user from CanvasCBL.

### Endpoint

`GET /api/v1/users/:userID/profile`

### Scopes

- `user_profile`

### Query String

| Param | Example Value | Description |
| ----- | ------------- | ----------- |
| `include[]` | `extra_info` | See the example response. Adds fields that are useful once in a while. |

### Description

Sometimes, you just want to know a bit about a user. This endpoint is for
exactly that.

Note that this is a user's profile on CanvasCBL. It may not be completely
up-to-date with their Canvas profile, but it should be close enough for
almost every purpose.

At the moment, users are only authorized to view their own profile.