#!/bin/bash

echo "╔══════════════════════════════════════════════════╗"
echo "║              JellyDrop Setup Script              ║"
echo "╚══════════════════════════════════════════════════╝"
echo ""
echo "Initializing your media portal..."
echo ""

# Step 1: Check for Docker & Docker Compose
if ! command -v docker &> /dev/null; then
    echo "[ERROR] Docker is not installed."
    echo "        Please install Docker before continuing."
    exit 1
fi

if ! command -v docker-compose &> /dev/null; then
    echo "[ERROR] Docker Compose is not installed."
    echo "        Please install Docker Compose before continuing."
    exit 1
fi

# Step 2: Set media folder path
MEDIA_PATH="/path/to/your/jellyfin/media"
if [ ! -d "$MEDIA_PATH" ]; then
    echo "╔════════════════════════════════════════════╗"
    echo "║  Media folder not found at:               ║"
    echo "║  $MEDIA_PATH                              ║"
    echo "╚════════════════════════════════════════════╝"
    echo "Please update the script with your actual Jellyfin media path."
    exit 1
fi

# Step 3: Set permissions (optional)
echo "[INFO] Ensuring media folder is writable..."
sudo chown -R 1000:1000 "$MEDIA_PATH"

# Step 4: Build and start JellyDrop
echo ""
echo "[INFO] Building JellyDrop container..."
docker-compose down
docker-compose build
docker-compose up -d

# Step 5: Confirm it's running
echo ""
echo "╔══════════════════════════════════════════════════╗"
echo "║ JellyDrop is now live at:                        ║"
echo "║   http://localhost:8080                          ║"
echo "║                                                  ║"
echo "║ Drop your media, stream with clarity.            ║"
echo "╚══════════════════════════════════════════════════╝"
echo ""

# Optional: Tail logs
echo "[INFO] Showing live logs (press Ctrl+C to exit)"
docker-compose logs -f jellydrop