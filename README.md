## GemNotifier ##

**GemNofitier** is a web app that help rubyists to keep updates on latest gems what they subscribed.

It's hosting at [http://gemnotifier.org/](http://gemnotifier.org/ "GemNotifier")

Notes: the project need two parts setup

1. hook up with rubygems.org
   http://guides.rubygems.org/rubygems-org-api/#webhook
   the controller handles the hook is hooks_controller
   
2. run cron task to send updates mail, you need to specify your mail setting in production.rb
   cron.rake

2011 © Product of [Intridea](http://intridea.com) Inc, built by [Roc Yu](http://rociiu.com)

Submit issues: [https://github.com/intridea/gemnotifier/issues](https://github.com/intridea/gemnotifier/issues)

Contact: [roc@intridea.com](mailto:roc@intridea.com)