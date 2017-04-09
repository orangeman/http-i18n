
parese = require "accept-language-parser"

module.exports = (req) ->
  req.url.match(/lang=(.*?)(&|$)/)?[1]?.toLowerCase() ||
  req.headers["accept-language"]?.split("-")[0].split(",")[0]?.toLowerCase() ||
  "en"
