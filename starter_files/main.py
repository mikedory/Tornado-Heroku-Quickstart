#	Sample main.py Tornado file
# 
#	Author: Mike Dory
#		11.12.11
#

#!/usr/bin/env python
import os.path
import os
import tornado.escape
import tornado.httpserver
import tornado.ioloop
import tornado.options
import tornado.web
import unicodedata

# import and define tornado-y things
from tornado.options import define, options
define("port", default=5000, help="run on the given port", type=int)

# application settings and handle mapping info
class Application(tornado.web.Application):
	def __init__(self):
		handlers = [
			(r"/([^/]+)?", MainHandler)
		]
		settings = dict(
			template_path=os.path.join(os.path.dirname(__file__), "templates"),
			static_path=os.path.join(os.path.dirname(__file__), "static"),
			debug=True,
		)
		tornado.web.Application.__init__(self, handlers, **settings)


# the main page
class MainHandler(tornado.web.RequestHandler):
	def get(self, q):
		if os.environ.has_key('GOOGLEANALYTICSID'):
			google_analytics_id = os.environ['GOOGLEANALYTICSID']
		else:
			google_analytics_id = False

		self.render(
			"main.html",
			page_heading='Hi!',
			google_analytics_id=google_analytics_id,
		)


# RAMMING SPEEEEEEED!
def main():
	tornado.options.parse_command_line()
	http_server = tornado.httpserver.HTTPServer(Application())
	http_server.listen(os.environ.get("PORT", 5000))

	# start it up
	tornado.ioloop.IOLoop.instance().start()


if __name__ == "__main__":
	main()