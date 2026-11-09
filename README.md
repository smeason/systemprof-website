# Samson Wu's Website

This is a static personal website built with HTML, CSS, and a small amount of
vanilla JavaScript. There is no build step, package manager, or dependency
installation required.

## Run the site locally

The included development server uses PowerShell and is intended for Windows.

1. Open PowerShell in the project folder.
2. Start the server:

   ```powershell
   .\serve.ps1
   ```

3. Open [http://localhost:8080](http://localhost:8080) in your browser. The
   server uses `index.shtml` as the home page.
4. Stop the server with **Ctrl+C** in PowerShell.

To use a different port, pass it to the script, for example:

```powershell
.\serve.ps1 -Port 8000
```

Then visit `http://localhost:8000`.

## Developing

- Edit a page (`index.shtml`, `projects.html`, `art.html`, `hobbies.html`, or
  `academics.html`) to change its content and markup.
- Edit `style.css` to change the site's shared layout and appearance.
- Edit `main.js` for shared browser behavior. It currently powers the image
  slideshow controls on pages that include it.
- Keep images, videos, documents, and other site media in `websiteAssets/` and
  update the relevant page's file path when adding or replacing an asset.
- `project_archive.html` and `slideshow.html` are additional pages in the
  project.

Use paths relative to the project root for page links and assets, matching the
existing markup. The local server serves `.shtml` pages as HTML; it does not
run a backend or perform a build.
