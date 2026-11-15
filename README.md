# Aegis Vault - Biometric Personal Digital Vault

A secure, offline-first personal digital vault web application built with **HTML5, CSS3, Vanilla JavaScript, and `face-api.js`**.

---

## 🚀 Features

1. **Biometric Face-API Login & Lock Screen:**
   - **Enrollment / Register Face Mode:** Captures a 128-dimensional facial descriptor using `TinyFaceDetector`, `FaceLandmark68Net`, and `FaceRecognitionNet`, saving it securely to `localStorage`.
   - **Continuous Live Scanner:** Uses an adaptive threshold (`distance < 0.52`) with dynamic confidence metering and laser scanning reticle.
   - **Master PIN Fallback:** Keypad interface allows unlocking in low-light environments.
   - **Instant Vault Lock:** Top navigation lock action immediately wipes decrypted states and clears webcam feed.

2. **Personal Diary Module:**
   - Rich journal entries with mood indicators (`Productive`, `Joyful`, `Peaceful`, `Reflective`, `Stressed`), title, date, and long-form thoughts.
   - Live title & keyword search, mood filter, and calendar date filter.
   - Full edit and delete functionality.

3. **Income & Savings Tracker Module:**
   - Real-time KPI summaries: **Total Income**, **Total Expenses**, and **Net Savings Reserve**.
   - Custom savings goal target with progress bar.
   - Transaction ledger with instant logging.

4. **Secret Codes & Private Notes Module:**
   - Encrypted-style masked display (`••••••••`) by default.
   - Click-to-reveal eye toggle and one-click copy to clipboard.
   - Categories for Seed Phrases, PINs, API Keys, Passwords, and Private Notes.

5. **Google 2FA & Authenticator Backup Codes Vault:**
   - Dedicated user profile modal button in the top navigation.
   - Bulk-paste code ingest with automatic regex extraction of 8-digit and 10-digit codes.
   - Visual strikethrough for used codes and one-click cleanup.

6. **Offline Vault Backup & Recovery:**
   - Export full vault as structured JSON.
   - Offline import to restore entries anytime.

---

## 🧠 Face-API.js Model Weights: How to Host Locally or Via CDN

### Option A: Using CDN (Default)
In `index.html` and `script.js`, models are loaded directly via CDN:
```javascript
const MODEL_URL = 'https://raw.githubusercontent.com/justadudewhohacks/face-api.js/master/weights';
```

### Option B: Local Offline Model Hosting (Self-Contained)
For completely air-gapped / offline usage:
1. Create a `models/` directory inside `digital-vault/`:
   ```bash
   mkdir models
   ```
2. Download these weight files into `models/`:
   - `tiny_face_detector_model-weights_manifest.json`
   - `tiny_face_detector_model-shard1`
   - `face_landmark_68_model-weights_manifest.json`
   - `face_landmark_68_model-shard1`
   - `face_recognition_model-weights_manifest.json`
   - `face_recognition_model-shard1`
   - `face_recognition_model-shard2`
3. In `script.js`, change:
   ```javascript
   const MODEL_URL = './models';
   ```

---

## 💻 Running the Application

Because webcam access (`getUserMedia`) requires a secure context (`localhost` or `https`), serve the folder using any local static web server:

```bash
# Using Python
python -m http.server 8080

# Using Node / npx
npx serve .
```

Open your browser at `http://localhost:8080`.
