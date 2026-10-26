{{- /* Markdown copies (index.md, llms-full.txt) keep the LaTeX source instead of KaTeX markup. */ -}}
{{- if eq .Type "block" }}$${{ .Inner }}$${{ else }}\({{ .Inner }}\){{ end -}}
