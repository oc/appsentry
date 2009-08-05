#!/bin/sh
APPENGINE_SDK=/opt/appengine-java-sdk-1.2.2

rm -fr tmp/ appsentry.war
jruby -S warble

patch tmp/war/WEB-INF/gems/gems/sinatra-0.9.4/lib/sinatra.rb < patch_sinatra.p0

${APPENGINE_SDK}/bin/appcfg.sh update tmp/war/
