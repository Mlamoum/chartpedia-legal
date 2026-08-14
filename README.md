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

## ⚠️ Contact address is a placeholder

`contact@chartpediaofficial.com` is a **placeholder**. Replace it with the real
Chartpedia Gmail (the account used for the YouTube channel and TikTok signup)
before these URLs are submitted to any platform review.

It appears in three files: `terms.html`, `privacy.html`, `index.html`.

```bash
cd /home/loma/chartpedia
NEW="the.real@gmail.com"
sed -i "s/contact@chartpediaofficial\.com/$NEW/g" \
    docs/terms.html docs/privacy.html \
    chartpedia-legal/{terms.html,privacy.html,index.html,README.md}
cd chartpedia-legal && git commit -aqm "Set real contact address" && ./publish.sh
```
