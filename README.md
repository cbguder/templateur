# Templateur

Lightweight templates for YAML and JSON, inspired by [fly](https://github.com/concourse/fly).

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
