JEKYLL = bundle exec jekyll
HTMLMIN = npx html-minifier
WRANGLER = npx wrangler

HTMLMIN_FLAGS = --collapse-whitespace --collapse-boolean-attributes --remove-comments --remove-empty-attributes --remove-redundant-attributes

OUTPUT_DIR = _site

.PHONY: all
all: setup build

.PHONY: setup
setup:
	asdf install
	bundle install --quiet
	npm install

.PHONY: clean
clean:
	$(JEKYLL) clean

.PHONY: build
build: export JEKYLL_ENV = production
build:
	$(JEKYLL) build --quiet
	$(HTMLMIN) $(HTMLMIN_FLAGS) --file-ext html --input-dir $(OUTPUT_DIR) --output-dir $(OUTPUT_DIR)
	find $(OUTPUT_DIR) -type f \( -name '*html' -or -name '*.xml' -or -name '*.svg' -or -name '*.css' -or -name '*.js' \) -exec gzip -9kf {} +

.PHONY: deploy
deploy: build
	$(WRANGLER) pages publish --project-name geographyas $(OUTPUT_DIR)
