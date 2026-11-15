$baseUrl = "https://raw.githubusercontent.com/justadudewhohacks/face-api.js/master/weights/"
$outDir = "C:\Users\User\.gemini\antigravity\scratch\digital-vault\models\"

$files = @(
  "tiny_face_detector_model-weights_manifest.json",
  "tiny_face_detector_model-shard1",
  "face_landmark_68_model-weights_manifest.json",
  "face_landmark_68_model-shard1",
  "face_recognition_model-weights_manifest.json",
  "face_recognition_model-shard1",
  "face_recognition_model-shard2"
)

foreach ($item in $files) {
  $target = Join-Path $outDir $item
  if (-not (Test-Path $target)) {
    Write-Host "Downloading $item..."
    Invoke-WebRequest -Uri ($baseUrl + $item) -OutFile $target
  } else {
    Write-Host "$item already exists."
  }
}
Write-Host "All models ready."
Get-ChildItem $outDir
