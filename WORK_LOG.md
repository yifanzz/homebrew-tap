# Work Log

## 2026-05-27 07:02 | main | infra
Published Scribe 1.0.0 to the tap. Cut a `scribe-v1.0.0` GitHub release on `homebrew-tap` carrying the built zip from `insight-extractor/app/build/`, then bumped `Casks/scribe.rb` version + sha256 to match. The tap repo holds the release assets (not the source repo) because `insight-extractor` is the upstream codebase while distribution lives here — keeps the cask `url` self-contained to one repo.

## 2026-05-27 07:36 | main | infra
Published Scribe 1.0.1 — first notarized build. Upstream `release.sh` now passes `--notarize` to `bundle.sh`, so the shipped zip clears Gatekeeper without right-click-open. Verified `spctl -a` returns "Notarized Developer ID" and `stapler validate` passes before cutting the release.

## 2026-06-11 00:50 | main | infra
Added `release-cli.sh` — publishes private-source Go CLIs as binary-only formula releases, extending the scribe/okclaw pattern (assets live on this public tap repo, source stays private). The leak-safety lives in the build flags (`-trimpath -buildvcs=false -ldflags "-s -w"`, CGO off): audited agent-lock and dotrun binaries with `strings` — no home paths, commit hashes, or credentials embedded. Formulas are fully regenerated each release from a heredoc template (deterministic, no sed-patching), tarballs are packed from an empty temp dir so only the bare binary ships, and the script refuses dirty source trees and runs `go test ./...` first.

## 2026-07-28 06:06 | main | infra
Published Scribe 1.0.2 — adds server pre-warm on dictation start. Verified against the *downloaded* asset rather than the local build: pulled the release zip back from GitHub, confirmed its sha256 matches the cask, and re-ran `spctl -a` ("Notarized Developer ID") + `stapler validate` on the extracted app. Cheap insurance against publishing a cask whose sha describes a file nobody can actually fetch.

Timing note for future publishes: cut the GitHub release *before* pushing the cask bump. Between those two steps the cask URL must already resolve, or a `brew update` landing in the gap gives users a 404.

Also carried along an unrelated July 6 commit that was sitting unpushed on main (`chore: sync baseline` — agent settings, pre-commit hook, CLAUDE.md template). Not mine; just unblocking the push.

## 2026-08-05 05:47 | main | infra
Bumped the scribe cask 1.0.2 → 1.0.4, skipping 1.0.3 entirely — 1.0.3 was
tagged and notarized in the app repo but never published here, and the built
app was hand-copied into /Applications instead. Net effect: brew's Caskroom
recorded 1.0.2 while the running app was 1.0.3, so `brew upgrade --cask scribe`
would have silently *downgraded* the machine. There is no release-app.sh here
(release-cli.sh only covers the Go formulae), so the app path is manual
gh-release + cask-edit and it is exactly the kind of step that gets skipped
when iterating locally. Worth automating if a third skipped version shows up.
