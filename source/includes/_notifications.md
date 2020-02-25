# Notifications

These endpoints let you configure notifications for a user.

## List Available Notifications

> List available notifications

```shell
curl \
  -X GET \
  -H "Authorization: ilovecanvascbl" \
  "<%= api_base_url %>/api/v1/notifications/types"
```

```javascript
const listAvailableNotificationsRequest = await axios({
  method: "GET",
  url: "<%= api_base_url %>/api/v1/notifications/types",
  headers: {
    "Authorization": "Bearer ilovecanvascbl"
  }
});
```

> Available notifications

```json
[
  {
    "id": 1,
    "name": "Grade Change",
    // these are unique
    "short_name": "grade_change",
    "description": "A notification when your grade in any class changes."
  }
  // ...
]
```

This endpoint lets you view all available notification types a user can subscribe to.

### Endpoint

`GET /api/v1/notifications/types`

^If you're curious, we're leaving `/api/v1/notifications` open for future expansion
^(listing delivered notifications, for example).

### Scopes

- `notifications`

### Description

List notification types lets you list all of the available notification types for a user.

It does not, however, include the user's notification settings.

## List Notification Settings

> List notification settings

```shell
curl \
  -X GET \
  -H "Authorization: ilovecanvascbl" \
  "<%= api_base_url %>/api/v1/notifications/settings"
```

```javascript
const listNotificationSettingsRequest = await axios({
  method: "GET",
  url: "<%= api_base_url %>/api/v1/notifications/settings",
  headers: {
    "Authorization": "Bearer ilovecanvascbl"
  }
});
```

> Available notifications

```json
{
  "notification_settings": [
    {
      "notification_type_id": 1,
      "medium": "email"
    }
    // ...
  ]
}
```

> List notification settings and types

```shell
curl \
  -X GET \
  -H "Authorization: ilovecanvascbl" \
  "<%= api_base_url %>/api/v1/notifications/settings\
?include[]=notification_types"
```

```javascript
const listNotificationSettingsRequest = await axios({
  method: "GET",
  url: "<%= api_base_url %>/api/v1/notifications/settings",
  headers: {
    "Authorization": "Bearer ilovecanvascbl"
  },
  params: {
    "include": [
      "notification_types"
    ]
  }
});
```

> Notification settings and types

```json
{
  "notification_settings": [
    {
      "notification_type_id": 1,
      "medium": "email"
    }
    // ...
  ],
  "notification_types": [
    {
      "id": 1,
      "name": "Grade Change",
      // these are unique
      "short_name": "grade_change",
      "description": "A notification when your grade in any class changes."
    }
    // ...
  ]
}
```

### Endpoint

`GET /api/v1/notifications/settings`

### Scopes

- `notifications`

### Query String

| Param | Example Value | Description |
| ----- | ------------- | ----------- |
| `include[]` | `notification_types` | Ask for notification types if you want them. |

### Description

List notification settings allows you to list the user's notification settings.

<aside class="notice">
  There is one notification settings object per notification the user has enabled.
</aside>

## Add a Notification

> Enable grade change emails (id 1)

```shell
curl \
  -X PUT \
  -H "Authorization: ilovecanvascbl" \
  "<%= api_base_url %>/api/v1/notifications/types/1\
?medium=email"
```

```javascript
const addNotificationRequest = await axios({
  method: "PUT",
  url: "<%= api_base_url %>/api/v1/notifications/types/1",
  headers: {
    "Authorization": "Bearer ilovecanvascbl"
  },
  params: {
    'medium': 'email'
  }
});
```

> Returns a 204 no content

### Endpoint

`PUT /api/v1/notifications/types/:notificationTypeID`

### Scopes

- `notifications`

### Query String

| Param | Example Value | Description |
| ----- | ------------- | ----------- |
| `medium` | `email` | **Required**. In the future, other mediums may be available. For now, `email` is the only acceptable medium. |

### Description

This endpoint lets you enable or disable a notification for a user.

Because the `PUT` HTTP Verb is idempotent, you can call this endpoint as many
times as you'd like, and only one notification will be created per user.

## Remove a Notification

> Disable grade change emails (id 1)

```shell
curl \
  -X DELETE \
  -H "Authorization: ilovecanvascbl" \
  "<%= api_base_url %>/api/v1/notifications/types/1\
?medium=email"
```

```javascript
const removeNotificationRequest = await axios({
  method: "DELETE",
  url: "<%= api_base_url %>/api/v1/notifications/types/1",
  headers: {
    "Authorization": "Bearer ilovecanvascbl"
  },
  params: {
    'medium': 'email'
  }
});
```

> Returns a 204 no content

### Endpoint

`DELETE /api/v1/notifications/types/:notificationTypeID`

### Scopes

- `notifications`

### Query String

| Param | Example Value | Description |
| ----- | ------------- | ----------- |
| `medium` | `email` | **Required**. In the future, other mediums may be available. For now, `email` is the only acceptable medium. |

### Description

This endpoint lets you enable or disable a notification for a user.

Because the `PUT` HTTP Verb is idempotent, you can call this endpoint as many
times as you'd like, and only one notification will be created per user.
