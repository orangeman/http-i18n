
test = require "tape"

i18n = require "./"


test "default return en", (t)  ->
  req = url: "foo", headers: {}
  t.equal i18n(req), "en"
  t.end()

test "lang url param", (t)  ->
  req =
    url: "http://foo.bar/baz?lang=de&bar=baz"
    headers: {}
  t.equal i18n(req), "de"
  t.end()

test "lang http header", (t)  ->
  req =
    url: "http://foo.bar/baz?bar=baz"
    headers: "accept-language": "de-DE,en-US;q=0.9,fr-CA;q=0.7,en;q=0.8"
  t.equal i18n(req), "de"
  t.end()

test "url param overwrites http header", (t)  ->
  req =
    url: "http://foo.bar/baz?foo=bar&lang=de&bar=baz"
    headers: "accept-language": "en-GB,en-US;q=0.9,fr-CA;q=0.7,en;q=0.8"
  t.equal i18n(req), "de"
  t.end()
