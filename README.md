smartdc
=======

[![Gem Version](https://badge.fury.io/rb/smartdc.png)](https://rubygems.org/gems/smartdc) [![Build Status](https://travis-ci.org/ogom/ruby-smartdc.png?branch=master)](https://travis-ci.org/ogom/ruby-smartdc)

[Joyent CloudAPI](https://apidocs.joyent.com/cloudapi/) client and command line interface.

```
              .
              |
 .-.  .--. .-.|  .-.
: + : `--.(   | (
 `-'  `--' `-'`- `-'
```

## Installation

```
gem install smartdc
```

## Usage

### CLI

Invoke interactive configuration.

#### Creates machine

```
$ sdc init
$ sdc image list
$ sdc package list
$ sdc machine add NAME -i IMAGE_ID -p PACKAGE_ID
$ sdc machine list
```

#### Output JSON

JSON is set to body of response.

```
$ sdc machine list --raw
```

#### Use machine

Set to config the Machine uuid.

```
$ sdc machine list
$ sdc machine show MACHINE_ID
$ sdc machine use MACHINE_ID
$ sdc machine show
```

#### Receives machine

Hash is set to content of response.

```
require 'smartdc'

Smartdc.configure do |config|
  config.url = 'https://example.com'
  config.username = 'user'
  config.use_key = '4c:02:f3:b2:09:fb:29:dd:41:97:da:80:bc:69:6c:f8'
end

Smartdc.machines.content
```

## Tests

```
$ rake spec
```

## License

* MIT
