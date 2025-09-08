import logging
from flask import Flask, request, render_template
import os

app = Flask(__name__)
UPLOAD_FOLDER = '/media'  # This will be bind-mounted

# Logging
logging.basicConfig(
    level=logging.INFO,
    format='[%(asctime)s] %(levelname)s in %(module)s: %(message)s'
)

@app.route('/')
def index():
    logging.info("JellyDrop UI loaded")
    return render_template('index.html')

@app.route('/upload', methods=['POST'])
def upload():
    file = request.files['file']
    if file:
        filepath = os.path.join(UPLOAD_FOLDER, file.filename)
        file.save(filepath)
        logging.info(f"Uploaded file: {file.filename} → {filepath}")
        return 'Upload complete', 200
    logging.warning("Upload attempt with no file")
    return 'No file received', 400

if __name__ == "__main__":
    logging.info("Startign JellyDrop server on port 8080")
    app.run(host="0.0.0.0", port=8080)