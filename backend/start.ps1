# Backend Start Script for Deep Research Assistant
# This script automatically clears proxy settings and sets UTF-8 encoding

Write-Host "Starting Deep Research Assistant Backend..." -ForegroundColor Green

# Clear all proxy settings (Critical!)
$env:HTTP_PROXY = ''
$env:HTTPS_PROXY = ''
$env:ALL_PROXY = ''
$env:NO_PROXY = '*'

# Set Python output encoding to UTF-8
$env:PYTHONIOENCODING = 'utf-8'

Write-Host "Proxy settings cleared" -ForegroundColor Yellow
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
