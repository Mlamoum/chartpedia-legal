# chartpedia-legal

Public Terms of Service and Privacy Policy for **Chartpedia**
(@ChartpediaOfficial), hosted on GitHub Pages.

These pages exist so platform developer programmes (TikTok, YouTube) have a
stable public URL to point at during app registration and review.

| Page | URL |
|---|---|
| Landing | https://mlamoum.github.io/chartpedia-legal/ |
| Terms of Service | https://mlamoum.github.io/chartpedia-legal/terms.html |
| Privacy Policy | https://mlamoum.github.io/chartpedia-legal/privacy.html |

Static HTML, no build step. Edit the files and push; Pages redeploys in about a
minute. `.nojekyll` is present so GitHub serves the files as-is rather than
running them through Jekyll.

Source of truth for edits: `/home/loma/chartpedia/docs/` on the VPS.

## Contact address

`chartpediaofficial@gmail.com` — the Chartpedia channel account, used for the
YouTube channel and TikTok signup. It appears in `terms.html`, `privacy.html`
and `index.html`.

To change it later:

```bash
cd /home/loma/chartpedia
NEW="new@address"
OLD="chartpediaofficial@gmail.com"
sed -i "s/$OLD/$NEW/g" docs/terms.html docs/privacy.html \
    chartpedia-legal/{terms.html,privacy.html,index.html,README.md}
cd chartpedia-legal && git commit -aqm "Update contact address" && ./publish.sh
```
