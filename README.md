# chartpedia-legal

The public website for **Chartpedia** (@ChartpediaOfficial), hosted on GitHub
Pages. It is a real, multi-page site — homepage, video list, and two separate
legal documents — not a policy stub. Platform developer programmes (TikTok,
YouTube, Meta) point at these URLs during app registration and review.

| Page | URL |
|---|---|
| Home | https://mlamoum.github.io/chartpedia-legal/ |
| Videos | https://mlamoum.github.io/chartpedia-legal/videos.html |
| Terms of Service | https://mlamoum.github.io/chartpedia-legal/terms-of-service.html |
| Privacy Policy | https://mlamoum.github.io/chartpedia-legal/privacy-policy.html |

The homepage `<title>` is exactly `Chartpedia` — it must stay that way, because
TikTok's app review requires the website title to match the app name exactly.
Terms of Service and Privacy Policy are two genuinely distinct documents at two
distinct URLs; never point both app-settings fields at the same file.

## Legacy URLs — do not delete

`terms.html` and `privacy.html` are the **OAuth redirect_uri** registered for
both TikTok (`scripts/tiktok_auth.py`) and Instagram
(`scripts/instagram_auth.py`). They must keep returning HTTP 200 and must
**not** be turned into redirects — the auth flow depends on the browser landing
there with `?code=…` still in the address bar. They carry a `rel=canonical`
pointing at the new filenames and a short "this page has moved" line; that is
all the change they should ever get.

## Files

Static HTML, no build step. `style.css` is shared by every page. Edit and push;
Pages redeploys in about a minute. `.nojekyll` is present so GitHub serves the
files as-is rather than running them through Jekyll.
`tiktokX25QyjpirZdB83jfYzJYeGOErNPrkgPa.txt` is TikTok's domain-verification
file — do not remove it.

```bash
cd /home/loma/chartpedia/chartpedia-legal
git commit -aqm "..." && ./publish.sh
```

## App icon — must match TikTok exactly

TikTok app review rejects this site if the icon submitted in **Basic Info** is
not the icon shown on the website and in the browser tab. `assets/app-icon.png`
is the authoritative copy, pulled unmodified from the live
[@chartpediaofficial](https://www.tiktok.com/@chartpediaofficial) profile
avatar (800x800, circular black disc, "CHARTPEDIA" arced above an outlined open
book with a cyan rising arrow, "OFFICIAL" arced below).

Everything else is a pure LANCZOS downscale of that one file — no recolour, no
crop, no redraw:

| File | Size | Used by |
|---|---|---|
| `assets/app-icon.png` | 800x800 | source of truth, not referenced by any page |
| `assets/chartpedia-logo-512.png` | 512x512 | visible header logo on every page |
| `apple-touch-icon.png` | 180x180 | iOS home screen |
| `favicon-32x32.png` | 32x32 | browser tab |
| `favicon-16x16.png` | 16x16 | browser tab |
| `favicon.ico` | 16/32/48 | browser tab fallback |

If the brand mark ever changes, re-cut **all six** from the new master and
re-upload the same master to TikTok Basic Info in the same session. Note that
`/home/loma/chartpedia/assets/chartpedia_icon_1024.png` in the main repo is an
older, *different* icon (filled white book, cyan ring, no text) — do not use it
here.

## Contact address

`chartpediaofficial@gmail.com` — the Chartpedia channel account, used for the
YouTube channel and TikTok signup. To change it:

```bash
cd /home/loma/chartpedia/chartpedia-legal
sed -i "s/chartpediaofficial@gmail.com/new@address/g" *.html README.md
```
