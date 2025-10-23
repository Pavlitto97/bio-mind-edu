'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "61f25e1002299731d6fd6ec0ca0a1b32",
"version.json": "302f1a764db0e8b01470a9e2aa8d0155",
"index.html": "bae39afe4a5e43307c8020c8dde61a4b",
"/": "bae39afe4a5e43307c8020c8dde61a4b",
"main.dart.js": "11963b8c61a4a66263748c5e95bdc21f",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "ea35e4054f04538bc52d60eac920f7b7",
"assets/AssetManifest.json": "8449dcfc8a4aeb9fe3444fbce488a5ad",
"assets/NOTICES": "4409a835cc8e9518cefee42f93852c46",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "b6f0a0e2a2f334c24d7cfe3b58bf273d",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/model_viewer_plus/assets/model-viewer.min.js": "dd677b435b16f44e4ca08a9f354bac24",
"assets/packages/model_viewer_plus/assets/template.html": "8de94ff19fee64be3edffddb412ab63c",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "a9facb29f91ce65c4bf0bfb80392d281",
"assets/fonts/MaterialIcons-Regular.otf": "978e708b9d1b0213aba86f2cc9871eee",
"assets/assets/3d_models/cell_model.glb": "08146c793a8bf5fe244a9166509eb850",
"assets/assets/3d_models/plant_model.glb": "6438b33addeb100b9dedbf2fa1dbe6ae",
"assets/assets/3d_models/README.txt": "36002c36d4b5a380b24f29f29c25e578",
"assets/assets/3d_models/3d+heart+model.glb": "d52ea77ffc34cb7a56cbb0bb1305a3a5",
"assets/assets/images/Gemini_Generated_Image_7a7bii7a7bii7a7b%2520(1).png": "61713c4404bcc193ea2f985c8ff4f1f5",
"assets/assets/images/LEFT_VENTRICLE.png": "abdd79dee80e58924dada089e7a858de",
"assets/assets/images/cell_thumbnail.png": "42d1d0c80db27b8ad6136cc95da83927",
"assets/assets/images/mitochondria.png": "9a45bda76a811be366694a5732b7fca7",
"assets/assets/images/app_logo_header.png": "0d98559e4979f30d9836cac7a6fe9ce3",
"assets/assets/images/app_logo_splash.png": "88d8cf683cc61e187597fe1a3edc36c8",
"assets/assets/images/RIGHT_ATRIUM.png": "b0513032c1dd17042e24453269a6df22",
"assets/assets/images/membrane.png": "a0765d0a7121d264ba49678b14da509b",
"assets/assets/images/SEED.png": "e4394c0b106951bb2ae394abbe77cab1",
"assets/assets/images/plant_thumbnail.png": "a95f150ab2ef36fbc1cf059150ea8a32",
"assets/assets/images/Gemini_Generated_Image_u1qozpu1qozpu1qo-removebg-preview%2520(1)%2520copy.png": "0d98559e4979f30d9836cac7a6fe9ce3",
"assets/assets/images/heart_thumbnail.png": "d066d6bbb730a022b1da13b4bbbf9e96",
"assets/assets/images/GROWTH.png": "4e747cfe714f8375dee006b3bb22eadc",
"assets/assets/images/SPROUT.png": "4b8108f54f3f120bd912b745246bcd61",
"assets/assets/images/BLOOM.png": "30cb29e00f772e55911d6063450a3012",
"assets/assets/images/nucleus.png": "a380cbf43dc3743a291cee691b3a71c7",
"assets/assets/images/PLACEHOLDER.txt": "7ac374208d2ddac65194e490ecfc9a1a",
"assets/assets/images/LEFT_ATRIUM.png": "af7aab3f60494f4165df68f5234ee628",
"assets/assets/images/plant_life_thumbnail.png": "9da92b6600378c3471b440663be93ea5",
"assets/assets/images/RIGHT_VENTRICLE.png": "3f2a6348b669de3d3775aa9807862dcf",
"assets/assets/audio/background_music.mp3": "9895b1cdc037f08181b5af27151f039b",
"assets/assets/audio/error.mp3": "39a1f880b5293497fe0323396cdfecaf",
"assets/assets/audio/app_logo_header.png": "a408b0f8038756ce1cbb84547b1996b7",
"assets/assets/audio/success.mp3": "942ca29a0a8b48a9f7a21ada4b0eaee1",
"assets/assets/audio/background_music_main.mp3": "9895b1cdc037f08181b5af27151f039b",
"assets/assets/audio/victory.mp3": "98b196d17a58cd5d1dba5b021ad8aeae",
"assets/assets/audio/complete.mp3": "de7c0cf36488e8bae779a91a49d5d0cd",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
