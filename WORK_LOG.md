# Work Log

## 2026-05-27 07:02 | main | infra
Published Scribe 1.0.0 to the tap. Cut a `scribe-v1.0.0` GitHub release on `homebrew-tap` carrying the built zip from `insight-extractor/app/build/`, then bumped `Casks/scribe.rb` version + sha256 to match. The tap repo holds the release assets (not the source repo) because `insight-extractor` is the upstream codebase while distribution lives here — keeps the cask `url` self-contained to one repo.

## 2026-05-27 07:36 | main | infra
Published Scribe 1.0.1 — first notarized build. Upstream `release.sh` now passes `--notarize` to `bundle.sh`, so the shipped zip clears Gatekeeper without right-click-open. Verified `spctl -a` returns "Notarized Developer ID" and `stapler validate` passes before cutting the release.

## 2026-06-11 00:50 | main | infra
Added `release-cli.sh` — publishes private-source Go CLIs as binary-only formula releases, extending the scribe/okclaw pattern (assets live on this public tap repo, source stays private). The leak-safety lives in the build flags (`-trimpath -buildvcs=false -ldflags "-s -w"`, CGO off): audited agent-lock and dotrun binaries with `strings` — no home paths, commit hashes, or credentials embedded. Formulas are fully regenerated each release from a heredoc template (deterministic, no sed-patching), tarballs are packed from an empty temp dir so only the bare binary ships, and the script refuses dirty source trees and runs `go test ./...` first.
