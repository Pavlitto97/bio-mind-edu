# AI Image Generation Prompts for Lesson Thumbnails

Промпти для генерації обкладинок уроків за допомогою AI (Midjourney, DALL-E, Stable Diffusion)

---

## 🧬 Lesson 1: Cell Structure (DONE ✅)

**Status:** ✅ Image generated and integrated as `cell_thumbnail.png`

**Prompt used:**
```
Educational illustration for children showing a simple cell with three colorful parts: 
red nucleus in the center, green mitochondria (oval shapes), and blue cell membrane 
(outer border). Cute cartoon style, bright cheerful colors, clean design for kids 
aged 3-8. Simple biology illustration, friendly and engaging, perfect for lesson 
card cover.
```

**File location:** `biomind_edu/assets/images/cell_thumbnail.png`  
**Size:** 143KB, 1024x1024px

---

## 🌱 Lesson 2: Plant Life (TODO 📝)

**Prompt for AI generation:**
```
Educational illustration for children showing a simple plant with three colorful 
parts: brown roots at the bottom (underground in soil), green stem in the middle 
(vertical trunk), and bright light-green leaves at the top (oval or heart shapes). 
Cute cartoon style, bright cheerful colors, clean simple design for kids aged 3-8. 
Simple biology illustration, friendly and engaging, perfect for lesson card cover. 
Show cross-section view with visible roots underground.
```

**Alternative prompt (more detailed):**
```
Cute cartoon plant illustration for kids, showing: 
- ROOTS: brown, wavy lines underground in brown soil
- STEM: bright green vertical trunk in the middle
- LEAVES: light green oval shapes at the top reaching toward yellow sun
Cheerful colors, simple shapes, educational biology lesson cover, child-friendly 
style for ages 3-8, white or light background.
```

**Target specs:**
- Format: PNG or JPG
- Size: 1024x1024px
- Style: Cartoon, colorful, kid-friendly
- Background: Light or white

**Save as:** `biomind_edu/assets/images/plant_thumbnail.png`

---

## ❤️ Lesson 3: Heart Structure (TODO 📝)

**Prompt for AI generation:**
```
Educational illustration for children showing a simple heart with four colored 
chambers: red left ventricle (bottom left), pink left atrium (top left), blue 
right ventricle (bottom right), light blue right atrium (top right). Cute cartoon 
style, bright cheerful colors, clean design for kids aged 3-8. Simple biology 
illustration, friendly and engaging, perfect for lesson card cover. Show heart 
shape with visible chambers inside.
```

**Alternative prompt:**
```
Cute cartoon heart illustration for kids showing four chambers in different colors:
- Top left: pink chamber (left atrium)
- Bottom left: bright red chamber (left ventricle)  
- Top right: light blue chamber (right atrium)
- Bottom right: darker blue chamber (right ventricle)
Happy smiling heart character, educational, simple shapes, child-friendly for ages 
3-8, biology lesson cover.
```

**Target specs:**
- Format: PNG or JPG
- Size: 1024x1024px
- Style: Cartoon, colorful, cute
- Background: Light or white

**Save as:** `biomind_edu/assets/images/heart_thumbnail.png`

---

## 🎨 Style Guidelines for All Images

### Color Palette:
- **Bright and cheerful** - vibrant but not overwhelming
- **High contrast** - easy to see on mobile screens
- **Consistent style** - all three should look like they're from the same series

### Design Principles:
1. **Simple shapes** - easy for young children to recognize
2. **Clear labels** - visual distinction between parts
3. **No text** - pure illustration (text is in the app)
4. **Friendly** - approachable, not scary or clinical
5. **Educational** - scientifically accurate but simplified

### Technical Requirements:
- Square aspect ratio (1:1)
- Minimum 1024x1024px
- Maximum 500KB file size
- PNG or JPG format
- RGB color space

---

## 🔧 Tools for Generation

### Recommended AI Tools:

1. **Midjourney** (Best quality)
   - Command: `/imagine` + prompt
   - Parameters: `--ar 1:1 --v 6 --style raw`
   - Cost: ~$10/month

2. **DALL-E 3** (via ChatGPT Plus)
   - Paste prompt in ChatGPT
   - Request: "Generate this as a square image"
   - Cost: $20/month (includes other ChatGPT features)

3. **Stable Diffusion** (Free, self-hosted)
   - Use: Automatic1111 WebUI
   - Model: SD XL or SD 1.5
   - Cost: Free (requires decent GPU)

4. **Bing Image Creator** (FREE! 🎉)
   - Based on DALL-E 3
   - URL: https://www.bing.com/images/create
   - Paste prompt and generate
   - Cost: **Completely FREE**

### 🏆 BEST FREE OPTION:
**Bing Image Creator** - Same quality as DALL-E 3, completely free!

---

## 📋 Generation Checklist

### For Plant Thumbnail:
- [ ] Generate image using prompt above
- [ ] Download as PNG/JPG
- [ ] Resize to 1024x1024 if needed
- [ ] Save to `biomind_edu/assets/images/plant_thumbnail.png`
- [ ] Update `pubspec.yaml` if needed (already configured)
- [ ] Test in app: `flutter run -d chrome`

### For Heart Thumbnail:
- [ ] Generate image using prompt above
- [ ] Download as PNG/JPG
- [ ] Resize to 1024x1024 if needed
- [ ] Save to `biomind_edu/assets/images/heart_thumbnail.png`
- [ ] Update `pubspec.yaml` if needed
- [ ] Test in app

---

## 📊 Current Status

| Lesson | Thumbnail | Interactive Task | Status |
|--------|-----------|------------------|--------|
| Cell | ✅ Done | ✅ Done | Complete |
| Plant | ❌ TODO | ✅ Done | Need image |
| Heart | ❌ TODO | ❌ TODO | Not started |

---

*Last updated: October 2025*
