# Backend Start Script for Deep Research Assistant
# This script automatically clears proxy settings and sets UTF-8 encoding

Write-Host "Starting Deep Research Assistant Backend..." -ForegroundColor Green

# Set proxy for accessing foreign APIs (Tavily, etc.)
# Comment out these lines if you don't need proxy or if it causes issues
$env:HTTP_PROXY = 'socks5://127.0.0.1:7897'
$env:HTTPS_PROXY = 'socks5://127.0.0.1:7897'
$env:ALL_PROXY = 'socks5://127.0.0.1:7897'
# $env:NO_PROXY = 'localhost,127.0.0.1'

# Set Python output encoding to UTF-8
$env:PYTHONIOENCODING = 'utf-8'

Write-Host "Proxy configured: socks5://127.0.0.1:7897" -ForegroundColor Yellow
Write-Host "UTF-8 encoding set" -ForegroundColor Yellow
Write-Host ""
Write-Host "Starting server..." -ForegroundColor Cyan
Write-Host "Backend API: http://localhost:8000" -ForegroundColor Cyan
Write-Host "API Docs: http://localhost:8000/docs" -ForegroundColor Cyan
Write-Host ""
Write-Host "Press Ctrl+C to stop" -ForegroundColor Gray
Write-Host "========================================" -ForegroundColor Gray
Write-Host ""

# Start backend server
python src/main.py
