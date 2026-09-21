# homebrew-tap

Yifan's public Homebrew tap (`yifanzz/tap`). Holds the formula/cask text **and**
the release assets for a handful of personal tools. Ruby formula files, no build
system — the only executable here is `release-cli.sh`.

Global conventions (git discipline, WORK_LOG, verification, candor) live in
`~/code/docs/global/AGENTS.md` and load via `~/.claude/CLAUDE.md` — do not
duplicate them here. Cross-project knowledge: `~/code/docs/`.

## Project specifics

### The invariant: this repo is public, every source repo is private

Release assets are attached to releases on **this** repo, never the source repo.
The only public artifacts are the binary tarballs / app zips, the formula text,
and the release notes. Consequences an agent must not "fix":

- `homepage` points at this tap for **every** item. It is not laziness and not a
  copy-paste bug. Pointing it at a source repo yields a 404 for everyone except
  Yifan, since all sources are private.
- Leak-safety for the Go CLIs lives in the build flags in `release-cli.sh`
  (`-trimpath -buildvcs=false -ldflags "-s -w"`, `CGO_ENABLED=0`). Don't relax
  them — they keep home paths, commit hashes, and hostnames out of the binary.
- Tarballs are packed from an empty temp dir so only the bare binary ships.

### Two publish paths, only one automated

**Go CLIs (`Formula/`) — automated.** `./release-cli.sh <tool> <version>`
regenerates the formula from a heredoc template, commits, pushes, and cuts the
release. Formulas carry a "do not edit by hand" header: change the template in
the script, not the generated file. Adding a new CLI = add a case branch to the
registry table in `release-cli.sh` (source dir + desc). The script refuses a
dirty source tree and runs `go test ./...` first.

**macOS apps (`Casks/`) — manual.** No `release-app.sh` exists. The app repo
builds + notarizes, then here it's a hand-written `gh release create` plus a
version/sha edit in the cask. This is the step that gets skipped; see the
version-skew hazard below.

### Ordering and version rules

- **Cut the GitHub release _before_ pushing the formula/cask bump.** In the gap
  between the two, the url must already resolve or a `brew update` landing there
  gives users a 404.
- **Never skip a version in a cask.** A tagged-and-notarized version that was
  never published here leaves the Caskroom recording an older version than the
  app actually running, so `brew upgrade --cask` silently *downgrades* the
  machine. This has happened once (scribe 1.0.3).
- Verify against the **downloaded** asset, not the local build: pull the release
  file back from GitHub, confirm its sha256 matches the formula, and for apps
  re-run `spctl -a` + `stapler validate` on the extracted bundle.

### Naming gotcha

`agent-lock`'s source is `~/code/agent-queue` — the repo name and the tool name
differ. There is no `yifanzz/agent-lock` repo.

### Checks

`brew audit --tap yifanzz/tap` is the objective gate and currently passes clean.
The pre-commit hook (`.githooks`, via `core.hooksPath`) is the cross-project
baseline and is a no-op here — it detects no `package.json` / `go.mod` /
`pyproject.toml`, so it will not catch a malformed formula. Run `brew audit`
yourself after editing formula or cask text.
