{{/*
Expand the name of the chart.
*/}}
{{- define "seafile.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "seafile.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "seafile.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "seafile.labels" -}}
helm.sh/chart: {{ include "seafile.chart" . }}
{{ include "seafile.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "seafile.selectorLabels" -}}
app.kubernetes.io/name: {{ include "seafile.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "seafile.cacheUrl" -}}
{{- if eq .Values.cache.password nil -}}
redis://{{ .Values.cache.host}}:{{ .Values.cache.port }}/1
{{- else -}}
redis://:{{ .Values.cache.password }}@{{ .Values.cache.host}}:{{ .Values.cache.port }}/1
{{- end }}
{{- end }}

{{- define "seafile.fileserver.externalUrl" -}}
{{- if .Values.frontend.externalUrl -}}
{{ .Values.frontend.externalUrl }}
{{- else -}}
https://{{ .Values.ingress.host }}/seafhttp
{{- end }}
{{- end }}

{{- define "seafile.fileserver.internalUrl" -}}
{{- if .Values.fileserver.internalUrl -}}
{{ .Values.fileserver.internalUrl }}
{{- else -}}
http://{{ include "seafile.fullname" . }}.{{ .Release.Namespace }}.svc.cluster.local:8082
{{- end }}
{{- end }}

{{- define "seafile.frontend.externalUrl" -}}
{{- if .Values.frontend.externalUrl -}}
{{ .Values.frontend.externalUrl }}
{{- else -}}
https://{{ .Values.ingress.host }}
{{- end }}
{{- end }}

{{- define "seafile.frontend.internalUrl" -}}
{{- if .Values.frontend.internalUrl -}}
{{ .Values.frontend.internalUrl }}
{{- else -}}
http://{{ include "seafile.fullname" . }}.{{ .Release.Namespace }}.svc.cluster.local:8000
{{- end }}
{{- end }}

{{- define "seafile.notifications.externalUrl" -}}
{{- if .Values.notifications.externalUrl -}}
{{ .Values.notifications.externalUrl }}
{{- else -}}
https://{{ .Values.ingress.host }}/notification
{{- end }}
{{- end }}

{{- define "seafile.notifications.internalUrl" -}}
{{- if .Values.notifications.internalUrl -}}
{{ .Values.notifications.internalUrl }}
{{- else -}}
http://{{ include "seafile.fullname" . }}.{{ .Release.Namespace }}.svc.cluster.local:8083
{{- end }}
{{- end }}

{{- define "seafile.databaseType.django" -}}
{{- if eq $ "mysql" -}}
django.db.backends.mysql
{{- else if eq $ "pgsql" -}}
django.db.backends.postgresql
{{- else -}}
{{ fail "Invalid database type" }}
{{- end }}
{{- end }}

{{- define "seafile.databaseType.jdbc" -}}
{{- if eq $ "mysql" -}}
mariadb
{{- else if eq $ "pgsql" -}}
postgresql
{{- else -}}
{{ fail "Invalid database type" }}
{{- end }}
{{- end }}
