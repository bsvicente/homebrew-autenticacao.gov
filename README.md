# homebrew-autenticacao.gov

Homebrew tap for the **Autenticação.gov** middleware (Cartão de Cidadão), the official Portuguese eID software for macOS. It installs the upstream signed `.pkg` from [amagovpt/autenticacao.gov](https://github.com/amagovpt/autenticacao.gov/releases).

## Install

```sh
brew tap bsvicente/autenticacao.gov
brew install --cask autenticacao-gov
```

The `.pkg` installer asks for your admin password.

### Install an older version

Each of the five previous stable releases has its own cask:

| Version | Install |
|---|---|
| 3.14.0 | `brew install --cask autenticacao-gov@3.14.0` |
| 3.13.3 | `brew install --cask autenticacao-gov@3.13.3` |
| 3.13.0 | `brew install --cask autenticacao-gov@3.13.0` |
| 3.12.0 | `brew install --cask autenticacao-gov@3.12.0` |
| 3.11.0 | `brew install --cask autenticacao-gov@3.11.0` |

Pinned casks install the same packages as the current one, so only one version can be installed at a time. To switch, uninstall first:

```sh
brew uninstall --cask autenticacao-gov        # or autenticacao-gov@<version>
brew install --cask autenticacao-gov@3.14.0
```

Installing a pinned cask while the current one is installed fails with a conflict message (`conflicts_with`).

## Upgrade and uninstall

```sh
brew upgrade --cask autenticacao-gov
brew uninstall --cask autenticacao-gov        # removes the installed packages
```

## How the casks are kept up to date

- `Casks/autenticacao-gov.rb` is always the latest stable release.
- A GitHub Actions workflow (`.github/workflows/autoupdate.yml`) runs daily at 02:00 UTC. It checks the upstream `releases/latest` endpoint and ignores pre-releases (names containing `beta`, `rc`, `alpha`, `dev` or `preview`).
- When a new release is found, the workflow:
  1. Copies the current cask to `Casks/autenticacao-gov@<old version>.rb`, so the previous version stays installable.
  2. Deletes the oldest pinned casks so only the **5 newest** are kept.
  3. Updates `version` and `sha256` in the main cask.
  4. Pushes a `cask-update-<version>` branch and opens a PR. Auto-merge is enabled, so the PR merges once it has an approval.

Pinned casks are written by hand once and then never edited by the workflow.

## Adding a pinned version by hand

Some releases use different pkg filenames, so copy an existing pinned cask and change:

1. The file name and `cask "..."` token: `autenticacao-gov@<version>`.
2. `version "<version>,<build>"`. The build number is in the pkg filename, or inside the pkg (`Distribution` file, `version="x.y.z.NNNN"`) when the filename omits it.
3. `sha256`: `shasum -a 256 <file>.pkg` on the downloaded release asset.
4. `url` and `pkg`: the exact asset filename on that release.

Check that the package IDs in `uninstall pkgutil:` still match (`pt.cartaodecidadao.{apps,bin,certs,lib}`).

## Contributing

`main` is protected:

- Changes go through a pull request.
- One approving review is required, and review threads must be resolved.
- Force pushes and branch deletion are blocked.
- Repository admins can bypass these rules.

Test a cask before opening a PR. `brew` is only available on macOS:

```sh
brew style --fix Casks/autenticacao-gov@<version>.rb
brew audit --cask --new autenticacao-gov@<version>   # after tapping locally
brew install --cask autenticacao-gov@<version>
```

## Troubleshooting

- **`Cask 'autenticacao-gov' is unavailable`** after a tap: run `brew update` and check the tap name.
- **Conflict when installing a pinned cask:** uninstall the current version first (see above).
- **Workflow run fails on "Could not find the .pkg file":** the upstream release changed its asset naming. Update the regex in the `Fetch latest release assets` step.
- **Workflow PR not opening:** the repo must allow GitHub Actions to create PRs (*Settings → Actions → General*) and have auto-merge enabled.

## Related

- Upstream project: https://github.com/amagovpt/autenticacao.gov
- Official downloads: https://www.autenticacao.gov.pt
