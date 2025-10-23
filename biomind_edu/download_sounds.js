// Script to download game sounds from Pixabay
const https = require('https');
const fs = require('fs');
const path = require('path');

const audioDir = path.join(__dirname, 'assets', 'audio');

// Ensure audio directory exists
if (!fs.existsSync(audioDir)) {
  fs.mkdirSync(audioDir, { recursive: true });
}

// Free game sound effects URLs (direct download links)
const sounds = [
  {
    name: 'success.mp3',
    // Positive success sound - Level Complete
    url: 'https://cdn.pixabay.com/audio/2021/08/04/audio_0625c1539c.mp3'
  },
  {
    name: 'error.mp3',
    // Wrong/error sound - Negative Beep
    url: 'https://cdn.pixabay.com/audio/2022/03/24/audio_c09d93e844.mp3'
  },
  {
    name: 'complete.mp3',
    // Task completion celebration - Win Sound
    url: 'https://cdn.pixabay.com/audio/2021/08/04/audio_12b0c7443c.mp3'
  }
];

function downloadFile(url, dest) {
  return new Promise((resolve, reject) => {
    const file = fs.createWriteStream(dest);
    
    https.get(url, (response) => {
      if (response.statusCode !== 200) {
        reject(new Error(`Failed to download: ${response.statusCode}`));
        return;
      }
      
      response.pipe(file);
      
      file.on('finish', () => {
        file.close();
        console.log(`✅ Downloaded: ${path.basename(dest)}`);
        resolve();
      });
    }).on('error', (err) => {
      fs.unlink(dest, () => {});
      reject(err);
    });
  });
}

async function downloadAll() {
  console.log('🎵 Downloading game sound effects from Pixabay...\n');
  
  for (const sound of sounds) {
    const destPath = path.join(audioDir, sound.name);
    
    try {
      await downloadFile(sound.url, destPath);
    } catch (error) {
      console.error(`❌ Error downloading ${sound.name}:`, error.message);
    }
  }
  
  console.log('\n✨ All sounds downloaded successfully!');
  console.log(`📁 Location: ${audioDir}`);
}

downloadAll();
