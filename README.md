Chatberry
==================

Simple Node.js + Express.js + Socket.io + Redis + Handlebars chat.  
It's just a sample application to test Node on a Raspberry PI, but it can also be a useful boilerplate application.  
Besides... the name is catchy :D  
The artwork included is awesome... please don't sue me Mr. Berry!


Installation
--------------------
* ```npm install``` from the project's path
* Change the URL for socket.io in the server.coffee

On your Raspberry:
--------------------
If you have some issues installing the npm packages:
```npm config set registry http://registry.npmjs.org```

Installing Node.js (thanks to [Matt's Blog](http://blog.rueedlinger.ch/2013/03/raspberry-pi-and-nodejs-basic-setup/)):  

    sudo mkdir /opt/node
    wget http://nodejs.org/dist/v0.10.2/node-v0.10.2-linux-arm-pi.tar.gz
    tar xvzf node-v0.10.2-linux-arm-pi.tar.gz
    sudo cp -r node-v0.10.2-linux-arm-pi/* /opt/node
    nano /etc/profile
    
Add the following lines:  

    NODE_JS_HOME="/opt/node"
    PATH="$PATH:$NODE_JS_HOME/bin"
    export PATH

Redis install:  
```curl https://raw.github.com/adafruit/Adafruit-WebIDE/alpha/scripts/install.sh | sudo sh```



MIT License
--------------------
	Copyright (c) 2012 Andrea Mazzini. All rights reserved.

	Permission is hereby granted, free of charge, to any person obtaining a
	copy of this software and associated documentation files (the "Software"),
	to deal in the Software without restriction, including
	without limitation the rights to use, copy, modify, merge, publish,
	distribute, sublicense, and/or sell copies of the Software, and to
	permit persons to whom the Software is furnished to do so, subject to
	the following conditions:

	The above copyright notice and this permission notice shall be included
	in all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
	OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
	MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
	IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
	CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
	TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
	SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.