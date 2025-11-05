{{- define "simple-flask-app.name" -}}
simple-flask-app
{{- end }}

{{- define "simple-flask-app.fullname" -}}
{{ include "simple-flask-app.name" . }}
{{- end }}
