.PHONY: Makefile

build: Makefile
	rm -rvf ./dist || true;
	npx tailwindcss build src/input.css -o ./dist/style.css
	rsync -rav ./src/ ./dist

deploy: build
	aws s3 sync ./dist s3://www.entropysource.com/dist --exact-timestamps --delete

dev:
	python -m http.server --directory dist