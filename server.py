from flask import Flask, send_from_directory, request, abort
import os

app = Flask(__name__)
DOWNLOAD_FOLDER = "files"  
os.makedirs(DOWNLOAD_FOLDER, exist_ok=True)

@app.route("/download/<path:filepath>")
def download_file(filepath):
    try:
        return send_from_directory(DOWNLOAD_FOLDER, filepath, as_attachment=True)
    except FileNotFoundError:
        abort(404, description="File not found")

if __name__ == "__main__":
    app.run(debug=True)
