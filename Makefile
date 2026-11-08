.PHONY: check serve reload lint

check:
	mkdir -p .run
	nginx -t -p "$(CURDIR)/" -c "$(CURDIR)/infra/nginx.conf" -e stderr

serve: check
	nginx -p "$(CURDIR)/" -c "$(CURDIR)/infra/nginx.conf" -e stderr -g 'daemon off;'

reload: check
	nginx -p "$(CURDIR)/" -c "$(CURDIR)/infra/nginx.conf" -e stderr -s reload

lint:
	markdownlint README.md docs/*.md
