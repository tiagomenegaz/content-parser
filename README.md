# content-parser
Simple HTML content parser

# Getting Started

### Using Docker

First, build the image locally
```
docker build -t cp:0.0.1 .
```

Then run the container
```
docker container run --net host --rm -a stdin -a stdout -it cp:0.0.1 /bin/bash
```
If you don't use Linux you probally don't need the `net host` parameter. See more [here](https://docs.docker.com/network/host/) for your OS requirements.

Now go to the section **Request Example**.

### Local

Make sure you have all dependencies to run a standard Rails 5 application, if you have any doubts you can go [here](https://guides.rubyonrails.org/v5.0/getting_started.html). I also suggest you to use a manager to your ruby versions. I personally use [RVM](https://rvm.io/).

```
rvm use 2.6.1
bundle install
rails s
```

# Request Example

This project has two endpoints. The first is to add a page content and the second is to list all stored content.
Attention, this project is compatible with [JSONAPI](https://jsonapi.org) requirements. So you need to add your header with `-H "Accept: application/vnd.api+json"`.

### Inserting a page content
```
curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X POST -d '{"data": {"type":"pages", "attributes":{"original_url":"http://example.com"}}}' http://localhost:3000/api/v1/pages
```
You can change the parameter `original_url` from `http://example.com` to an URL of your choice.

### Retrieving all stored page content

In the example below shows you how to list all saved pages.
```
curl -i -H "Accept: application/vnd.api+json" "http://localhost:3000/api/v1/pages"
```

You can also request all related tag content using `include=contents` param.
```
curl -i -H "Accept: application/vnd.api+json" "http://localhost:3000/api/v1/pages?include=contents"
```
