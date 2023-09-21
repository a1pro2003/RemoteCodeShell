import http.server
import socketserver
import os

current_directory = os.getcwd()
print("Current Directory:", current_directory)

with open("output.txt", "w") as file:
    # Write content to the file

# Define a custom request handler that can handle file uploads
class MyHandler(http.server.SimpleHTTPRequestHandler):
    def do_POST(self):
        content_length = int(self.headers['Content-Length'])
        uploaded_data = self.rfile.read(content_length)
        
        # Process the uploaded data (e.g., save it to a file)
        with open('output.txt', 'wb') as f:
            f.write(uploaded_data)
        
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b'File uploaded successfully\n')

# Specify the port to run the server on
port = 8000

# Start the HTTP server
with socketserver.TCPServer(("", port), MyHandler) as httpd:
    print(f"Server started on port {port}")
    httpd.serve_forever()
