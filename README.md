# ssl-remove #
[![Build Status](https://travis-ci.org/johanneswuerbach/ssl-remove.png?branch=master)](https://travis-ci.org/johanneswuerbach/ssl-remove) [![Dependency Status](https://gemnasium.com/johanneswuerbach/ssl-remove.png)](https://gemnasium.com/johanneswuerbach/ssl-remove)

SSL-remove is an application running on Heroku, which allows to redirect from an https url to http url. This allows local and remote development without running a web server, which supports HTTPS.

## Usage ##
```
https://ssl-remove.herokuapp.com/target_domain/target_port/everything_will?be=included
```

## Example ##
```
https://ssl-remove.herokuapp.com/localhost/3000/some/url?a=param
redirects to
http://localhost:3000/some/url?a=param
```

## License ##

Copyright (c) 2013 Johannes Würbach

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.