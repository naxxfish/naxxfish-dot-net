build:
	hugo

publish: build
	wrangler publish

clean:
	rm -rf public dist resources