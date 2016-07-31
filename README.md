# Templateur

Lightweight templates for YAML and JSON, inspired by [fly](https://github.com/concourse/fly).

<a href="https://travis-ci.org/cbguder/templateur"><img src="https://travis-ci.org/cbguder/templateur.svg?branch=master"></a>
<a href="https://codeclimate.com/github/cbguder/templateur"><img src="https://codeclimate.com/github/cbguder/templateur/badges/gpa.svg"/></a>
<a href="https://badge.fury.io/rb/templateur"><img src="https://badge.fury.io/rb/templateur.svg"/></a>

## Installation

```
$ gem install templateur
```

## Usage

For YAML output:

```
$ templateur --yaml template.yml parameters.yml
```

For JSON output:

```
$ templateur --json template.json parameters.json
```

## Template Format

### YAML

YAML templates look like this:

```yaml
my_special_key: {{my_special_parameter}}
```

and the corresponding parameters file might look like:

```yaml
my_special_parameter: my_special_secret
```

Combined, these files would produce the following output:

```yaml
my_special_key: my_special_secret
```

### JSON

JSON templates look like this:

```
{
  "my_special_key": {{my_special_parameter}}
}
```

and the corresponding parameters file might look like:

```json
{
  "my_special_parameter": "my_special_secret"
}
```

Combined, these files would produce the following output:

```json
{
  "my_special_key": "my_special_secret"
}
```
