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

## Contact address

`chartpediaofficial@gmail.com` — the Chartpedia channel account, used for the
YouTube channel and TikTok signup. To change it:

```bash
cd /home/loma/chartpedia/chartpedia-legal
sed -i "s/chartpediaofficial@gmail.com/new@address/g" *.html README.md
```
