"""
Hello World example.
"""


from http.server import BaseHTTPRequestHandler, HTTPServer


class HelloWorldHandler(BaseHTTPRequestHandler):
    """
    Simple Hello World handler.
    """

    def do_GET(self):  # pylint: disable=invalid-name
        """
        Handle GET requests.
        """
        self.send_response(200)
        self.send_header("Content-type", "text/plain")
        self.end_headers()
        self.wfile.write(b"Hello World!\n")


def main():
    """
    Main entry point.
    """
    httpd = HTTPServer(('', 2080), HelloWorldHandler)
    httpd.serve_forever()
