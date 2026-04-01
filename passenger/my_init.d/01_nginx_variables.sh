#!/bin/bash

render_site_template() {
	local template_file="$1"
	local output_file="/etc/nginx/sites-available/$(basename "$template_file")"
	local template_content

	template_content="$(< "$template_file")"
	template_content="${template_content//\$\{APP_CURRENT_PATH\}/${APP_CURRENT_PATH%/}}"
	template_content="${template_content//\$\{RAILS_RELATIVE_URL_ROOT\}/${RAILS_RELATIVE_URL_ROOT%/}}"
	printf '%s\n' "$template_content" > "$output_file"
}

for template_file in /etc/nginx/sites-templates/*; do
	[ -f "$template_file" ] || continue
	render_site_template "$template_file"
done
