# content-parser
Simple HTML content parser

# Request Example

```
# Insert a page content
curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X POST -d '{"data": {"type":"pages", "attributes":{"original_url":"asdf"}}}' http://localhost:3000/api/v1/pages
# GET
curl -i -H "Accept: application/vnd.api+json" "http://localhost:3000/api/v1/pages?include=contents"
```
