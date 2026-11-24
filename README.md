# Daily Brew

A coffee recipe for every day, made from what's in your kitchen. It starts with a short taste quiz, then you tick off your pantry and gear, and each morning it picks a recipe you can make, with swaps for anything you're missing.

It's a web app (HTML, CSS and JavaScript in one file), built so it can be installed on a phone like a normal app and work offline.

## What's in this folder

| File | What it is |
| --- | --- |
| `index.html` | The whole app: layout, styles, recipes and logic |
| `manifest.webmanifest` | Name, colors and icons a phone uses when you install the app |
| `sw.js` | Service worker that caches the app so it opens offline |
| `icons/` | App icons for the home screen |
| `start.bat` | Double-click to run the app on your computer |

## Run it on your computer

Pick whichever is easiest:

1. **Double-click `start.bat`.** It starts a small local server at http://localhost:8080 and opens your browser. It needs Python or Node.js installed. If neither is installed, it opens the file directly.
2. **VS Code:** open this folder, install the recommended **Live Server** extension when VS Code suggests it, then right-click `index.html` and choose **Open with Live Server**. The page reloads every time you save.
3. **Just open `index.html`** in Chrome or Edge. Everything works except offline mode.

Your quiz answers, pantry, own syrups and own recipes are saved in the browser (localStorage), so they stay put between visits on the same browser.

To see it at phone size, press **F12** in Chrome or Edge, then **Ctrl+Shift+M** for device mode.

## Where to make changes in `index.html`

Search the file for these names:

- `RECIPES` holds every drink: name, description, hot or iced, strength, milk and sweetness levels (0–2), flavors, coffee base, ingredients per mug and steps.
- `PANTRY` holds the ingredients you can tick off, grouped by section.
- `EQUIP` holds the coffee machines and gear.
- `SUBS` holds the substitutions shown for each ingredient. `SYRUP_FLAVOR` and `EXTRACT_FLAVOR` say which flavor each syrup and extract is, so your own syrups and extracts can stand in for them. Extract swaps are added with `addSub()`.
- `SURVEY` holds the taste quiz questions.
- `vMine()` and `vEditor()` are the My recipes tab and the recipe editor. `customRecipes()` builds the hot and iced lattes for each syrup or extract you add.
- `score()` decides how well a recipe fits your taste; `todaysOrder()` picks the daily recipe.
- Colors and fonts are the `--` variables at the top of the `<style>` block.

After changing anything, bump `VERSION` in `sw.js` (for example `daily-brew-v2`) so an installed phone copy fetches the update.

## Save your pantry and recipes

Everything saves automatically in the browser you're using. To keep a safe copy, or to move it to another device, open the **You** tab:

- **Save backup file** downloads a `daily-brew-backup-<date>.json` file.
- **Copy backup code** copies the same backup as text you can paste into a note or email.
- **Restore from a backup** loads a file or a pasted code. A new device also offers **I have a backup to restore** on the first screen.

## Put it on your phone

A phone can only install the app from a web address (https), so the folder needs to be online first.

1. **Back up first.** On your computer, open the app, go to **You**, tap **Copy backup code**, and email or message it to yourself.
2. **Put it online (free).** Go to https://app.netlify.com/drop and drag this whole `daily-brew` folder onto the page. You get a link like `something.netlify.app` in a few seconds. Sign up (free) if you want the link to stay up for good; otherwise drops expire.
3. **Install it on your phone.** Open the link on your phone:
   - **iPhone:** in Safari, tap Share, then **Add to Home Screen**, then **Add**.
   - **Android:** in Chrome, tap ⋮, then **Install app** or **Add to Home screen**.
4. **Bring your data along.** Open Daily Brew from the home screen, tap **I have a backup to restore**, and paste the code. (On iPhone, do this in the home-screen app, not in Safari; they keep separate storage.)

It gets its own icon, opens full-screen, and works offline after the first visit.

**Updating later:** after you change files, bump `VERSION` in `sw.js`, then drag the folder onto your Netlify site's **Deploys** page. Your phone picks up the new version the next time it opens the app online.

**GitHub Pages instead:** push the folder to a GitHub repository and turn on Pages in the repository's settings.

## Later: a real App Store or Play Store app

When the app is finished, it can be wrapped as a native app with [Capacitor](https://capacitorjs.com), which packages this same folder for iOS and Android. Publishing needs an Apple Developer account for iPhone and a Google Play developer account for Android.
