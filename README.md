<center>![](http://i.imgur.com/ND6qDNA.png)</center>

# Validator for Sailor

[![Build Status](http://img.shields.io/travis/sailorjs/sailor-validator/master.svg?style=flat)](https://travis-ci.org/sailorjs/sailor-validator)
[![Dependency status](http://img.shields.io/david/sailorjs/sailor-validator.svg?style=flat)](https://david-dm.org/sailorjs/sailor-validator)
[![Dev Dependencies Status](http://img.shields.io/david/dev/sailorjs/sailor-validator.svg?style=flat)](https://david-dm.org/sailorjs/sailor-validator#info=devDependencies)
[![NPM Status](http://img.shields.io/npm/dm/sailor-validator.svg?style=flat)](https://www.npmjs.org/package/sailor-validator)
[![Gittip](http://img.shields.io/gittip/Kikobeats.svg?style=flat)](https://www.gittip.com/Kikobeats/)

> Ensure and validate things from your request. based on [express-validator](https://github.com/ctavan/express-validator).

## Install

```coffeescript
npm install sailor-validator
```

## Usage

```coffeescript
validator = require 'sailor-validator'
```

or using `sailor` dependency

```coffeescript
sailor 	 = require 'sailorjs'
validator = sailor.validator
```

Use in combine with [sailor-errorify](https://github.com/sailorjs/sailor-errorify) for serializer the errors. For example:

```
req.checkBody('email', translate.get "User.Email.NotFound").notEmpty()
req.checkBody('password', translate.get "User.Password.NotFound").notEmpty()
req.checkBody('password', translate.get "User.Password.Invalid").isAlphanumeric()
req.checkBody('password', translate.get "User.Password.MinLength").isLength(passwordLength)
return next(errorify.serialize(req)) if req.validationErrors()
```

For more information check [express validator documentation](https://github.com/ctavan/express-validator#usage).

## License

MIT © [Kiko Beats](http://www.kikobeats.com)


