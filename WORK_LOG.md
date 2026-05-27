# Work Log

## 2026-05-27 07:02 | main | infra
Published Scribe 1.0.0 to the tap. Cut a `scribe-v1.0.0` GitHub release on `homebrew-tap` carrying the built zip from `insight-extractor/app/build/`, then bumped `Casks/scribe.rb` version + sha256 to match. The tap repo holds the release assets (not the source repo) because `insight-extractor` is the upstream codebase while distribution lives here — keeps the cask `url` self-contained to one repo.

## 2026-05-27 07:36 | main | infra
Published Scribe 1.0.1 — first notarized build. Upstream `release.sh` now passes `--notarize` to `bundle.sh`, so the shipped zip clears Gatekeeper without right-click-open. Verified `spctl -a` returns "Notarized Developer ID" and `stapler validate` passes before cutting the release.
