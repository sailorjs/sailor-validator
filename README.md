<center>![](http://i.imgur.com/ND6qDNA.png)</center>

# Validator for Sailor

[![Build Status](http://img.shields.io/travis/sailorjs/sailor-validator/master.svg?style=flat)](https://travis-ci.org/sailorjs/sailor-validator)
[![Dependency status](http://img.shields.io/david/sailorjs/sailor-validator.svg?style=flat)](https://david-dm.org/sailorjs/sailor-validator)
[![Dev Dependencies Status](http://img.shields.io/david/dev/sailorjs/sailor-validator.svg?style=flat)](https://david-dm.org/sailorjs/sailor-validator#info=devDependencies)
[![NPM Status](http://img.shields.io/npm/dm/sailor-validator.svg?style=flat)](https://www.npmjs.org/package/sailor-validator)
[![Gittip](http://img.shields.io/gittip/Kikobeats.svg?style=flat)](https://www.gittip.com/Kikobeats/)

> Ensure and validate things from your request. Extend [express-validator](https://github.com/ctavan/express-validator) interface.

## Install

```bash
npm install sailor-validator
```

## Usage

```coffee
validator = require 'sailor-validator'
```

or using `sailor` dependency

```coffeescript
sailor 	 = require 'sailorjs'
validator = sailor.validator
```

Ideal for validate thing as pre-conditions in your request:

```coffee
validator
  .begin(req, res)
  .add 'user', translate.get('User.NotFound'), 'notEmpty'
  .end (params) ->
```

In this example, if `user` param is empty compound a badRequest response that follow `sailor-errorify` schema for errors.

## License

MIT © [Kiko Beats](http://www.kikobeats.com)
