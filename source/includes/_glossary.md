# Glossary

The glossary contains definitions for terms that may not be clear throughout the documentation.

## Developer Key

> Client ID

```text
d262d1d3-d969-4d48-ac1e-cfceec88b5c9
```

> Client Secret

```text
d262d1d3-d969-4d48-ac1e-cfceec88b5c9
```

A Client ID/Client Secret combo. These are granted, upon request and review, by CanvasCBL alone.

They may never be shared or posted publicly.

## OAuth2 Credential

Another term for a [Developer Key](#developer-key).

## OAuth2 Grant

An OAuth2 Grant is a Access/Refresh Token combo. They are linked to a Redirect URI, a number of scopes, and a [Developer Key](#developer-key).

You can see an example grant response in the [Token request documentation](#token).

## OAuth2 Redirect URI

> Example Redirect URI

```text
https://dcraft.com/oauth2/response
```

Where users will be sent after accepting/denying your OAuth2 Request.

## Access Token

Short-lived tokens that **grant access to resources**. Currently, they last an hour.

They can be regenerated with a [Refresh Token](#refresh-token).

## Refresh Token

Long-lived tokens that can be used, along with some other information, to get new [Access Tokens](#access-token).

## Auto-pagination

Throughout the docs, you might see that an endpoint says it's "auto-paginated".

Canvas employs a system of pagination that limits how many objects can be returned
during a single API call. You can read more about that [here](https://canvas.instructure.com/doc/api/file.pagination.html).

The CanvasCBL API will automatically paginate responses from Canvas,
meaning that **every single resource requested will be returned**.
This comes at a performance cost, but that's ok because you often
need all resources.

Some endpoints that use auto-pagination allow you to specify the object
IDs you want returned. You can use those systems to limit the number of
objects requested, therefore lowering the request time and response
size.

## Cached Data

Throughout the docs, you might see a reference to "cached data".

This means that the CanvasCBL API is not fetching the data on-demand from
Canvas. It is using the CanvasCBL cache, which is updated about hourly.
Additionally, some endpoints may let you choose whether you would like to
pull from the CanvasCBL cache. Using the cache can speed up large requests
(>100 results) by about 5x.

We tend to use the cache in the following scenarios:

- When requesting large amounts of data, like almost anything for an entire class
- When the endpoint does not require immediately-updated data
(like [get profile (CanvasCBL)](#user-profile-canvascbl))
- When the request would take an unreasonable amount of time to fetch from Canvas
