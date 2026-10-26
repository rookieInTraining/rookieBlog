{{- /* Clean Markdown rendition of a page for LLMs (https://llmstxt.org): front matter as
       a short header, then the rendered HTML converted back to Markdown so shortcodes,
       render hooks and inline HTML come out resolved. Shared by index.md and llms-full.txt. */ -}}
# {{ trim .Title " " }}
{{ with .Description }}
> {{ . }}
{{ end }}
- URL: {{ .Permalink }}
{{- if eq .Section "posts" }}
- Published: {{ .Date.Format "2006-01-02" }}
{{- if gt (.Lastmod.Format "2006-01-02") (.Date.Format "2006-01-02") }}
- Updated: {{ .Lastmod.Format "2006-01-02" }}
{{- end }}
{{- end }}
{{- with .GetTerms "tags" }}
- Tags: {{ range $i, $t := . }}{{ if $i }}, {{ end }}{{ $t.LinkTitle }}{{ end }}
{{- end }}
{{- /* <video> has no Markdown form: keep it as a link to the file instead of its fallback text. */ -}}
{{- $html := .Content | replaceRE `(?s)<video[^>]*>.*?<source src="([^"]+)".*?</video>` `<p><a href="$1">Video walkthrough</a></p>` -}}
{{- $md := transform.HTMLToMarkdown $html -}}
{{- /* .Content isn't canonified, and root-relative links are ambiguous once pasted into llms-full.txt. */ -}}
{{- $md = $md | replaceRE `\]\(/` (printf "](%s" site.BaseURL) -}}
{{- /* The converter escapes "\" as "\\", which in LaTeX means a line break: undo it inside $$...$$. */ -}}
{{- range findRE `\$\$[^$]+\$\$` $md | uniq -}}
  {{- $md = strings.Replace $md . (strings.Replace . `\\` `\`) -}}
{{- end }}

{{ $md }}
