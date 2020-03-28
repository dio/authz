## envoy `ext_authz` demo with `dynamic_forward_proxy` upstream

![image](https://user-images.githubusercontent.com/73152/77819552-84fffa00-70d3-11ea-8418-a86b38a8738e.png)

```
$ make up
$ curl -sSL -H "Host: www.google.com" -D - localhost:8000 -o /dev/null
HTTP/1.1 200 OK
date: Sat, 28 Mar 2020 09:12:29 GMT
expires: -1
cache-control: private, max-age=0
content-type: text/html; charset=ISO-8859-1
p3p: CP="This is not a P3P policy! See g.co/p3phelp for more info."
server: envoy
x-xss-protection: 0
x-frame-options: SAMEORIGIN
set-cookie: 1P_JAR=2020-03-28-09; expires=Mon, 27-Apr-2020 09:12:29 GMT; path=/; domain=.google.com; Secure
set-cookie: NID=201=ltLQGDyq62G57Fyx_-KpGfA8i22Uuo_hiK-sq0oLxkOBHmQCQIz2BLC9Fnrd3xNZ8D_JeZNJvwptEqtZcXU31QPJdZ_NNeFGr11pPqxSFq1eqbkOt-cTa7LpetmkUmXKwp3VQ_nJU4Ll-yJ89Z4XBIpY6zLRGI7KXLX3gd4lCHA; expires=Sun, 27-Sep-2020 09:12:29 GMT; path=/; domain=.google.com; HttpOnly
accept-ranges: none
vary: Accept-Encoding
x-envoy-upstream-service-time: 110
transfer-encoding: chunked
$ docker-compose logs authz
authz_1  | 2020/03/28 09:00:37 {"attributes":{"source":{"address":{"socketAddress":{"address":"172.27.0.1","portValue":51200}}},"destination":{"address":{"socketAddress":{"address":"172.27.0.3","portValue":8000}}},"request":{"time":"2020-03-28T09:00:37.025781Z","http":{"id":"8354358887259312769","method":"GET","headers":{":authority":"www.google.com",":method":"GET",":path":"/","accept":"*/*","user-agent":"curl/7.68.0","x-forwarded-proto":"http","x-request-id":"0e15660d-0eae-4ef4-8f69-3b786392b79c"},"path":"/","host":"www.google.com","protocol":"HTTP/1.1"}},"metadataContext":{}}}

```