# Known CVEs & hardening report

_Generated 2026-08-12 03:32 UTC._

Per published **stable release image**: known CVEs from a full Trivy scan (all
severities, OS + library packages, unfixable CVEs included). **Development / rolling
tags (`*-dev`) are not covered** -- they are plain-only and never Copa-patched.

## Hardening outcome

**No fixable CVE was available upstream for any image in this run.** Debian ships no fix for any of the 3510 distinct CVEs found, so Copa had nothing to patch.
 Some images have no `-hardened` tag this run (the severity gate failed or hardening was disabled); their rows are marked `unpatched`.

**Status legend:** `fixed` = Copa patched it (old → new version) · `residual` = still
present in the hardened image · `unpatched` = no hardened image was produced.

## Severity totals

| Severity | Distinct CVEs | Tabulated rows |
|----------|---------------|----------------|
| CRITICAL | 124 | 177 |
| HIGH | 1169 | 1664 |
| MEDIUM | 1124 | 1999 |
| LOW | 767 | 1955 |
| UNKNOWN | 327 | 592 |

## Not tabulated

**2410 `linux-libc-dev` rows (2410 distinct CVEs) are excluded from the tables.** These are Linux kernel *header* CVEs. A container runs on the host kernel, so they are not reachable inside these images. They remain in `cve-data.json`, uploaded as the `cve-report-json` artifact on the release run.

## CVEs by variant

Variants differ enormously. This table is the fastest way to see which image flavour
carries the CVE surface, and therefore which one to pick if you do not need its extras.

| Variant | Distinct CVEs | Image builds |
|---------|---------------|--------------|
| `max` | 3467 | 8 |
| `supervisord` | 754 | 8 |
| `debug` | 689 | 8 |
| `default` | 689 | 8 |
| `min` | 267 | 8 |

## Most-affected packages

| Package | Distinct CVEs | Image builds affected |
|---------|---------------|-----------------------|
| `chromium-sandbox` | 2537 | 1 |
| `binutils` | 56 | 5 |
| `binutils-aarch64-linux-gnu` | 56 | 5 |
| `binutils-common` | 56 | 5 |
| `libbinutils` | 56 | 5 |
| `libctf-nobfd0` | 56 | 5 |
| `libctf0` | 56 | 5 |
| `libgprofng0` | 56 | 5 |
| `libsframe1` | 56 | 5 |
| `libsoup2.4-1` | 51 | 7 |

_"Image builds" counts each architecture separately (amd64 and arm64 of one tag are
two builds), so these figures are larger than the arch-collapsed `Affects` column in
the detail tables. Both describe the same rows._

## Images

| Image | Arch | CRIT | HIGH | MED | LOW | UNK | Fixable | Hardening | Plain digest |
|-------|------|------|------|-----|-----|-----|---------|-----------|--------------|
| `php8.2-debug-v2.3` | arm64 | 34 | 379 | 1617 | 579 | 227 | 0 | not-produced | `5e683c456166` |
| `php8.2-debug-v3.8` | amd64 | 33 | 250 | 1036 | 534 | 278 | 0 | not-produced | `a86b515818f2` |
| `php8.2-debug-v3.8` | arm64 | 33 | 250 | 1036 | 534 | 278 | 0 | not-produced | `9e9bd66508c7` |
| `php8.2-max-v2.3` | arm64 | 126 | 1564 | 2792 | 1174 | 611 | 0 | not-produced | `126b7e52b0fa` |
| `php8.2-max-v3.8` | amd64 | 37 | 348 | 1284 | 784 | 460 | 0 | not-produced | `08b024504910` |
| `php8.2-max-v3.8` | arm64 | 37 | 347 | 1282 | 780 | 456 | 0 | not-produced | `f8ee03d350a2` |
| `php8.2-min-v2.3` | arm64 | 11 | 311 | 1433 | 323 | 188 | 0 | not-produced | `eaf2553ce7cb` |
| `php8.2-min-v3.8` | amd64 | 9 | 167 | 846 | 269 | 238 | 0 | not-produced | `55757fbc8e33` |
| `php8.2-min-v3.8` | arm64 | 9 | 167 | 846 | 269 | 238 | 0 | not-produced | `37205b729f28` |
| `php8.2-supervisord-v2.3` | arm64 | 40 | 418 | 1690 | 616 | 227 | 0 | not-produced | `a909349db471` |
| `php8.2-supervisord-v3.8` | amd64 | 36 | 286 | 1094 | 556 | 278 | 0 | not-produced | `d3cf28176e4d` |
| `php8.2-supervisord-v3.8` | arm64 | 36 | 286 | 1094 | 556 | 278 | 0 | not-produced | `e5c9cb4b3f9f` |
| `php8.2-v2.3` | arm64 | 34 | 379 | 1617 | 579 | 227 | 0 | not-produced | `a125437a5b95` |
| `php8.2-v3.8` | amd64 | 33 | 250 | 1036 | 534 | 278 | 0 | not-produced | `23b8a360b042` |
| `php8.2-v3.8` | arm64 | 33 | 250 | 1036 | 534 | 278 | 0 | not-produced | `4599e6784082` |
| `php8.3-debug-v3.8` | amd64 | 33 | 250 | 1036 | 534 | 278 | 0 | not-produced | `988f15e7be72` |
| `php8.3-debug-v3.8` | arm64 | 33 | 250 | 1036 | 534 | 278 | 0 | not-produced | `8584e23eff5b` |
| `php8.3-max-v3.8` | amd64 | 37 | 348 | 1284 | 784 | 460 | 0 | not-produced | `5a7d31149355` |
| `php8.3-max-v3.8` | arm64 | 37 | 347 | 1282 | 780 | 456 | 0 | not-produced | `66daac545469` |
| `php8.3-min-v3.8` | amd64 | 9 | 167 | 846 | 269 | 238 | 0 | not-produced | `5fff1ae3975e` |
| `php8.3-min-v3.8` | arm64 | 9 | 167 | 846 | 269 | 238 | 0 | not-produced | `8a28ecf3ccfd` |
| `php8.3-supervisord-v3.8` | amd64 | 36 | 286 | 1094 | 556 | 278 | 0 | not-produced | `ed55a411c306` |
| `php8.3-supervisord-v3.8` | arm64 | 36 | 286 | 1094 | 556 | 278 | 0 | not-produced | `464aa48c2ae7` |
| `php8.3-v3.8` | amd64 | 33 | 250 | 1036 | 534 | 278 | 0 | not-produced | `1f6a9608ed35` |
| `php8.3-v3.8` | arm64 | 33 | 250 | 1036 | 534 | 278 | 0 | not-produced | `8b28bede2696` |
| `php8.4-debug-v4.2` | amd64 | 33 | 250 | 1060 | 593 | 278 | 0 | not-produced | `3ea0cde291b2` |
| `php8.4-debug-v4.2` | arm64 | 33 | 250 | 1060 | 593 | 278 | 0 | not-produced | `c14bd2818e51` |
| `php8.4-max-v4.2` | amd64 | 37 | 348 | 1292 | 803 | 460 | 0 | not-produced | `5bee778bc7dd` |
| `php8.4-max-v4.2` | arm64 | 37 | 347 | 1290 | 799 | 456 | 0 | not-produced | `70f47df1eb5a` |
| `php8.4-min-v4.2` | amd64 | 9 | 167 | 846 | 269 | 238 | 0 | not-produced | `0ba5d308375f` |
| `php8.4-min-v4.2` | arm64 | 9 | 167 | 846 | 269 | 238 | 0 | not-produced | `7423d228d777` |
| `php8.4-supervisord-v4.2` | amd64 | 36 | 286 | 1118 | 615 | 278 | 0 | not-produced | `66e78425eea3` |
| `php8.4-supervisord-v4.2` | arm64 | 36 | 286 | 1118 | 615 | 278 | 0 | not-produced | `937e52aa3ff1` |
| `php8.4-v4.2` | amd64 | 33 | 250 | 1060 | 593 | 278 | 0 | not-produced | `f3a3da8d9044` |
| `php8.4-v4.2` | arm64 | 33 | 250 | 1060 | 593 | 278 | 0 | not-produced | `34abffa17790` |
| `php8.5-debug-v5.2` | arm64 | 34 | 284 | 618 | 1040 | 127 | 0 | not-produced | `e9b46ec9678c` |
| `php8.5-max-v5.2` | arm64 | 41 | 358 | 731 | 1182 | 299 | 0 | not-produced | `0ee98c09efff` |
| `php8.5-min-v5.2` | arm64 | 18 | 80 | 370 | 662 | 97 | 0 | not-produced | `0a600dfe9829` |
| `php8.5-supervisord-v5.2` | arm64 | 35 | 306 | 649 | 1061 | 127 | 0 | not-produced | `72827dee73dc` |
| `php8.5-v5.2` | arm64 | 34 | 284 | 618 | 1040 | 127 | 0 | not-produced | `b198543e7c89` |

_`CRIT`-`UNK` and `Fixable` above are **raw Trivy totals for the image as published**: unlike the tabulated counts earlier in this report they still include the 2410 un-tabulated `linux-libc-dev` rows, so they intentionally exceed every tabulated count above. A `CRIT`/`HIGH` here with no matching row in any detail table is a kernel-header CVE -- see **Not tabulated** above. `Fixable` is also measured across both OS and library packages, wider than the OS-packages-only scope of the scan that feeds Copa -- severity plays no part in that difference._

## Critical & high severity

| CVE | Severity | Package | Status | Affects |
|-----|----------|---------|--------|---------|
| [CVE-2024-0808](https://nvd.nist.gov/vuln/detail/CVE-2024-0808) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-1283](https://nvd.nist.gov/vuln/detail/CVE-2024-1283) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-1284](https://nvd.nist.gov/vuln/detail/CVE-2024-1284) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-3157](https://nvd.nist.gov/vuln/detail/CVE-2024-3157) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-4558](https://nvd.nist.gov/vuln/detail/CVE-2024-4558) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-4671](https://nvd.nist.gov/vuln/detail/CVE-2024-4671) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-4947](https://nvd.nist.gov/vuln/detail/CVE-2024-4947) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-5274](https://nvd.nist.gov/vuln/detail/CVE-2024-5274) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-6779](https://nvd.nist.gov/vuln/detail/CVE-2024-6779) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-7024](https://nvd.nist.gov/vuln/detail/CVE-2024-7024) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-7971](https://nvd.nist.gov/vuln/detail/CVE-2024-7971) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-9369](https://nvd.nist.gov/vuln/detail/CVE-2024-9369) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-10585](https://nvd.nist.gov/vuln/detail/CVE-2025-10585) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10931](https://nvd.nist.gov/vuln/detail/CVE-2026-10931) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10966](https://nvd.nist.gov/vuln/detail/CVE-2026-10966) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10971](https://nvd.nist.gov/vuln/detail/CVE-2026-10971) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10972](https://nvd.nist.gov/vuln/detail/CVE-2026-10972) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10974](https://nvd.nist.gov/vuln/detail/CVE-2026-10974) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10990](https://nvd.nist.gov/vuln/detail/CVE-2026-10990) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11002](https://nvd.nist.gov/vuln/detail/CVE-2026-11002) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11029](https://nvd.nist.gov/vuln/detail/CVE-2026-11029) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11113](https://nvd.nist.gov/vuln/detail/CVE-2026-11113) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11120](https://nvd.nist.gov/vuln/detail/CVE-2026-11120) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13032](https://nvd.nist.gov/vuln/detail/CVE-2026-13032) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13033](https://nvd.nist.gov/vuln/detail/CVE-2026-13033) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13038](https://nvd.nist.gov/vuln/detail/CVE-2026-13038) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13775](https://nvd.nist.gov/vuln/detail/CVE-2026-13775) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13776](https://nvd.nist.gov/vuln/detail/CVE-2026-13776) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13780](https://nvd.nist.gov/vuln/detail/CVE-2026-13780) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13781](https://nvd.nist.gov/vuln/detail/CVE-2026-13781) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13782](https://nvd.nist.gov/vuln/detail/CVE-2026-13782) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13785](https://nvd.nist.gov/vuln/detail/CVE-2026-13785) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-14101](https://nvd.nist.gov/vuln/detail/CVE-2026-14101) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-14104](https://nvd.nist.gov/vuln/detail/CVE-2026-14104) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-14106](https://nvd.nist.gov/vuln/detail/CVE-2026-14106) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-14109](https://nvd.nist.gov/vuln/detail/CVE-2026-14109) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-14120](https://nvd.nist.gov/vuln/detail/CVE-2026-14120) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-15764](https://nvd.nist.gov/vuln/detail/CVE-2026-15764) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-15765](https://nvd.nist.gov/vuln/detail/CVE-2026-15765) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17651](https://nvd.nist.gov/vuln/detail/CVE-2026-17651) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17652](https://nvd.nist.gov/vuln/detail/CVE-2026-17652) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17653](https://nvd.nist.gov/vuln/detail/CVE-2026-17653) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17654](https://nvd.nist.gov/vuln/detail/CVE-2026-17654) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17655](https://nvd.nist.gov/vuln/detail/CVE-2026-17655) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17656](https://nvd.nist.gov/vuln/detail/CVE-2026-17656) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-3061](https://nvd.nist.gov/vuln/detail/CVE-2026-3061) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-3062](https://nvd.nist.gov/vuln/detail/CVE-2026-3062) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-3913](https://nvd.nist.gov/vuln/detail/CVE-2026-3913) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4439](https://nvd.nist.gov/vuln/detail/CVE-2026-4439) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4440](https://nvd.nist.gov/vuln/detail/CVE-2026-4440) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4441](https://nvd.nist.gov/vuln/detail/CVE-2026-4441) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6296](https://nvd.nist.gov/vuln/detail/CVE-2026-6296) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7898](https://nvd.nist.gov/vuln/detail/CVE-2026-7898) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7910](https://nvd.nist.gov/vuln/detail/CVE-2026-7910) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8509](https://nvd.nist.gov/vuln/detail/CVE-2026-8509) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8510](https://nvd.nist.gov/vuln/detail/CVE-2026-8510) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8511](https://nvd.nist.gov/vuln/detail/CVE-2026-8511) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8512](https://nvd.nist.gov/vuln/detail/CVE-2026-8512) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8513](https://nvd.nist.gov/vuln/detail/CVE-2026-8513) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8514](https://nvd.nist.gov/vuln/detail/CVE-2026-8514) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8515](https://nvd.nist.gov/vuln/detail/CVE-2026-8515) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8516](https://nvd.nist.gov/vuln/detail/CVE-2026-8516) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8517](https://nvd.nist.gov/vuln/detail/CVE-2026-8517) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8518](https://nvd.nist.gov/vuln/detail/CVE-2026-8518) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8519](https://nvd.nist.gov/vuln/detail/CVE-2026-8519) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8520](https://nvd.nist.gov/vuln/detail/CVE-2026-8520) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8521](https://nvd.nist.gov/vuln/detail/CVE-2026-8521) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8522](https://nvd.nist.gov/vuln/detail/CVE-2026-8522) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9872](https://nvd.nist.gov/vuln/detail/CVE-2026-9872) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9873](https://nvd.nist.gov/vuln/detail/CVE-2026-9873) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9874](https://nvd.nist.gov/vuln/detail/CVE-2026-9874) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9875](https://nvd.nist.gov/vuln/detail/CVE-2026-9875) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9876](https://nvd.nist.gov/vuln/detail/CVE-2026-9876) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9878](https://nvd.nist.gov/vuln/detail/CVE-2026-9878) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9879](https://nvd.nist.gov/vuln/detail/CVE-2026-9879) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9880](https://nvd.nist.gov/vuln/detail/CVE-2026-9880) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9881](https://nvd.nist.gov/vuln/detail/CVE-2026-9881) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9883](https://nvd.nist.gov/vuln/detail/CVE-2026-9883) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9884](https://nvd.nist.gov/vuln/detail/CVE-2026-9884) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9885](https://nvd.nist.gov/vuln/detail/CVE-2026-9885) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9886](https://nvd.nist.gov/vuln/detail/CVE-2026-9886) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9888](https://nvd.nist.gov/vuln/detail/CVE-2026-9888) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9889](https://nvd.nist.gov/vuln/detail/CVE-2026-9889) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9890](https://nvd.nist.gov/vuln/detail/CVE-2026-9890) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9891](https://nvd.nist.gov/vuln/detail/CVE-2026-9891) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9892](https://nvd.nist.gov/vuln/detail/CVE-2026-9892) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9893](https://nvd.nist.gov/vuln/detail/CVE-2026-9893) | CRITICAL | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2023-23914](https://nvd.nist.gov/vuln/detail/CVE-2023-23914) | CRITICAL | `curl` | unpatched · no fix | 5 images · v2.3 |
| [CVE-2026-40687](https://nvd.nist.gov/vuln/detail/CVE-2026-40687) | CRITICAL | `exim4-base` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-40687](https://nvd.nist.gov/vuln/detail/CVE-2026-40687) | CRITICAL | `exim4-config` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-40687](https://nvd.nist.gov/vuln/detail/CVE-2026-40687) | CRITICAL | `exim4-daemon-light` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-56372](https://nvd.nist.gov/vuln/detail/CVE-2026-56372) | CRITICAL | `imagemagick` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-56372](https://nvd.nist.gov/vuln/detail/CVE-2026-56372) | CRITICAL | `imagemagick-7-common` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-56372](https://nvd.nist.gov/vuln/detail/CVE-2026-56372) | CRITICAL | `imagemagick-7.q16` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2023-6879](https://nvd.nist.gov/vuln/detail/CVE-2023-6879) | CRITICAL | `libaom0` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2021-4048](https://nvd.nist.gov/vuln/detail/CVE-2021-4048) | CRITICAL | `libblas3` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2023-23914](https://nvd.nist.gov/vuln/detail/CVE-2023-23914) | CRITICAL | `libcurl3-gnutls` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2023-23914](https://nvd.nist.gov/vuln/detail/CVE-2023-23914) | CRITICAL | `libcurl4` | unpatched · no fix | 5 images · v2.3 |
| [CVE-2019-8457](https://nvd.nist.gov/vuln/detail/CVE-2019-8457) | CRITICAL | `libdb5.3` | unpatched · no fix | 5 images · v2.3 |
| [CVE-2026-58016](https://nvd.nist.gov/vuln/detail/CVE-2026-58016) | CRITICAL | `libglib2.0-0` | unpatched · no fix | 16 images · v2.3, v3.8, v4.2 |
| [CVE-2026-58016](https://nvd.nist.gov/vuln/detail/CVE-2026-58016) | CRITICAL | `libglib2.0-0t64` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-58016](https://nvd.nist.gov/vuln/detail/CVE-2026-58016) | CRITICAL | `libglib2.0-data` | unpatched · no fix | 20 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2021-4048](https://nvd.nist.gov/vuln/detail/CVE-2021-4048) | CRITICAL | `liblapack3` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2019-16224](https://nvd.nist.gov/vuln/detail/CVE-2019-16224) | CRITICAL | `liblmdb0` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2019-16225](https://nvd.nist.gov/vuln/detail/CVE-2019-16225) | CRITICAL | `liblmdb0` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2019-16227](https://nvd.nist.gov/vuln/detail/CVE-2019-16227) | CRITICAL | `liblmdb0` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-56372](https://nvd.nist.gov/vuln/detail/CVE-2026-56372) | CRITICAL | `libmagickcore-7.q16-10` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-56372](https://nvd.nist.gov/vuln/detail/CVE-2026-56372) | CRITICAL | `libmagickcore-7.q16-10-extra` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-56372](https://nvd.nist.gov/vuln/detail/CVE-2026-56372) | CRITICAL | `libmagickwand-7.q16-10` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-44172](https://nvd.nist.gov/vuln/detail/CVE-2026-44172) | CRITICAL | `libmariadb3` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-49261](https://nvd.nist.gov/vuln/detail/CVE-2026-49261) | CRITICAL | `libmariadb3` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2021-26291](https://nvd.nist.gov/vuln/detail/CVE-2021-26291) | CRITICAL | `libmaven3-core-java` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-34873](https://nvd.nist.gov/vuln/detail/CVE-2026-34873) | CRITICAL | `libmbedcrypto16` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-34875](https://nvd.nist.gov/vuln/detail/CVE-2026-34875) | CRITICAL | `libmbedcrypto16` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2022-35409](https://nvd.nist.gov/vuln/detail/CVE-2022-35409) | CRITICAL | `libmbedcrypto3` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2026-34873](https://nvd.nist.gov/vuln/detail/CVE-2026-34873) | CRITICAL | `libmbedcrypto3` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2026-34875](https://nvd.nist.gov/vuln/detail/CVE-2026-34875) | CRITICAL | `libmbedcrypto3` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2025-47917](https://nvd.nist.gov/vuln/detail/CVE-2025-47917) | CRITICAL | `libmbedcrypto7` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-34873](https://nvd.nist.gov/vuln/detail/CVE-2026-34873) | CRITICAL | `libmbedcrypto7` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-34875](https://nvd.nist.gov/vuln/detail/CVE-2026-34875) | CRITICAL | `libmbedcrypto7` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2021-3756](https://nvd.nist.gov/vuln/detail/CVE-2021-3756) | CRITICAL | `libmysofa1` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2026-28500](https://nvd.nist.gov/vuln/detail/CVE-2026-28500) | CRITICAL | `libonnx1t64` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2023-5841](https://nvd.nist.gov/vuln/detail/CVE-2023-5841) | CRITICAL | `libopenexr-3-1-30` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-42216](https://nvd.nist.gov/vuln/detail/CVE-2026-42216) | CRITICAL | `libopenexr-3-1-30` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-42217](https://nvd.nist.gov/vuln/detail/CVE-2026-42217) | CRITICAL | `libopenexr-3-1-30` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-42216](https://nvd.nist.gov/vuln/detail/CVE-2026-42216) | CRITICAL | `libopenexr25` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2026-42217](https://nvd.nist.gov/vuln/detail/CVE-2026-42217) | CRITICAL | `libopenexr25` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2026-13221](https://nvd.nist.gov/vuln/detail/CVE-2026-13221) | CRITICAL | `libperl5.32` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2026-42496](https://nvd.nist.gov/vuln/detail/CVE-2026-42496) | CRITICAL | `libperl5.32` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2026-57433](https://nvd.nist.gov/vuln/detail/CVE-2026-57433) | CRITICAL | `libperl5.32` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2026-8376](https://nvd.nist.gov/vuln/detail/CVE-2026-8376) | CRITICAL | `libperl5.32` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2026-13221](https://nvd.nist.gov/vuln/detail/CVE-2026-13221) | CRITICAL | `libperl5.36` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-42496](https://nvd.nist.gov/vuln/detail/CVE-2026-42496) | CRITICAL | `libperl5.36` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-57433](https://nvd.nist.gov/vuln/detail/CVE-2026-57433) | CRITICAL | `libperl5.36` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-8376](https://nvd.nist.gov/vuln/detail/CVE-2026-8376) | CRITICAL | `libperl5.36` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-13221](https://nvd.nist.gov/vuln/detail/CVE-2026-13221) | CRITICAL | `libperl5.40` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-42496](https://nvd.nist.gov/vuln/detail/CVE-2026-42496) | CRITICAL | `libperl5.40` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-57433](https://nvd.nist.gov/vuln/detail/CVE-2026-57433) | CRITICAL | `libperl5.40` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-8376](https://nvd.nist.gov/vuln/detail/CVE-2026-8376) | CRITICAL | `libperl5.40` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-20884](https://nvd.nist.gov/vuln/detail/CVE-2026-20884) | CRITICAL | `libraw23t64` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-24450](https://nvd.nist.gov/vuln/detail/CVE-2026-24450) | CRITICAL | `libraw23t64` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-24660](https://nvd.nist.gov/vuln/detail/CVE-2026-24660) | CRITICAL | `libraw23t64` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-2369](https://nvd.nist.gov/vuln/detail/CVE-2026-2369) | CRITICAL | `libsoup-3.0-0` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-2369](https://nvd.nist.gov/vuln/detail/CVE-2026-2369) | CRITICAL | `libsoup-3.0-common` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-2369](https://nvd.nist.gov/vuln/detail/CVE-2026-2369) | CRITICAL | `libsoup-gnome2.4-1` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-2369](https://nvd.nist.gov/vuln/detail/CVE-2026-2369) | CRITICAL | `libsoup2.4-1` | unpatched · no fix | 4 images · v2.3, v3.8, v4.2 |
| [CVE-2026-2369](https://nvd.nist.gov/vuln/detail/CVE-2026-2369) | CRITICAL | `libsoup2.4-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2025-7458](https://nvd.nist.gov/vuln/detail/CVE-2025-7458) | CRITICAL | `libsqlite3-0` | unpatched · no fix | 15 images · v3.8, v4.2 |
| [CVE-2026-33278](https://nvd.nist.gov/vuln/detail/CVE-2026-33278) | CRITICAL | `libunbound8` | unpatched · no fix | 4 images · v2.3, v3.8, v4.2 |
| [CVE-2026-42960](https://nvd.nist.gov/vuln/detail/CVE-2026-42960) | CRITICAL | `libunbound8` | unpatched · no fix | 4 images · v2.3, v3.8, v4.2 |
| [CVE-2026-50252](https://nvd.nist.gov/vuln/detail/CVE-2026-50252) | CRITICAL | `libunbound8` | unpatched · no fix | 5 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-6653](https://nvd.nist.gov/vuln/detail/CVE-2026-6653) | CRITICAL | `libxml2` | unpatched · no fix | 25 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-44172](https://nvd.nist.gov/vuln/detail/CVE-2026-44172) | CRITICAL | `mariadb-common` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-49261](https://nvd.nist.gov/vuln/detail/CVE-2026-49261) | CRITICAL | `mariadb-common` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-60002](https://nvd.nist.gov/vuln/detail/CVE-2026-60002) | CRITICAL | `openssh-client` | unpatched · no fix | 20 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-13221](https://nvd.nist.gov/vuln/detail/CVE-2026-13221) | CRITICAL | `perl` | unpatched · no fix | 21 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-42496](https://nvd.nist.gov/vuln/detail/CVE-2026-42496) | CRITICAL | `perl` | unpatched · no fix | 21 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-57433](https://nvd.nist.gov/vuln/detail/CVE-2026-57433) | CRITICAL | `perl` | unpatched · no fix | 21 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-8376](https://nvd.nist.gov/vuln/detail/CVE-2026-8376) | CRITICAL | `perl` | unpatched · no fix | 21 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-13221](https://nvd.nist.gov/vuln/detail/CVE-2026-13221) | CRITICAL | `perl-base` | unpatched · no fix | 25 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-42496](https://nvd.nist.gov/vuln/detail/CVE-2026-42496) | CRITICAL | `perl-base` | unpatched · no fix | 25 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-57433](https://nvd.nist.gov/vuln/detail/CVE-2026-57433) | CRITICAL | `perl-base` | unpatched · no fix | 25 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-8376](https://nvd.nist.gov/vuln/detail/CVE-2026-8376) | CRITICAL | `perl-base` | unpatched · no fix | 25 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-13221](https://nvd.nist.gov/vuln/detail/CVE-2026-13221) | CRITICAL | `perl-modules-5.32` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2026-42496](https://nvd.nist.gov/vuln/detail/CVE-2026-42496) | CRITICAL | `perl-modules-5.32` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2026-57433](https://nvd.nist.gov/vuln/detail/CVE-2026-57433) | CRITICAL | `perl-modules-5.32` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2026-8376](https://nvd.nist.gov/vuln/detail/CVE-2026-8376) | CRITICAL | `perl-modules-5.32` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2026-13221](https://nvd.nist.gov/vuln/detail/CVE-2026-13221) | CRITICAL | `perl-modules-5.36` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-42496](https://nvd.nist.gov/vuln/detail/CVE-2026-42496) | CRITICAL | `perl-modules-5.36` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-57433](https://nvd.nist.gov/vuln/detail/CVE-2026-57433) | CRITICAL | `perl-modules-5.36` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-8376](https://nvd.nist.gov/vuln/detail/CVE-2026-8376) | CRITICAL | `perl-modules-5.36` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-13221](https://nvd.nist.gov/vuln/detail/CVE-2026-13221) | CRITICAL | `perl-modules-5.40` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-42496](https://nvd.nist.gov/vuln/detail/CVE-2026-42496) | CRITICAL | `perl-modules-5.40` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-57433](https://nvd.nist.gov/vuln/detail/CVE-2026-57433) | CRITICAL | `perl-modules-5.40` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-8376](https://nvd.nist.gov/vuln/detail/CVE-2026-8376) | CRITICAL | `perl-modules-5.40` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2023-45853](https://nvd.nist.gov/vuln/detail/CVE-2023-45853) | CRITICAL | `zlib1g` | unpatched · no fix | 20 images · v2.3, v3.8, v4.2 |
| [CVE-2023-45853](https://nvd.nist.gov/vuln/detail/CVE-2023-45853) | CRITICAL | `zlib1g-dev` | unpatched · no fix | 20 images · v2.3, v3.8, v4.2 |
| [CVE-2022-3715](https://nvd.nist.gov/vuln/detail/CVE-2022-3715) | HIGH | `bash` | unpatched · no fix | 5 images · v2.3 |
| [CVE-2026-53615](https://nvd.nist.gov/vuln/detail/CVE-2026-53615) | HIGH | `bsdutils` | unpatched · no fix | 25 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2024-0804](https://nvd.nist.gov/vuln/detail/CVE-2024-0804) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-0806](https://nvd.nist.gov/vuln/detail/CVE-2024-0806) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-0807](https://nvd.nist.gov/vuln/detail/CVE-2024-0807) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-0812](https://nvd.nist.gov/vuln/detail/CVE-2024-0812) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-0813](https://nvd.nist.gov/vuln/detail/CVE-2024-0813) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-10229](https://nvd.nist.gov/vuln/detail/CVE-2024-10229) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-10230](https://nvd.nist.gov/vuln/detail/CVE-2024-10230) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-10231](https://nvd.nist.gov/vuln/detail/CVE-2024-10231) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-10487](https://nvd.nist.gov/vuln/detail/CVE-2024-10487) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-10488](https://nvd.nist.gov/vuln/detail/CVE-2024-10488) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-1059](https://nvd.nist.gov/vuln/detail/CVE-2024-1059) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-1060](https://nvd.nist.gov/vuln/detail/CVE-2024-1060) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-1077](https://nvd.nist.gov/vuln/detail/CVE-2024-1077) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-10826](https://nvd.nist.gov/vuln/detail/CVE-2024-10826) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-10827](https://nvd.nist.gov/vuln/detail/CVE-2024-10827) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-11112](https://nvd.nist.gov/vuln/detail/CVE-2024-11112) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-11113](https://nvd.nist.gov/vuln/detail/CVE-2024-11113) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-11114](https://nvd.nist.gov/vuln/detail/CVE-2024-11114) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-11115](https://nvd.nist.gov/vuln/detail/CVE-2024-11115) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-12053](https://nvd.nist.gov/vuln/detail/CVE-2024-12053) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-12381](https://nvd.nist.gov/vuln/detail/CVE-2024-12381) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-12382](https://nvd.nist.gov/vuln/detail/CVE-2024-12382) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-12692](https://nvd.nist.gov/vuln/detail/CVE-2024-12692) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-12693](https://nvd.nist.gov/vuln/detail/CVE-2024-12693) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-12694](https://nvd.nist.gov/vuln/detail/CVE-2024-12694) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-12695](https://nvd.nist.gov/vuln/detail/CVE-2024-12695) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-1669](https://nvd.nist.gov/vuln/detail/CVE-2024-1669) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-1670](https://nvd.nist.gov/vuln/detail/CVE-2024-1670) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-1673](https://nvd.nist.gov/vuln/detail/CVE-2024-1673) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-1674](https://nvd.nist.gov/vuln/detail/CVE-2024-1674) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-1675](https://nvd.nist.gov/vuln/detail/CVE-2024-1675) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-1938](https://nvd.nist.gov/vuln/detail/CVE-2024-1938) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-1939](https://nvd.nist.gov/vuln/detail/CVE-2024-1939) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-2173](https://nvd.nist.gov/vuln/detail/CVE-2024-2173) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-2174](https://nvd.nist.gov/vuln/detail/CVE-2024-2174) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-2176](https://nvd.nist.gov/vuln/detail/CVE-2024-2176) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-2400](https://nvd.nist.gov/vuln/detail/CVE-2024-2400) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-2625](https://nvd.nist.gov/vuln/detail/CVE-2024-2625) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-2627](https://nvd.nist.gov/vuln/detail/CVE-2024-2627) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-2883](https://nvd.nist.gov/vuln/detail/CVE-2024-2883) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-2885](https://nvd.nist.gov/vuln/detail/CVE-2024-2885) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-2886](https://nvd.nist.gov/vuln/detail/CVE-2024-2886) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-2887](https://nvd.nist.gov/vuln/detail/CVE-2024-2887) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-3156](https://nvd.nist.gov/vuln/detail/CVE-2024-3156) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-3158](https://nvd.nist.gov/vuln/detail/CVE-2024-3158) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-3159](https://nvd.nist.gov/vuln/detail/CVE-2024-3159) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-3168](https://nvd.nist.gov/vuln/detail/CVE-2024-3168) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-3169](https://nvd.nist.gov/vuln/detail/CVE-2024-3169) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-3170](https://nvd.nist.gov/vuln/detail/CVE-2024-3170) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-3171](https://nvd.nist.gov/vuln/detail/CVE-2024-3171) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-3172](https://nvd.nist.gov/vuln/detail/CVE-2024-3172) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-3832](https://nvd.nist.gov/vuln/detail/CVE-2024-3832) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-3833](https://nvd.nist.gov/vuln/detail/CVE-2024-3833) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-3834](https://nvd.nist.gov/vuln/detail/CVE-2024-3834) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-3837](https://nvd.nist.gov/vuln/detail/CVE-2024-3837) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-3840](https://nvd.nist.gov/vuln/detail/CVE-2024-3840) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-4058](https://nvd.nist.gov/vuln/detail/CVE-2024-4058) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-4331](https://nvd.nist.gov/vuln/detail/CVE-2024-4331) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-4368](https://nvd.nist.gov/vuln/detail/CVE-2024-4368) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-4761](https://nvd.nist.gov/vuln/detail/CVE-2024-4761) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-5157](https://nvd.nist.gov/vuln/detail/CVE-2024-5157) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-5158](https://nvd.nist.gov/vuln/detail/CVE-2024-5158) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-5159](https://nvd.nist.gov/vuln/detail/CVE-2024-5159) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-5160](https://nvd.nist.gov/vuln/detail/CVE-2024-5160) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-5493](https://nvd.nist.gov/vuln/detail/CVE-2024-5493) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-5494](https://nvd.nist.gov/vuln/detail/CVE-2024-5494) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-5495](https://nvd.nist.gov/vuln/detail/CVE-2024-5495) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-5496](https://nvd.nist.gov/vuln/detail/CVE-2024-5496) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-5497](https://nvd.nist.gov/vuln/detail/CVE-2024-5497) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-5498](https://nvd.nist.gov/vuln/detail/CVE-2024-5498) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-5499](https://nvd.nist.gov/vuln/detail/CVE-2024-5499) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-5830](https://nvd.nist.gov/vuln/detail/CVE-2024-5830) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-5831](https://nvd.nist.gov/vuln/detail/CVE-2024-5831) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-5832](https://nvd.nist.gov/vuln/detail/CVE-2024-5832) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-5833](https://nvd.nist.gov/vuln/detail/CVE-2024-5833) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-5834](https://nvd.nist.gov/vuln/detail/CVE-2024-5834) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-5835](https://nvd.nist.gov/vuln/detail/CVE-2024-5835) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-5836](https://nvd.nist.gov/vuln/detail/CVE-2024-5836) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-5837](https://nvd.nist.gov/vuln/detail/CVE-2024-5837) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-5838](https://nvd.nist.gov/vuln/detail/CVE-2024-5838) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-5841](https://nvd.nist.gov/vuln/detail/CVE-2024-5841) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-5842](https://nvd.nist.gov/vuln/detail/CVE-2024-5842) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-5844](https://nvd.nist.gov/vuln/detail/CVE-2024-5844) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-5845](https://nvd.nist.gov/vuln/detail/CVE-2024-5845) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-5846](https://nvd.nist.gov/vuln/detail/CVE-2024-5846) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-5847](https://nvd.nist.gov/vuln/detail/CVE-2024-5847) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-6100](https://nvd.nist.gov/vuln/detail/CVE-2024-6100) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-6101](https://nvd.nist.gov/vuln/detail/CVE-2024-6101) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-6102](https://nvd.nist.gov/vuln/detail/CVE-2024-6102) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-6103](https://nvd.nist.gov/vuln/detail/CVE-2024-6103) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-6290](https://nvd.nist.gov/vuln/detail/CVE-2024-6290) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-6291](https://nvd.nist.gov/vuln/detail/CVE-2024-6291) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-6292](https://nvd.nist.gov/vuln/detail/CVE-2024-6292) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-6293](https://nvd.nist.gov/vuln/detail/CVE-2024-6293) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-6772](https://nvd.nist.gov/vuln/detail/CVE-2024-6772) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-6773](https://nvd.nist.gov/vuln/detail/CVE-2024-6773) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-6774](https://nvd.nist.gov/vuln/detail/CVE-2024-6774) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-6775](https://nvd.nist.gov/vuln/detail/CVE-2024-6775) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-6776](https://nvd.nist.gov/vuln/detail/CVE-2024-6776) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-6778](https://nvd.nist.gov/vuln/detail/CVE-2024-6778) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-6988](https://nvd.nist.gov/vuln/detail/CVE-2024-6988) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-6989](https://nvd.nist.gov/vuln/detail/CVE-2024-6989) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-6990](https://nvd.nist.gov/vuln/detail/CVE-2024-6990) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-6991](https://nvd.nist.gov/vuln/detail/CVE-2024-6991) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-6994](https://nvd.nist.gov/vuln/detail/CVE-2024-6994) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-6997](https://nvd.nist.gov/vuln/detail/CVE-2024-6997) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-6998](https://nvd.nist.gov/vuln/detail/CVE-2024-6998) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-7000](https://nvd.nist.gov/vuln/detail/CVE-2024-7000) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-7017](https://nvd.nist.gov/vuln/detail/CVE-2024-7017) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-7018](https://nvd.nist.gov/vuln/detail/CVE-2024-7018) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-7025](https://nvd.nist.gov/vuln/detail/CVE-2024-7025) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-7255](https://nvd.nist.gov/vuln/detail/CVE-2024-7255) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-7256](https://nvd.nist.gov/vuln/detail/CVE-2024-7256) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-7532](https://nvd.nist.gov/vuln/detail/CVE-2024-7532) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-7533](https://nvd.nist.gov/vuln/detail/CVE-2024-7533) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-7534](https://nvd.nist.gov/vuln/detail/CVE-2024-7534) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-7535](https://nvd.nist.gov/vuln/detail/CVE-2024-7535) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-7536](https://nvd.nist.gov/vuln/detail/CVE-2024-7536) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-7550](https://nvd.nist.gov/vuln/detail/CVE-2024-7550) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-7964](https://nvd.nist.gov/vuln/detail/CVE-2024-7964) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-7965](https://nvd.nist.gov/vuln/detail/CVE-2024-7965) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-7966](https://nvd.nist.gov/vuln/detail/CVE-2024-7966) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-7967](https://nvd.nist.gov/vuln/detail/CVE-2024-7967) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-7968](https://nvd.nist.gov/vuln/detail/CVE-2024-7968) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-7969](https://nvd.nist.gov/vuln/detail/CVE-2024-7969) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-7970](https://nvd.nist.gov/vuln/detail/CVE-2024-7970) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-7972](https://nvd.nist.gov/vuln/detail/CVE-2024-7972) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-7973](https://nvd.nist.gov/vuln/detail/CVE-2024-7973) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-7974](https://nvd.nist.gov/vuln/detail/CVE-2024-7974) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-7977](https://nvd.nist.gov/vuln/detail/CVE-2024-7977) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-7979](https://nvd.nist.gov/vuln/detail/CVE-2024-7979) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-7980](https://nvd.nist.gov/vuln/detail/CVE-2024-7980) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-8193](https://nvd.nist.gov/vuln/detail/CVE-2024-8193) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-8194](https://nvd.nist.gov/vuln/detail/CVE-2024-8194) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-8198](https://nvd.nist.gov/vuln/detail/CVE-2024-8198) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-8362](https://nvd.nist.gov/vuln/detail/CVE-2024-8362) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-8636](https://nvd.nist.gov/vuln/detail/CVE-2024-8636) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-8637](https://nvd.nist.gov/vuln/detail/CVE-2024-8637) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-8638](https://nvd.nist.gov/vuln/detail/CVE-2024-8638) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-8639](https://nvd.nist.gov/vuln/detail/CVE-2024-8639) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-8904](https://nvd.nist.gov/vuln/detail/CVE-2024-8904) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-8905](https://nvd.nist.gov/vuln/detail/CVE-2024-8905) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-9120](https://nvd.nist.gov/vuln/detail/CVE-2024-9120) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-9121](https://nvd.nist.gov/vuln/detail/CVE-2024-9121) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-9122](https://nvd.nist.gov/vuln/detail/CVE-2024-9122) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-9123](https://nvd.nist.gov/vuln/detail/CVE-2024-9123) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-9602](https://nvd.nist.gov/vuln/detail/CVE-2024-9602) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-9603](https://nvd.nist.gov/vuln/detail/CVE-2024-9603) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-9859](https://nvd.nist.gov/vuln/detail/CVE-2024-9859) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-9954](https://nvd.nist.gov/vuln/detail/CVE-2024-9954) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-9955](https://nvd.nist.gov/vuln/detail/CVE-2024-9955) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-9956](https://nvd.nist.gov/vuln/detail/CVE-2024-9956) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-9957](https://nvd.nist.gov/vuln/detail/CVE-2024-9957) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-9959](https://nvd.nist.gov/vuln/detail/CVE-2024-9959) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-9960](https://nvd.nist.gov/vuln/detail/CVE-2024-9960) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-9961](https://nvd.nist.gov/vuln/detail/CVE-2024-9961) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2024-9965](https://nvd.nist.gov/vuln/detail/CVE-2024-9965) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-0291](https://nvd.nist.gov/vuln/detail/CVE-2025-0291) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-0437](https://nvd.nist.gov/vuln/detail/CVE-2025-0437) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-0611](https://nvd.nist.gov/vuln/detail/CVE-2025-0611) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-0612](https://nvd.nist.gov/vuln/detail/CVE-2025-0612) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-10501](https://nvd.nist.gov/vuln/detail/CVE-2025-10501) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-10892](https://nvd.nist.gov/vuln/detail/CVE-2025-10892) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-11205](https://nvd.nist.gov/vuln/detail/CVE-2025-11205) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-11206](https://nvd.nist.gov/vuln/detail/CVE-2025-11206) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-11458](https://nvd.nist.gov/vuln/detail/CVE-2025-11458) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-11460](https://nvd.nist.gov/vuln/detail/CVE-2025-11460) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-11756](https://nvd.nist.gov/vuln/detail/CVE-2025-11756) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-12036](https://nvd.nist.gov/vuln/detail/CVE-2025-12036) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-12428](https://nvd.nist.gov/vuln/detail/CVE-2025-12428) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-12429](https://nvd.nist.gov/vuln/detail/CVE-2025-12429) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-12430](https://nvd.nist.gov/vuln/detail/CVE-2025-12430) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-12431](https://nvd.nist.gov/vuln/detail/CVE-2025-12431) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-12432](https://nvd.nist.gov/vuln/detail/CVE-2025-12432) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-12433](https://nvd.nist.gov/vuln/detail/CVE-2025-12433) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-12438](https://nvd.nist.gov/vuln/detail/CVE-2025-12438) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-12727](https://nvd.nist.gov/vuln/detail/CVE-2025-12727) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-13042](https://nvd.nist.gov/vuln/detail/CVE-2025-13042) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-13223](https://nvd.nist.gov/vuln/detail/CVE-2025-13223) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-13224](https://nvd.nist.gov/vuln/detail/CVE-2025-13224) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-13226](https://nvd.nist.gov/vuln/detail/CVE-2025-13226) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-13227](https://nvd.nist.gov/vuln/detail/CVE-2025-13227) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-13228](https://nvd.nist.gov/vuln/detail/CVE-2025-13228) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-13229](https://nvd.nist.gov/vuln/detail/CVE-2025-13229) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-13230](https://nvd.nist.gov/vuln/detail/CVE-2025-13230) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-13630](https://nvd.nist.gov/vuln/detail/CVE-2025-13630) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-13632](https://nvd.nist.gov/vuln/detail/CVE-2025-13632) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-13633](https://nvd.nist.gov/vuln/detail/CVE-2025-13633) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-13639](https://nvd.nist.gov/vuln/detail/CVE-2025-13639) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-14765](https://nvd.nist.gov/vuln/detail/CVE-2025-14765) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-14766](https://nvd.nist.gov/vuln/detail/CVE-2025-14766) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-2137](https://nvd.nist.gov/vuln/detail/CVE-2025-2137) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-3067](https://nvd.nist.gov/vuln/detail/CVE-2025-3067) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-5283](https://nvd.nist.gov/vuln/detail/CVE-2025-5283) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-6554](https://nvd.nist.gov/vuln/detail/CVE-2025-6554) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-6558](https://nvd.nist.gov/vuln/detail/CVE-2025-6558) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-7656](https://nvd.nist.gov/vuln/detail/CVE-2025-7656) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-0899](https://nvd.nist.gov/vuln/detail/CVE-2026-0899) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-0900](https://nvd.nist.gov/vuln/detail/CVE-2026-0900) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10000](https://nvd.nist.gov/vuln/detail/CVE-2026-10000) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10001](https://nvd.nist.gov/vuln/detail/CVE-2026-10001) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10002](https://nvd.nist.gov/vuln/detail/CVE-2026-10002) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10003](https://nvd.nist.gov/vuln/detail/CVE-2026-10003) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10005](https://nvd.nist.gov/vuln/detail/CVE-2026-10005) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10006](https://nvd.nist.gov/vuln/detail/CVE-2026-10006) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10007](https://nvd.nist.gov/vuln/detail/CVE-2026-10007) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10008](https://nvd.nist.gov/vuln/detail/CVE-2026-10008) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10009](https://nvd.nist.gov/vuln/detail/CVE-2026-10009) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10010](https://nvd.nist.gov/vuln/detail/CVE-2026-10010) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10011](https://nvd.nist.gov/vuln/detail/CVE-2026-10011) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10012](https://nvd.nist.gov/vuln/detail/CVE-2026-10012) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10013](https://nvd.nist.gov/vuln/detail/CVE-2026-10013) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10014](https://nvd.nist.gov/vuln/detail/CVE-2026-10014) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10015](https://nvd.nist.gov/vuln/detail/CVE-2026-10015) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10016](https://nvd.nist.gov/vuln/detail/CVE-2026-10016) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10019](https://nvd.nist.gov/vuln/detail/CVE-2026-10019) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10881](https://nvd.nist.gov/vuln/detail/CVE-2026-10881) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10882](https://nvd.nist.gov/vuln/detail/CVE-2026-10882) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10883](https://nvd.nist.gov/vuln/detail/CVE-2026-10883) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10884](https://nvd.nist.gov/vuln/detail/CVE-2026-10884) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10885](https://nvd.nist.gov/vuln/detail/CVE-2026-10885) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10886](https://nvd.nist.gov/vuln/detail/CVE-2026-10886) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10887](https://nvd.nist.gov/vuln/detail/CVE-2026-10887) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10888](https://nvd.nist.gov/vuln/detail/CVE-2026-10888) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10889](https://nvd.nist.gov/vuln/detail/CVE-2026-10889) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10890](https://nvd.nist.gov/vuln/detail/CVE-2026-10890) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10891](https://nvd.nist.gov/vuln/detail/CVE-2026-10891) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10892](https://nvd.nist.gov/vuln/detail/CVE-2026-10892) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10893](https://nvd.nist.gov/vuln/detail/CVE-2026-10893) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10894](https://nvd.nist.gov/vuln/detail/CVE-2026-10894) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10895](https://nvd.nist.gov/vuln/detail/CVE-2026-10895) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10896](https://nvd.nist.gov/vuln/detail/CVE-2026-10896) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10897](https://nvd.nist.gov/vuln/detail/CVE-2026-10897) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10898](https://nvd.nist.gov/vuln/detail/CVE-2026-10898) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10899](https://nvd.nist.gov/vuln/detail/CVE-2026-10899) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10900](https://nvd.nist.gov/vuln/detail/CVE-2026-10900) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10901](https://nvd.nist.gov/vuln/detail/CVE-2026-10901) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10902](https://nvd.nist.gov/vuln/detail/CVE-2026-10902) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10903](https://nvd.nist.gov/vuln/detail/CVE-2026-10903) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10904](https://nvd.nist.gov/vuln/detail/CVE-2026-10904) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10905](https://nvd.nist.gov/vuln/detail/CVE-2026-10905) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10906](https://nvd.nist.gov/vuln/detail/CVE-2026-10906) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10907](https://nvd.nist.gov/vuln/detail/CVE-2026-10907) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10908](https://nvd.nist.gov/vuln/detail/CVE-2026-10908) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10909](https://nvd.nist.gov/vuln/detail/CVE-2026-10909) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10910](https://nvd.nist.gov/vuln/detail/CVE-2026-10910) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10911](https://nvd.nist.gov/vuln/detail/CVE-2026-10911) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10912](https://nvd.nist.gov/vuln/detail/CVE-2026-10912) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10913](https://nvd.nist.gov/vuln/detail/CVE-2026-10913) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10914](https://nvd.nist.gov/vuln/detail/CVE-2026-10914) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10915](https://nvd.nist.gov/vuln/detail/CVE-2026-10915) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10916](https://nvd.nist.gov/vuln/detail/CVE-2026-10916) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10917](https://nvd.nist.gov/vuln/detail/CVE-2026-10917) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10918](https://nvd.nist.gov/vuln/detail/CVE-2026-10918) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10919](https://nvd.nist.gov/vuln/detail/CVE-2026-10919) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10920](https://nvd.nist.gov/vuln/detail/CVE-2026-10920) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10921](https://nvd.nist.gov/vuln/detail/CVE-2026-10921) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10922](https://nvd.nist.gov/vuln/detail/CVE-2026-10922) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10923](https://nvd.nist.gov/vuln/detail/CVE-2026-10923) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10924](https://nvd.nist.gov/vuln/detail/CVE-2026-10924) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10925](https://nvd.nist.gov/vuln/detail/CVE-2026-10925) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10926](https://nvd.nist.gov/vuln/detail/CVE-2026-10926) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10927](https://nvd.nist.gov/vuln/detail/CVE-2026-10927) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10928](https://nvd.nist.gov/vuln/detail/CVE-2026-10928) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10929](https://nvd.nist.gov/vuln/detail/CVE-2026-10929) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10930](https://nvd.nist.gov/vuln/detail/CVE-2026-10930) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10932](https://nvd.nist.gov/vuln/detail/CVE-2026-10932) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10933](https://nvd.nist.gov/vuln/detail/CVE-2026-10933) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10934](https://nvd.nist.gov/vuln/detail/CVE-2026-10934) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10935](https://nvd.nist.gov/vuln/detail/CVE-2026-10935) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10936](https://nvd.nist.gov/vuln/detail/CVE-2026-10936) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10939](https://nvd.nist.gov/vuln/detail/CVE-2026-10939) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10940](https://nvd.nist.gov/vuln/detail/CVE-2026-10940) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10941](https://nvd.nist.gov/vuln/detail/CVE-2026-10941) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10942](https://nvd.nist.gov/vuln/detail/CVE-2026-10942) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10943](https://nvd.nist.gov/vuln/detail/CVE-2026-10943) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10944](https://nvd.nist.gov/vuln/detail/CVE-2026-10944) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10945](https://nvd.nist.gov/vuln/detail/CVE-2026-10945) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10946](https://nvd.nist.gov/vuln/detail/CVE-2026-10946) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10947](https://nvd.nist.gov/vuln/detail/CVE-2026-10947) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10948](https://nvd.nist.gov/vuln/detail/CVE-2026-10948) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10949](https://nvd.nist.gov/vuln/detail/CVE-2026-10949) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10950](https://nvd.nist.gov/vuln/detail/CVE-2026-10950) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10951](https://nvd.nist.gov/vuln/detail/CVE-2026-10951) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10952](https://nvd.nist.gov/vuln/detail/CVE-2026-10952) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10953](https://nvd.nist.gov/vuln/detail/CVE-2026-10953) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10954](https://nvd.nist.gov/vuln/detail/CVE-2026-10954) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10955](https://nvd.nist.gov/vuln/detail/CVE-2026-10955) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10956](https://nvd.nist.gov/vuln/detail/CVE-2026-10956) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10957](https://nvd.nist.gov/vuln/detail/CVE-2026-10957) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10958](https://nvd.nist.gov/vuln/detail/CVE-2026-10958) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10959](https://nvd.nist.gov/vuln/detail/CVE-2026-10959) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10960](https://nvd.nist.gov/vuln/detail/CVE-2026-10960) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10961](https://nvd.nist.gov/vuln/detail/CVE-2026-10961) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10962](https://nvd.nist.gov/vuln/detail/CVE-2026-10962) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10963](https://nvd.nist.gov/vuln/detail/CVE-2026-10963) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10964](https://nvd.nist.gov/vuln/detail/CVE-2026-10964) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10965](https://nvd.nist.gov/vuln/detail/CVE-2026-10965) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10967](https://nvd.nist.gov/vuln/detail/CVE-2026-10967) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10968](https://nvd.nist.gov/vuln/detail/CVE-2026-10968) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10969](https://nvd.nist.gov/vuln/detail/CVE-2026-10969) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10970](https://nvd.nist.gov/vuln/detail/CVE-2026-10970) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10973](https://nvd.nist.gov/vuln/detail/CVE-2026-10973) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10975](https://nvd.nist.gov/vuln/detail/CVE-2026-10975) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10976](https://nvd.nist.gov/vuln/detail/CVE-2026-10976) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10977](https://nvd.nist.gov/vuln/detail/CVE-2026-10977) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10978](https://nvd.nist.gov/vuln/detail/CVE-2026-10978) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10979](https://nvd.nist.gov/vuln/detail/CVE-2026-10979) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10980](https://nvd.nist.gov/vuln/detail/CVE-2026-10980) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10981](https://nvd.nist.gov/vuln/detail/CVE-2026-10981) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10982](https://nvd.nist.gov/vuln/detail/CVE-2026-10982) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10983](https://nvd.nist.gov/vuln/detail/CVE-2026-10983) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10984](https://nvd.nist.gov/vuln/detail/CVE-2026-10984) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10985](https://nvd.nist.gov/vuln/detail/CVE-2026-10985) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10986](https://nvd.nist.gov/vuln/detail/CVE-2026-10986) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10987](https://nvd.nist.gov/vuln/detail/CVE-2026-10987) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10988](https://nvd.nist.gov/vuln/detail/CVE-2026-10988) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10989](https://nvd.nist.gov/vuln/detail/CVE-2026-10989) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-10995](https://nvd.nist.gov/vuln/detail/CVE-2026-10995) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11102](https://nvd.nist.gov/vuln/detail/CVE-2026-11102) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11628](https://nvd.nist.gov/vuln/detail/CVE-2026-11628) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11629](https://nvd.nist.gov/vuln/detail/CVE-2026-11629) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11630](https://nvd.nist.gov/vuln/detail/CVE-2026-11630) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11631](https://nvd.nist.gov/vuln/detail/CVE-2026-11631) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11632](https://nvd.nist.gov/vuln/detail/CVE-2026-11632) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11633](https://nvd.nist.gov/vuln/detail/CVE-2026-11633) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11634](https://nvd.nist.gov/vuln/detail/CVE-2026-11634) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11635](https://nvd.nist.gov/vuln/detail/CVE-2026-11635) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11636](https://nvd.nist.gov/vuln/detail/CVE-2026-11636) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11637](https://nvd.nist.gov/vuln/detail/CVE-2026-11637) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11638](https://nvd.nist.gov/vuln/detail/CVE-2026-11638) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11639](https://nvd.nist.gov/vuln/detail/CVE-2026-11639) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11640](https://nvd.nist.gov/vuln/detail/CVE-2026-11640) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11641](https://nvd.nist.gov/vuln/detail/CVE-2026-11641) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11642](https://nvd.nist.gov/vuln/detail/CVE-2026-11642) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11643](https://nvd.nist.gov/vuln/detail/CVE-2026-11643) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11644](https://nvd.nist.gov/vuln/detail/CVE-2026-11644) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11645](https://nvd.nist.gov/vuln/detail/CVE-2026-11645) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11646](https://nvd.nist.gov/vuln/detail/CVE-2026-11646) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11647](https://nvd.nist.gov/vuln/detail/CVE-2026-11647) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11648](https://nvd.nist.gov/vuln/detail/CVE-2026-11648) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11649](https://nvd.nist.gov/vuln/detail/CVE-2026-11649) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11650](https://nvd.nist.gov/vuln/detail/CVE-2026-11650) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11651](https://nvd.nist.gov/vuln/detail/CVE-2026-11651) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11652](https://nvd.nist.gov/vuln/detail/CVE-2026-11652) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11654](https://nvd.nist.gov/vuln/detail/CVE-2026-11654) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11655](https://nvd.nist.gov/vuln/detail/CVE-2026-11655) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11656](https://nvd.nist.gov/vuln/detail/CVE-2026-11656) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11657](https://nvd.nist.gov/vuln/detail/CVE-2026-11657) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11659](https://nvd.nist.gov/vuln/detail/CVE-2026-11659) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11660](https://nvd.nist.gov/vuln/detail/CVE-2026-11660) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11661](https://nvd.nist.gov/vuln/detail/CVE-2026-11661) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11662](https://nvd.nist.gov/vuln/detail/CVE-2026-11662) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11663](https://nvd.nist.gov/vuln/detail/CVE-2026-11663) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11664](https://nvd.nist.gov/vuln/detail/CVE-2026-11664) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11665](https://nvd.nist.gov/vuln/detail/CVE-2026-11665) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11667](https://nvd.nist.gov/vuln/detail/CVE-2026-11667) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11668](https://nvd.nist.gov/vuln/detail/CVE-2026-11668) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11669](https://nvd.nist.gov/vuln/detail/CVE-2026-11669) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11670](https://nvd.nist.gov/vuln/detail/CVE-2026-11670) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11671](https://nvd.nist.gov/vuln/detail/CVE-2026-11671) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11672](https://nvd.nist.gov/vuln/detail/CVE-2026-11672) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11673](https://nvd.nist.gov/vuln/detail/CVE-2026-11673) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11674](https://nvd.nist.gov/vuln/detail/CVE-2026-11674) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11675](https://nvd.nist.gov/vuln/detail/CVE-2026-11675) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11676](https://nvd.nist.gov/vuln/detail/CVE-2026-11676) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11677](https://nvd.nist.gov/vuln/detail/CVE-2026-11677) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11678](https://nvd.nist.gov/vuln/detail/CVE-2026-11678) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11679](https://nvd.nist.gov/vuln/detail/CVE-2026-11679) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11680](https://nvd.nist.gov/vuln/detail/CVE-2026-11680) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11681](https://nvd.nist.gov/vuln/detail/CVE-2026-11681) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11682](https://nvd.nist.gov/vuln/detail/CVE-2026-11682) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11683](https://nvd.nist.gov/vuln/detail/CVE-2026-11683) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11684](https://nvd.nist.gov/vuln/detail/CVE-2026-11684) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11685](https://nvd.nist.gov/vuln/detail/CVE-2026-11685) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11686](https://nvd.nist.gov/vuln/detail/CVE-2026-11686) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11687](https://nvd.nist.gov/vuln/detail/CVE-2026-11687) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11688](https://nvd.nist.gov/vuln/detail/CVE-2026-11688) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11689](https://nvd.nist.gov/vuln/detail/CVE-2026-11689) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11690](https://nvd.nist.gov/vuln/detail/CVE-2026-11690) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11691](https://nvd.nist.gov/vuln/detail/CVE-2026-11691) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11692](https://nvd.nist.gov/vuln/detail/CVE-2026-11692) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11693](https://nvd.nist.gov/vuln/detail/CVE-2026-11693) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11694](https://nvd.nist.gov/vuln/detail/CVE-2026-11694) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11695](https://nvd.nist.gov/vuln/detail/CVE-2026-11695) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11696](https://nvd.nist.gov/vuln/detail/CVE-2026-11696) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11697](https://nvd.nist.gov/vuln/detail/CVE-2026-11697) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11698](https://nvd.nist.gov/vuln/detail/CVE-2026-11698) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-11699](https://nvd.nist.gov/vuln/detail/CVE-2026-11699) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12007](https://nvd.nist.gov/vuln/detail/CVE-2026-12007) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12008](https://nvd.nist.gov/vuln/detail/CVE-2026-12008) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12009](https://nvd.nist.gov/vuln/detail/CVE-2026-12009) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12011](https://nvd.nist.gov/vuln/detail/CVE-2026-12011) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12012](https://nvd.nist.gov/vuln/detail/CVE-2026-12012) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12014](https://nvd.nist.gov/vuln/detail/CVE-2026-12014) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12016](https://nvd.nist.gov/vuln/detail/CVE-2026-12016) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12017](https://nvd.nist.gov/vuln/detail/CVE-2026-12017) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12018](https://nvd.nist.gov/vuln/detail/CVE-2026-12018) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12019](https://nvd.nist.gov/vuln/detail/CVE-2026-12019) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12020](https://nvd.nist.gov/vuln/detail/CVE-2026-12020) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12022](https://nvd.nist.gov/vuln/detail/CVE-2026-12022) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12027](https://nvd.nist.gov/vuln/detail/CVE-2026-12027) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12028](https://nvd.nist.gov/vuln/detail/CVE-2026-12028) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12029](https://nvd.nist.gov/vuln/detail/CVE-2026-12029) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12030](https://nvd.nist.gov/vuln/detail/CVE-2026-12030) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12031](https://nvd.nist.gov/vuln/detail/CVE-2026-12031) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12034](https://nvd.nist.gov/vuln/detail/CVE-2026-12034) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12035](https://nvd.nist.gov/vuln/detail/CVE-2026-12035) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-1220](https://nvd.nist.gov/vuln/detail/CVE-2026-1220) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12437](https://nvd.nist.gov/vuln/detail/CVE-2026-12437) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12438](https://nvd.nist.gov/vuln/detail/CVE-2026-12438) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12439](https://nvd.nist.gov/vuln/detail/CVE-2026-12439) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12440](https://nvd.nist.gov/vuln/detail/CVE-2026-12440) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12441](https://nvd.nist.gov/vuln/detail/CVE-2026-12441) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12442](https://nvd.nist.gov/vuln/detail/CVE-2026-12442) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12443](https://nvd.nist.gov/vuln/detail/CVE-2026-12443) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12445](https://nvd.nist.gov/vuln/detail/CVE-2026-12445) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12447](https://nvd.nist.gov/vuln/detail/CVE-2026-12447) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12448](https://nvd.nist.gov/vuln/detail/CVE-2026-12448) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12449](https://nvd.nist.gov/vuln/detail/CVE-2026-12449) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12451](https://nvd.nist.gov/vuln/detail/CVE-2026-12451) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12452](https://nvd.nist.gov/vuln/detail/CVE-2026-12452) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12454](https://nvd.nist.gov/vuln/detail/CVE-2026-12454) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12455](https://nvd.nist.gov/vuln/detail/CVE-2026-12455) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12456](https://nvd.nist.gov/vuln/detail/CVE-2026-12456) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12457](https://nvd.nist.gov/vuln/detail/CVE-2026-12457) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12459](https://nvd.nist.gov/vuln/detail/CVE-2026-12459) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12460](https://nvd.nist.gov/vuln/detail/CVE-2026-12460) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12462](https://nvd.nist.gov/vuln/detail/CVE-2026-12462) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12463](https://nvd.nist.gov/vuln/detail/CVE-2026-12463) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12464](https://nvd.nist.gov/vuln/detail/CVE-2026-12464) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12465](https://nvd.nist.gov/vuln/detail/CVE-2026-12465) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12466](https://nvd.nist.gov/vuln/detail/CVE-2026-12466) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12467](https://nvd.nist.gov/vuln/detail/CVE-2026-12467) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-12468](https://nvd.nist.gov/vuln/detail/CVE-2026-12468) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13021](https://nvd.nist.gov/vuln/detail/CVE-2026-13021) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13023](https://nvd.nist.gov/vuln/detail/CVE-2026-13023) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13024](https://nvd.nist.gov/vuln/detail/CVE-2026-13024) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13025](https://nvd.nist.gov/vuln/detail/CVE-2026-13025) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13026](https://nvd.nist.gov/vuln/detail/CVE-2026-13026) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13027](https://nvd.nist.gov/vuln/detail/CVE-2026-13027) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13029](https://nvd.nist.gov/vuln/detail/CVE-2026-13029) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13030](https://nvd.nist.gov/vuln/detail/CVE-2026-13030) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13031](https://nvd.nist.gov/vuln/detail/CVE-2026-13031) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13034](https://nvd.nist.gov/vuln/detail/CVE-2026-13034) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13036](https://nvd.nist.gov/vuln/detail/CVE-2026-13036) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13037](https://nvd.nist.gov/vuln/detail/CVE-2026-13037) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13281](https://nvd.nist.gov/vuln/detail/CVE-2026-13281) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13282](https://nvd.nist.gov/vuln/detail/CVE-2026-13282) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13283](https://nvd.nist.gov/vuln/detail/CVE-2026-13283) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13774](https://nvd.nist.gov/vuln/detail/CVE-2026-13774) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13777](https://nvd.nist.gov/vuln/detail/CVE-2026-13777) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13778](https://nvd.nist.gov/vuln/detail/CVE-2026-13778) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13779](https://nvd.nist.gov/vuln/detail/CVE-2026-13779) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13783](https://nvd.nist.gov/vuln/detail/CVE-2026-13783) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13784](https://nvd.nist.gov/vuln/detail/CVE-2026-13784) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13786](https://nvd.nist.gov/vuln/detail/CVE-2026-13786) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13787](https://nvd.nist.gov/vuln/detail/CVE-2026-13787) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13788](https://nvd.nist.gov/vuln/detail/CVE-2026-13788) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13790](https://nvd.nist.gov/vuln/detail/CVE-2026-13790) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13791](https://nvd.nist.gov/vuln/detail/CVE-2026-13791) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13792](https://nvd.nist.gov/vuln/detail/CVE-2026-13792) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13793](https://nvd.nist.gov/vuln/detail/CVE-2026-13793) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13794](https://nvd.nist.gov/vuln/detail/CVE-2026-13794) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13796](https://nvd.nist.gov/vuln/detail/CVE-2026-13796) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13797](https://nvd.nist.gov/vuln/detail/CVE-2026-13797) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13798](https://nvd.nist.gov/vuln/detail/CVE-2026-13798) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13799](https://nvd.nist.gov/vuln/detail/CVE-2026-13799) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13800](https://nvd.nist.gov/vuln/detail/CVE-2026-13800) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13801](https://nvd.nist.gov/vuln/detail/CVE-2026-13801) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13802](https://nvd.nist.gov/vuln/detail/CVE-2026-13802) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13803](https://nvd.nist.gov/vuln/detail/CVE-2026-13803) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13804](https://nvd.nist.gov/vuln/detail/CVE-2026-13804) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13805](https://nvd.nist.gov/vuln/detail/CVE-2026-13805) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13806](https://nvd.nist.gov/vuln/detail/CVE-2026-13806) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13807](https://nvd.nist.gov/vuln/detail/CVE-2026-13807) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13808](https://nvd.nist.gov/vuln/detail/CVE-2026-13808) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13809](https://nvd.nist.gov/vuln/detail/CVE-2026-13809) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13810](https://nvd.nist.gov/vuln/detail/CVE-2026-13810) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13811](https://nvd.nist.gov/vuln/detail/CVE-2026-13811) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13812](https://nvd.nist.gov/vuln/detail/CVE-2026-13812) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13813](https://nvd.nist.gov/vuln/detail/CVE-2026-13813) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13814](https://nvd.nist.gov/vuln/detail/CVE-2026-13814) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13815](https://nvd.nist.gov/vuln/detail/CVE-2026-13815) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13816](https://nvd.nist.gov/vuln/detail/CVE-2026-13816) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13817](https://nvd.nist.gov/vuln/detail/CVE-2026-13817) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13818](https://nvd.nist.gov/vuln/detail/CVE-2026-13818) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13819](https://nvd.nist.gov/vuln/detail/CVE-2026-13819) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13820](https://nvd.nist.gov/vuln/detail/CVE-2026-13820) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13821](https://nvd.nist.gov/vuln/detail/CVE-2026-13821) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13822](https://nvd.nist.gov/vuln/detail/CVE-2026-13822) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13823](https://nvd.nist.gov/vuln/detail/CVE-2026-13823) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13824](https://nvd.nist.gov/vuln/detail/CVE-2026-13824) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13825](https://nvd.nist.gov/vuln/detail/CVE-2026-13825) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13826](https://nvd.nist.gov/vuln/detail/CVE-2026-13826) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13827](https://nvd.nist.gov/vuln/detail/CVE-2026-13827) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13828](https://nvd.nist.gov/vuln/detail/CVE-2026-13828) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13829](https://nvd.nist.gov/vuln/detail/CVE-2026-13829) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13830](https://nvd.nist.gov/vuln/detail/CVE-2026-13830) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13831](https://nvd.nist.gov/vuln/detail/CVE-2026-13831) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13832](https://nvd.nist.gov/vuln/detail/CVE-2026-13832) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13833](https://nvd.nist.gov/vuln/detail/CVE-2026-13833) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13834](https://nvd.nist.gov/vuln/detail/CVE-2026-13834) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13835](https://nvd.nist.gov/vuln/detail/CVE-2026-13835) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13836](https://nvd.nist.gov/vuln/detail/CVE-2026-13836) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13837](https://nvd.nist.gov/vuln/detail/CVE-2026-13837) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13838](https://nvd.nist.gov/vuln/detail/CVE-2026-13838) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13839](https://nvd.nist.gov/vuln/detail/CVE-2026-13839) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13840](https://nvd.nist.gov/vuln/detail/CVE-2026-13840) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13841](https://nvd.nist.gov/vuln/detail/CVE-2026-13841) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13842](https://nvd.nist.gov/vuln/detail/CVE-2026-13842) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13843](https://nvd.nist.gov/vuln/detail/CVE-2026-13843) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13844](https://nvd.nist.gov/vuln/detail/CVE-2026-13844) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13845](https://nvd.nist.gov/vuln/detail/CVE-2026-13845) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13846](https://nvd.nist.gov/vuln/detail/CVE-2026-13846) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13847](https://nvd.nist.gov/vuln/detail/CVE-2026-13847) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13848](https://nvd.nist.gov/vuln/detail/CVE-2026-13848) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13849](https://nvd.nist.gov/vuln/detail/CVE-2026-13849) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13850](https://nvd.nist.gov/vuln/detail/CVE-2026-13850) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13851](https://nvd.nist.gov/vuln/detail/CVE-2026-13851) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13852](https://nvd.nist.gov/vuln/detail/CVE-2026-13852) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13853](https://nvd.nist.gov/vuln/detail/CVE-2026-13853) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13854](https://nvd.nist.gov/vuln/detail/CVE-2026-13854) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-13855](https://nvd.nist.gov/vuln/detail/CVE-2026-13855) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-14090](https://nvd.nist.gov/vuln/detail/CVE-2026-14090) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-14102](https://nvd.nist.gov/vuln/detail/CVE-2026-14102) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-14382](https://nvd.nist.gov/vuln/detail/CVE-2026-14382) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-14385](https://nvd.nist.gov/vuln/detail/CVE-2026-14385) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-14386](https://nvd.nist.gov/vuln/detail/CVE-2026-14386) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-14390](https://nvd.nist.gov/vuln/detail/CVE-2026-14390) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-14392](https://nvd.nist.gov/vuln/detail/CVE-2026-14392) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-14398](https://nvd.nist.gov/vuln/detail/CVE-2026-14398) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-14400](https://nvd.nist.gov/vuln/detail/CVE-2026-14400) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-14401](https://nvd.nist.gov/vuln/detail/CVE-2026-14401) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-14402](https://nvd.nist.gov/vuln/detail/CVE-2026-14402) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-14411](https://nvd.nist.gov/vuln/detail/CVE-2026-14411) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-14412](https://nvd.nist.gov/vuln/detail/CVE-2026-14412) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-14413](https://nvd.nist.gov/vuln/detail/CVE-2026-14413) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-14417](https://nvd.nist.gov/vuln/detail/CVE-2026-14417) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-14418](https://nvd.nist.gov/vuln/detail/CVE-2026-14418) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-14419](https://nvd.nist.gov/vuln/detail/CVE-2026-14419) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-14420](https://nvd.nist.gov/vuln/detail/CVE-2026-14420) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-14422](https://nvd.nist.gov/vuln/detail/CVE-2026-14422) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-14423](https://nvd.nist.gov/vuln/detail/CVE-2026-14423) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-14424](https://nvd.nist.gov/vuln/detail/CVE-2026-14424) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-14425](https://nvd.nist.gov/vuln/detail/CVE-2026-14425) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-14426](https://nvd.nist.gov/vuln/detail/CVE-2026-14426) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-14427](https://nvd.nist.gov/vuln/detail/CVE-2026-14427) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-14428](https://nvd.nist.gov/vuln/detail/CVE-2026-14428) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-14429](https://nvd.nist.gov/vuln/detail/CVE-2026-14429) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-14430](https://nvd.nist.gov/vuln/detail/CVE-2026-14430) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-14431](https://nvd.nist.gov/vuln/detail/CVE-2026-14431) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-1504](https://nvd.nist.gov/vuln/detail/CVE-2026-1504) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-15108](https://nvd.nist.gov/vuln/detail/CVE-2026-15108) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-15109](https://nvd.nist.gov/vuln/detail/CVE-2026-15109) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-15110](https://nvd.nist.gov/vuln/detail/CVE-2026-15110) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-15111](https://nvd.nist.gov/vuln/detail/CVE-2026-15111) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-15112](https://nvd.nist.gov/vuln/detail/CVE-2026-15112) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-15113](https://nvd.nist.gov/vuln/detail/CVE-2026-15113) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-15114](https://nvd.nist.gov/vuln/detail/CVE-2026-15114) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-15115](https://nvd.nist.gov/vuln/detail/CVE-2026-15115) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-15116](https://nvd.nist.gov/vuln/detail/CVE-2026-15116) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-15117](https://nvd.nist.gov/vuln/detail/CVE-2026-15117) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-15118](https://nvd.nist.gov/vuln/detail/CVE-2026-15118) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-15119](https://nvd.nist.gov/vuln/detail/CVE-2026-15119) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-15120](https://nvd.nist.gov/vuln/detail/CVE-2026-15120) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-15121](https://nvd.nist.gov/vuln/detail/CVE-2026-15121) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-15122](https://nvd.nist.gov/vuln/detail/CVE-2026-15122) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-15123](https://nvd.nist.gov/vuln/detail/CVE-2026-15123) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-15124](https://nvd.nist.gov/vuln/detail/CVE-2026-15124) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-15125](https://nvd.nist.gov/vuln/detail/CVE-2026-15125) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-15127](https://nvd.nist.gov/vuln/detail/CVE-2026-15127) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-15128](https://nvd.nist.gov/vuln/detail/CVE-2026-15128) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-15129](https://nvd.nist.gov/vuln/detail/CVE-2026-15129) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-15130](https://nvd.nist.gov/vuln/detail/CVE-2026-15130) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-15132](https://nvd.nist.gov/vuln/detail/CVE-2026-15132) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-15133](https://nvd.nist.gov/vuln/detail/CVE-2026-15133) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-15766](https://nvd.nist.gov/vuln/detail/CVE-2026-15766) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-15767](https://nvd.nist.gov/vuln/detail/CVE-2026-15767) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-15768](https://nvd.nist.gov/vuln/detail/CVE-2026-15768) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-15769](https://nvd.nist.gov/vuln/detail/CVE-2026-15769) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-15770](https://nvd.nist.gov/vuln/detail/CVE-2026-15770) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-15771](https://nvd.nist.gov/vuln/detail/CVE-2026-15771) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-15772](https://nvd.nist.gov/vuln/detail/CVE-2026-15772) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-15773](https://nvd.nist.gov/vuln/detail/CVE-2026-15773) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-15774](https://nvd.nist.gov/vuln/detail/CVE-2026-15774) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-15775](https://nvd.nist.gov/vuln/detail/CVE-2026-15775) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-15776](https://nvd.nist.gov/vuln/detail/CVE-2026-15776) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-15777](https://nvd.nist.gov/vuln/detail/CVE-2026-15777) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-16414](https://nvd.nist.gov/vuln/detail/CVE-2026-16414) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-16804](https://nvd.nist.gov/vuln/detail/CVE-2026-16804) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-16805](https://nvd.nist.gov/vuln/detail/CVE-2026-16805) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-16806](https://nvd.nist.gov/vuln/detail/CVE-2026-16806) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-16807](https://nvd.nist.gov/vuln/detail/CVE-2026-16807) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17650](https://nvd.nist.gov/vuln/detail/CVE-2026-17650) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17657](https://nvd.nist.gov/vuln/detail/CVE-2026-17657) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17658](https://nvd.nist.gov/vuln/detail/CVE-2026-17658) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17659](https://nvd.nist.gov/vuln/detail/CVE-2026-17659) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17660](https://nvd.nist.gov/vuln/detail/CVE-2026-17660) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17661](https://nvd.nist.gov/vuln/detail/CVE-2026-17661) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17662](https://nvd.nist.gov/vuln/detail/CVE-2026-17662) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17663](https://nvd.nist.gov/vuln/detail/CVE-2026-17663) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17664](https://nvd.nist.gov/vuln/detail/CVE-2026-17664) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17665](https://nvd.nist.gov/vuln/detail/CVE-2026-17665) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17666](https://nvd.nist.gov/vuln/detail/CVE-2026-17666) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17667](https://nvd.nist.gov/vuln/detail/CVE-2026-17667) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17668](https://nvd.nist.gov/vuln/detail/CVE-2026-17668) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17670](https://nvd.nist.gov/vuln/detail/CVE-2026-17670) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17671](https://nvd.nist.gov/vuln/detail/CVE-2026-17671) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17672](https://nvd.nist.gov/vuln/detail/CVE-2026-17672) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17673](https://nvd.nist.gov/vuln/detail/CVE-2026-17673) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17674](https://nvd.nist.gov/vuln/detail/CVE-2026-17674) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17675](https://nvd.nist.gov/vuln/detail/CVE-2026-17675) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17676](https://nvd.nist.gov/vuln/detail/CVE-2026-17676) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17677](https://nvd.nist.gov/vuln/detail/CVE-2026-17677) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17678](https://nvd.nist.gov/vuln/detail/CVE-2026-17678) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17679](https://nvd.nist.gov/vuln/detail/CVE-2026-17679) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17680](https://nvd.nist.gov/vuln/detail/CVE-2026-17680) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17681](https://nvd.nist.gov/vuln/detail/CVE-2026-17681) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17682](https://nvd.nist.gov/vuln/detail/CVE-2026-17682) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17683](https://nvd.nist.gov/vuln/detail/CVE-2026-17683) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17685](https://nvd.nist.gov/vuln/detail/CVE-2026-17685) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17686](https://nvd.nist.gov/vuln/detail/CVE-2026-17686) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17687](https://nvd.nist.gov/vuln/detail/CVE-2026-17687) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17688](https://nvd.nist.gov/vuln/detail/CVE-2026-17688) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17689](https://nvd.nist.gov/vuln/detail/CVE-2026-17689) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17690](https://nvd.nist.gov/vuln/detail/CVE-2026-17690) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17691](https://nvd.nist.gov/vuln/detail/CVE-2026-17691) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17692](https://nvd.nist.gov/vuln/detail/CVE-2026-17692) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17693](https://nvd.nist.gov/vuln/detail/CVE-2026-17693) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17694](https://nvd.nist.gov/vuln/detail/CVE-2026-17694) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17695](https://nvd.nist.gov/vuln/detail/CVE-2026-17695) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17696](https://nvd.nist.gov/vuln/detail/CVE-2026-17696) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17697](https://nvd.nist.gov/vuln/detail/CVE-2026-17697) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17698](https://nvd.nist.gov/vuln/detail/CVE-2026-17698) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17699](https://nvd.nist.gov/vuln/detail/CVE-2026-17699) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17700](https://nvd.nist.gov/vuln/detail/CVE-2026-17700) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17701](https://nvd.nist.gov/vuln/detail/CVE-2026-17701) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17702](https://nvd.nist.gov/vuln/detail/CVE-2026-17702) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17704](https://nvd.nist.gov/vuln/detail/CVE-2026-17704) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17705](https://nvd.nist.gov/vuln/detail/CVE-2026-17705) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17706](https://nvd.nist.gov/vuln/detail/CVE-2026-17706) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17707](https://nvd.nist.gov/vuln/detail/CVE-2026-17707) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17708](https://nvd.nist.gov/vuln/detail/CVE-2026-17708) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17709](https://nvd.nist.gov/vuln/detail/CVE-2026-17709) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17710](https://nvd.nist.gov/vuln/detail/CVE-2026-17710) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17711](https://nvd.nist.gov/vuln/detail/CVE-2026-17711) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17712](https://nvd.nist.gov/vuln/detail/CVE-2026-17712) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17713](https://nvd.nist.gov/vuln/detail/CVE-2026-17713) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17714](https://nvd.nist.gov/vuln/detail/CVE-2026-17714) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17715](https://nvd.nist.gov/vuln/detail/CVE-2026-17715) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17716](https://nvd.nist.gov/vuln/detail/CVE-2026-17716) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17717](https://nvd.nist.gov/vuln/detail/CVE-2026-17717) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17718](https://nvd.nist.gov/vuln/detail/CVE-2026-17718) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17719](https://nvd.nist.gov/vuln/detail/CVE-2026-17719) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17720](https://nvd.nist.gov/vuln/detail/CVE-2026-17720) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17721](https://nvd.nist.gov/vuln/detail/CVE-2026-17721) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17722](https://nvd.nist.gov/vuln/detail/CVE-2026-17722) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17723](https://nvd.nist.gov/vuln/detail/CVE-2026-17723) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17725](https://nvd.nist.gov/vuln/detail/CVE-2026-17725) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17726](https://nvd.nist.gov/vuln/detail/CVE-2026-17726) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17727](https://nvd.nist.gov/vuln/detail/CVE-2026-17727) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17778](https://nvd.nist.gov/vuln/detail/CVE-2026-17778) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-17823](https://nvd.nist.gov/vuln/detail/CVE-2026-17823) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-19155](https://nvd.nist.gov/vuln/detail/CVE-2026-19155) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-2313](https://nvd.nist.gov/vuln/detail/CVE-2026-2313) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-2314](https://nvd.nist.gov/vuln/detail/CVE-2026-2314) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-2315](https://nvd.nist.gov/vuln/detail/CVE-2026-2315) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-2321](https://nvd.nist.gov/vuln/detail/CVE-2026-2321) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-2441](https://nvd.nist.gov/vuln/detail/CVE-2026-2441) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-2648](https://nvd.nist.gov/vuln/detail/CVE-2026-2648) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-2649](https://nvd.nist.gov/vuln/detail/CVE-2026-2649) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-3536](https://nvd.nist.gov/vuln/detail/CVE-2026-3536) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-3537](https://nvd.nist.gov/vuln/detail/CVE-2026-3537) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-3538](https://nvd.nist.gov/vuln/detail/CVE-2026-3538) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-3540](https://nvd.nist.gov/vuln/detail/CVE-2026-3540) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-3541](https://nvd.nist.gov/vuln/detail/CVE-2026-3541) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-3542](https://nvd.nist.gov/vuln/detail/CVE-2026-3542) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-3543](https://nvd.nist.gov/vuln/detail/CVE-2026-3543) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-3544](https://nvd.nist.gov/vuln/detail/CVE-2026-3544) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-3545](https://nvd.nist.gov/vuln/detail/CVE-2026-3545) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-3909](https://nvd.nist.gov/vuln/detail/CVE-2026-3909) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-3910](https://nvd.nist.gov/vuln/detail/CVE-2026-3910) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-3914](https://nvd.nist.gov/vuln/detail/CVE-2026-3914) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-3915](https://nvd.nist.gov/vuln/detail/CVE-2026-3915) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-3916](https://nvd.nist.gov/vuln/detail/CVE-2026-3916) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-3917](https://nvd.nist.gov/vuln/detail/CVE-2026-3917) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-3918](https://nvd.nist.gov/vuln/detail/CVE-2026-3918) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-3919](https://nvd.nist.gov/vuln/detail/CVE-2026-3919) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-3920](https://nvd.nist.gov/vuln/detail/CVE-2026-3920) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-3921](https://nvd.nist.gov/vuln/detail/CVE-2026-3921) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-3922](https://nvd.nist.gov/vuln/detail/CVE-2026-3922) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-3923](https://nvd.nist.gov/vuln/detail/CVE-2026-3923) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-3924](https://nvd.nist.gov/vuln/detail/CVE-2026-3924) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-3932](https://nvd.nist.gov/vuln/detail/CVE-2026-3932) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4442](https://nvd.nist.gov/vuln/detail/CVE-2026-4442) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4443](https://nvd.nist.gov/vuln/detail/CVE-2026-4443) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4444](https://nvd.nist.gov/vuln/detail/CVE-2026-4444) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4446](https://nvd.nist.gov/vuln/detail/CVE-2026-4446) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4447](https://nvd.nist.gov/vuln/detail/CVE-2026-4447) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4448](https://nvd.nist.gov/vuln/detail/CVE-2026-4448) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4449](https://nvd.nist.gov/vuln/detail/CVE-2026-4449) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4450](https://nvd.nist.gov/vuln/detail/CVE-2026-4450) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4451](https://nvd.nist.gov/vuln/detail/CVE-2026-4451) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4452](https://nvd.nist.gov/vuln/detail/CVE-2026-4452) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4453](https://nvd.nist.gov/vuln/detail/CVE-2026-4453) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4454](https://nvd.nist.gov/vuln/detail/CVE-2026-4454) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4455](https://nvd.nist.gov/vuln/detail/CVE-2026-4455) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4456](https://nvd.nist.gov/vuln/detail/CVE-2026-4456) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4457](https://nvd.nist.gov/vuln/detail/CVE-2026-4457) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4458](https://nvd.nist.gov/vuln/detail/CVE-2026-4458) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4459](https://nvd.nist.gov/vuln/detail/CVE-2026-4459) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4460](https://nvd.nist.gov/vuln/detail/CVE-2026-4460) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4461](https://nvd.nist.gov/vuln/detail/CVE-2026-4461) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4462](https://nvd.nist.gov/vuln/detail/CVE-2026-4462) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4463](https://nvd.nist.gov/vuln/detail/CVE-2026-4463) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4673](https://nvd.nist.gov/vuln/detail/CVE-2026-4673) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4674](https://nvd.nist.gov/vuln/detail/CVE-2026-4674) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4675](https://nvd.nist.gov/vuln/detail/CVE-2026-4675) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4676](https://nvd.nist.gov/vuln/detail/CVE-2026-4676) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4677](https://nvd.nist.gov/vuln/detail/CVE-2026-4677) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4678](https://nvd.nist.gov/vuln/detail/CVE-2026-4678) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4679](https://nvd.nist.gov/vuln/detail/CVE-2026-4679) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4680](https://nvd.nist.gov/vuln/detail/CVE-2026-4680) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-5272](https://nvd.nist.gov/vuln/detail/CVE-2026-5272) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-5273](https://nvd.nist.gov/vuln/detail/CVE-2026-5273) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-5274](https://nvd.nist.gov/vuln/detail/CVE-2026-5274) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-5275](https://nvd.nist.gov/vuln/detail/CVE-2026-5275) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-5276](https://nvd.nist.gov/vuln/detail/CVE-2026-5276) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-5277](https://nvd.nist.gov/vuln/detail/CVE-2026-5277) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-5278](https://nvd.nist.gov/vuln/detail/CVE-2026-5278) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-5279](https://nvd.nist.gov/vuln/detail/CVE-2026-5279) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-5280](https://nvd.nist.gov/vuln/detail/CVE-2026-5280) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-5281](https://nvd.nist.gov/vuln/detail/CVE-2026-5281) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-5282](https://nvd.nist.gov/vuln/detail/CVE-2026-5282) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-5283](https://nvd.nist.gov/vuln/detail/CVE-2026-5283) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-5284](https://nvd.nist.gov/vuln/detail/CVE-2026-5284) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-5285](https://nvd.nist.gov/vuln/detail/CVE-2026-5285) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-5286](https://nvd.nist.gov/vuln/detail/CVE-2026-5286) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-5287](https://nvd.nist.gov/vuln/detail/CVE-2026-5287) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-5858](https://nvd.nist.gov/vuln/detail/CVE-2026-5858) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-5859](https://nvd.nist.gov/vuln/detail/CVE-2026-5859) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-5860](https://nvd.nist.gov/vuln/detail/CVE-2026-5860) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-5861](https://nvd.nist.gov/vuln/detail/CVE-2026-5861) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-5862](https://nvd.nist.gov/vuln/detail/CVE-2026-5862) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-5863](https://nvd.nist.gov/vuln/detail/CVE-2026-5863) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-5864](https://nvd.nist.gov/vuln/detail/CVE-2026-5864) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-5865](https://nvd.nist.gov/vuln/detail/CVE-2026-5865) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-5866](https://nvd.nist.gov/vuln/detail/CVE-2026-5866) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-5867](https://nvd.nist.gov/vuln/detail/CVE-2026-5867) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-5868](https://nvd.nist.gov/vuln/detail/CVE-2026-5868) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-5869](https://nvd.nist.gov/vuln/detail/CVE-2026-5869) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-5870](https://nvd.nist.gov/vuln/detail/CVE-2026-5870) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-5871](https://nvd.nist.gov/vuln/detail/CVE-2026-5871) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-5872](https://nvd.nist.gov/vuln/detail/CVE-2026-5872) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-5873](https://nvd.nist.gov/vuln/detail/CVE-2026-5873) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-5874](https://nvd.nist.gov/vuln/detail/CVE-2026-5874) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-5883](https://nvd.nist.gov/vuln/detail/CVE-2026-5883) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6297](https://nvd.nist.gov/vuln/detail/CVE-2026-6297) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6298](https://nvd.nist.gov/vuln/detail/CVE-2026-6298) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6299](https://nvd.nist.gov/vuln/detail/CVE-2026-6299) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6300](https://nvd.nist.gov/vuln/detail/CVE-2026-6300) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6301](https://nvd.nist.gov/vuln/detail/CVE-2026-6301) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6302](https://nvd.nist.gov/vuln/detail/CVE-2026-6302) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6303](https://nvd.nist.gov/vuln/detail/CVE-2026-6303) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6304](https://nvd.nist.gov/vuln/detail/CVE-2026-6304) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6305](https://nvd.nist.gov/vuln/detail/CVE-2026-6305) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6306](https://nvd.nist.gov/vuln/detail/CVE-2026-6306) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6307](https://nvd.nist.gov/vuln/detail/CVE-2026-6307) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6308](https://nvd.nist.gov/vuln/detail/CVE-2026-6308) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6309](https://nvd.nist.gov/vuln/detail/CVE-2026-6309) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6310](https://nvd.nist.gov/vuln/detail/CVE-2026-6310) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6311](https://nvd.nist.gov/vuln/detail/CVE-2026-6311) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6312](https://nvd.nist.gov/vuln/detail/CVE-2026-6312) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6313](https://nvd.nist.gov/vuln/detail/CVE-2026-6313) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6314](https://nvd.nist.gov/vuln/detail/CVE-2026-6314) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6315](https://nvd.nist.gov/vuln/detail/CVE-2026-6315) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6316](https://nvd.nist.gov/vuln/detail/CVE-2026-6316) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6317](https://nvd.nist.gov/vuln/detail/CVE-2026-6317) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6358](https://nvd.nist.gov/vuln/detail/CVE-2026-6358) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6359](https://nvd.nist.gov/vuln/detail/CVE-2026-6359) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6360](https://nvd.nist.gov/vuln/detail/CVE-2026-6360) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6361](https://nvd.nist.gov/vuln/detail/CVE-2026-6361) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6362](https://nvd.nist.gov/vuln/detail/CVE-2026-6362) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6919](https://nvd.nist.gov/vuln/detail/CVE-2026-6919) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6920](https://nvd.nist.gov/vuln/detail/CVE-2026-6920) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7333](https://nvd.nist.gov/vuln/detail/CVE-2026-7333) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7334](https://nvd.nist.gov/vuln/detail/CVE-2026-7334) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7335](https://nvd.nist.gov/vuln/detail/CVE-2026-7335) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7336](https://nvd.nist.gov/vuln/detail/CVE-2026-7336) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7337](https://nvd.nist.gov/vuln/detail/CVE-2026-7337) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7338](https://nvd.nist.gov/vuln/detail/CVE-2026-7338) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7341](https://nvd.nist.gov/vuln/detail/CVE-2026-7341) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7342](https://nvd.nist.gov/vuln/detail/CVE-2026-7342) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7343](https://nvd.nist.gov/vuln/detail/CVE-2026-7343) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7344](https://nvd.nist.gov/vuln/detail/CVE-2026-7344) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7345](https://nvd.nist.gov/vuln/detail/CVE-2026-7345) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7346](https://nvd.nist.gov/vuln/detail/CVE-2026-7346) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7347](https://nvd.nist.gov/vuln/detail/CVE-2026-7347) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7348](https://nvd.nist.gov/vuln/detail/CVE-2026-7348) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7349](https://nvd.nist.gov/vuln/detail/CVE-2026-7349) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7350](https://nvd.nist.gov/vuln/detail/CVE-2026-7350) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7351](https://nvd.nist.gov/vuln/detail/CVE-2026-7351) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7352](https://nvd.nist.gov/vuln/detail/CVE-2026-7352) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7353](https://nvd.nist.gov/vuln/detail/CVE-2026-7353) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7354](https://nvd.nist.gov/vuln/detail/CVE-2026-7354) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7356](https://nvd.nist.gov/vuln/detail/CVE-2026-7356) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7357](https://nvd.nist.gov/vuln/detail/CVE-2026-7357) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7358](https://nvd.nist.gov/vuln/detail/CVE-2026-7358) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7359](https://nvd.nist.gov/vuln/detail/CVE-2026-7359) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7360](https://nvd.nist.gov/vuln/detail/CVE-2026-7360) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7361](https://nvd.nist.gov/vuln/detail/CVE-2026-7361) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7363](https://nvd.nist.gov/vuln/detail/CVE-2026-7363) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7896](https://nvd.nist.gov/vuln/detail/CVE-2026-7896) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7897](https://nvd.nist.gov/vuln/detail/CVE-2026-7897) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7899](https://nvd.nist.gov/vuln/detail/CVE-2026-7899) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7900](https://nvd.nist.gov/vuln/detail/CVE-2026-7900) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7901](https://nvd.nist.gov/vuln/detail/CVE-2026-7901) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7902](https://nvd.nist.gov/vuln/detail/CVE-2026-7902) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7903](https://nvd.nist.gov/vuln/detail/CVE-2026-7903) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7904](https://nvd.nist.gov/vuln/detail/CVE-2026-7904) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7905](https://nvd.nist.gov/vuln/detail/CVE-2026-7905) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7906](https://nvd.nist.gov/vuln/detail/CVE-2026-7906) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7907](https://nvd.nist.gov/vuln/detail/CVE-2026-7907) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7908](https://nvd.nist.gov/vuln/detail/CVE-2026-7908) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7909](https://nvd.nist.gov/vuln/detail/CVE-2026-7909) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7911](https://nvd.nist.gov/vuln/detail/CVE-2026-7911) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7912](https://nvd.nist.gov/vuln/detail/CVE-2026-7912) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7913](https://nvd.nist.gov/vuln/detail/CVE-2026-7913) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7914](https://nvd.nist.gov/vuln/detail/CVE-2026-7914) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7915](https://nvd.nist.gov/vuln/detail/CVE-2026-7915) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7916](https://nvd.nist.gov/vuln/detail/CVE-2026-7916) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7917](https://nvd.nist.gov/vuln/detail/CVE-2026-7917) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7918](https://nvd.nist.gov/vuln/detail/CVE-2026-7918) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7919](https://nvd.nist.gov/vuln/detail/CVE-2026-7919) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7920](https://nvd.nist.gov/vuln/detail/CVE-2026-7920) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7921](https://nvd.nist.gov/vuln/detail/CVE-2026-7921) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7922](https://nvd.nist.gov/vuln/detail/CVE-2026-7922) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7923](https://nvd.nist.gov/vuln/detail/CVE-2026-7923) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7924](https://nvd.nist.gov/vuln/detail/CVE-2026-7924) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7925](https://nvd.nist.gov/vuln/detail/CVE-2026-7925) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7926](https://nvd.nist.gov/vuln/detail/CVE-2026-7926) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7927](https://nvd.nist.gov/vuln/detail/CVE-2026-7927) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7928](https://nvd.nist.gov/vuln/detail/CVE-2026-7928) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-7929](https://nvd.nist.gov/vuln/detail/CVE-2026-7929) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8523](https://nvd.nist.gov/vuln/detail/CVE-2026-8523) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8524](https://nvd.nist.gov/vuln/detail/CVE-2026-8524) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8525](https://nvd.nist.gov/vuln/detail/CVE-2026-8525) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8526](https://nvd.nist.gov/vuln/detail/CVE-2026-8526) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8527](https://nvd.nist.gov/vuln/detail/CVE-2026-8527) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8528](https://nvd.nist.gov/vuln/detail/CVE-2026-8528) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8529](https://nvd.nist.gov/vuln/detail/CVE-2026-8529) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8530](https://nvd.nist.gov/vuln/detail/CVE-2026-8530) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8531](https://nvd.nist.gov/vuln/detail/CVE-2026-8531) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8532](https://nvd.nist.gov/vuln/detail/CVE-2026-8532) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8533](https://nvd.nist.gov/vuln/detail/CVE-2026-8533) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8534](https://nvd.nist.gov/vuln/detail/CVE-2026-8534) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8535](https://nvd.nist.gov/vuln/detail/CVE-2026-8535) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8536](https://nvd.nist.gov/vuln/detail/CVE-2026-8536) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8537](https://nvd.nist.gov/vuln/detail/CVE-2026-8537) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8538](https://nvd.nist.gov/vuln/detail/CVE-2026-8538) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8539](https://nvd.nist.gov/vuln/detail/CVE-2026-8539) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8540](https://nvd.nist.gov/vuln/detail/CVE-2026-8540) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8541](https://nvd.nist.gov/vuln/detail/CVE-2026-8541) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8542](https://nvd.nist.gov/vuln/detail/CVE-2026-8542) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8543](https://nvd.nist.gov/vuln/detail/CVE-2026-8543) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8544](https://nvd.nist.gov/vuln/detail/CVE-2026-8544) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8545](https://nvd.nist.gov/vuln/detail/CVE-2026-8545) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8546](https://nvd.nist.gov/vuln/detail/CVE-2026-8546) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8547](https://nvd.nist.gov/vuln/detail/CVE-2026-8547) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8548](https://nvd.nist.gov/vuln/detail/CVE-2026-8548) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8549](https://nvd.nist.gov/vuln/detail/CVE-2026-8549) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8550](https://nvd.nist.gov/vuln/detail/CVE-2026-8550) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8551](https://nvd.nist.gov/vuln/detail/CVE-2026-8551) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8552](https://nvd.nist.gov/vuln/detail/CVE-2026-8552) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8553](https://nvd.nist.gov/vuln/detail/CVE-2026-8553) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8554](https://nvd.nist.gov/vuln/detail/CVE-2026-8554) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8555](https://nvd.nist.gov/vuln/detail/CVE-2026-8555) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8556](https://nvd.nist.gov/vuln/detail/CVE-2026-8556) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8557](https://nvd.nist.gov/vuln/detail/CVE-2026-8557) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8558](https://nvd.nist.gov/vuln/detail/CVE-2026-8558) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8559](https://nvd.nist.gov/vuln/detail/CVE-2026-8559) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9111](https://nvd.nist.gov/vuln/detail/CVE-2026-9111) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9112](https://nvd.nist.gov/vuln/detail/CVE-2026-9112) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9113](https://nvd.nist.gov/vuln/detail/CVE-2026-9113) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9114](https://nvd.nist.gov/vuln/detail/CVE-2026-9114) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9115](https://nvd.nist.gov/vuln/detail/CVE-2026-9115) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9116](https://nvd.nist.gov/vuln/detail/CVE-2026-9116) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9117](https://nvd.nist.gov/vuln/detail/CVE-2026-9117) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9118](https://nvd.nist.gov/vuln/detail/CVE-2026-9118) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9119](https://nvd.nist.gov/vuln/detail/CVE-2026-9119) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9120](https://nvd.nist.gov/vuln/detail/CVE-2026-9120) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9877](https://nvd.nist.gov/vuln/detail/CVE-2026-9877) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9887](https://nvd.nist.gov/vuln/detail/CVE-2026-9887) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9894](https://nvd.nist.gov/vuln/detail/CVE-2026-9894) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9895](https://nvd.nist.gov/vuln/detail/CVE-2026-9895) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9896](https://nvd.nist.gov/vuln/detail/CVE-2026-9896) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9897](https://nvd.nist.gov/vuln/detail/CVE-2026-9897) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9898](https://nvd.nist.gov/vuln/detail/CVE-2026-9898) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9899](https://nvd.nist.gov/vuln/detail/CVE-2026-9899) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9900](https://nvd.nist.gov/vuln/detail/CVE-2026-9900) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9901](https://nvd.nist.gov/vuln/detail/CVE-2026-9901) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9902](https://nvd.nist.gov/vuln/detail/CVE-2026-9902) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9903](https://nvd.nist.gov/vuln/detail/CVE-2026-9903) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9904](https://nvd.nist.gov/vuln/detail/CVE-2026-9904) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9905](https://nvd.nist.gov/vuln/detail/CVE-2026-9905) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9906](https://nvd.nist.gov/vuln/detail/CVE-2026-9906) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9907](https://nvd.nist.gov/vuln/detail/CVE-2026-9907) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9908](https://nvd.nist.gov/vuln/detail/CVE-2026-9908) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9909](https://nvd.nist.gov/vuln/detail/CVE-2026-9909) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9910](https://nvd.nist.gov/vuln/detail/CVE-2026-9910) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9911](https://nvd.nist.gov/vuln/detail/CVE-2026-9911) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9912](https://nvd.nist.gov/vuln/detail/CVE-2026-9912) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9913](https://nvd.nist.gov/vuln/detail/CVE-2026-9913) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9914](https://nvd.nist.gov/vuln/detail/CVE-2026-9914) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9915](https://nvd.nist.gov/vuln/detail/CVE-2026-9915) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9916](https://nvd.nist.gov/vuln/detail/CVE-2026-9916) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9917](https://nvd.nist.gov/vuln/detail/CVE-2026-9917) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9918](https://nvd.nist.gov/vuln/detail/CVE-2026-9918) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9919](https://nvd.nist.gov/vuln/detail/CVE-2026-9919) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9920](https://nvd.nist.gov/vuln/detail/CVE-2026-9920) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9921](https://nvd.nist.gov/vuln/detail/CVE-2026-9921) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9922](https://nvd.nist.gov/vuln/detail/CVE-2026-9922) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9923](https://nvd.nist.gov/vuln/detail/CVE-2026-9923) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9924](https://nvd.nist.gov/vuln/detail/CVE-2026-9924) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9925](https://nvd.nist.gov/vuln/detail/CVE-2026-9925) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9926](https://nvd.nist.gov/vuln/detail/CVE-2026-9926) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9927](https://nvd.nist.gov/vuln/detail/CVE-2026-9927) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9928](https://nvd.nist.gov/vuln/detail/CVE-2026-9928) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9929](https://nvd.nist.gov/vuln/detail/CVE-2026-9929) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9930](https://nvd.nist.gov/vuln/detail/CVE-2026-9930) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9931](https://nvd.nist.gov/vuln/detail/CVE-2026-9931) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9932](https://nvd.nist.gov/vuln/detail/CVE-2026-9932) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9933](https://nvd.nist.gov/vuln/detail/CVE-2026-9933) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9934](https://nvd.nist.gov/vuln/detail/CVE-2026-9934) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9935](https://nvd.nist.gov/vuln/detail/CVE-2026-9935) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9936](https://nvd.nist.gov/vuln/detail/CVE-2026-9936) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9937](https://nvd.nist.gov/vuln/detail/CVE-2026-9937) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9938](https://nvd.nist.gov/vuln/detail/CVE-2026-9938) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9939](https://nvd.nist.gov/vuln/detail/CVE-2026-9939) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9940](https://nvd.nist.gov/vuln/detail/CVE-2026-9940) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9941](https://nvd.nist.gov/vuln/detail/CVE-2026-9941) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9942](https://nvd.nist.gov/vuln/detail/CVE-2026-9942) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9943](https://nvd.nist.gov/vuln/detail/CVE-2026-9943) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9945](https://nvd.nist.gov/vuln/detail/CVE-2026-9945) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9946](https://nvd.nist.gov/vuln/detail/CVE-2026-9946) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9947](https://nvd.nist.gov/vuln/detail/CVE-2026-9947) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9948](https://nvd.nist.gov/vuln/detail/CVE-2026-9948) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9949](https://nvd.nist.gov/vuln/detail/CVE-2026-9949) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9950](https://nvd.nist.gov/vuln/detail/CVE-2026-9950) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9951](https://nvd.nist.gov/vuln/detail/CVE-2026-9951) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9952](https://nvd.nist.gov/vuln/detail/CVE-2026-9952) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9953](https://nvd.nist.gov/vuln/detail/CVE-2026-9953) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9954](https://nvd.nist.gov/vuln/detail/CVE-2026-9954) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9955](https://nvd.nist.gov/vuln/detail/CVE-2026-9955) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9956](https://nvd.nist.gov/vuln/detail/CVE-2026-9956) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9957](https://nvd.nist.gov/vuln/detail/CVE-2026-9957) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9958](https://nvd.nist.gov/vuln/detail/CVE-2026-9958) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9959](https://nvd.nist.gov/vuln/detail/CVE-2026-9959) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9960](https://nvd.nist.gov/vuln/detail/CVE-2026-9960) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9961](https://nvd.nist.gov/vuln/detail/CVE-2026-9961) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9962](https://nvd.nist.gov/vuln/detail/CVE-2026-9962) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9963](https://nvd.nist.gov/vuln/detail/CVE-2026-9963) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9964](https://nvd.nist.gov/vuln/detail/CVE-2026-9964) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9965](https://nvd.nist.gov/vuln/detail/CVE-2026-9965) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9966](https://nvd.nist.gov/vuln/detail/CVE-2026-9966) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9967](https://nvd.nist.gov/vuln/detail/CVE-2026-9967) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9968](https://nvd.nist.gov/vuln/detail/CVE-2026-9968) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9969](https://nvd.nist.gov/vuln/detail/CVE-2026-9969) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9970](https://nvd.nist.gov/vuln/detail/CVE-2026-9970) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9971](https://nvd.nist.gov/vuln/detail/CVE-2026-9971) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9972](https://nvd.nist.gov/vuln/detail/CVE-2026-9972) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9973](https://nvd.nist.gov/vuln/detail/CVE-2026-9973) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9974](https://nvd.nist.gov/vuln/detail/CVE-2026-9974) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9975](https://nvd.nist.gov/vuln/detail/CVE-2026-9975) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9976](https://nvd.nist.gov/vuln/detail/CVE-2026-9976) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9977](https://nvd.nist.gov/vuln/detail/CVE-2026-9977) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9978](https://nvd.nist.gov/vuln/detail/CVE-2026-9978) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9979](https://nvd.nist.gov/vuln/detail/CVE-2026-9979) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9980](https://nvd.nist.gov/vuln/detail/CVE-2026-9980) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9981](https://nvd.nist.gov/vuln/detail/CVE-2026-9981) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9982](https://nvd.nist.gov/vuln/detail/CVE-2026-9982) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9983](https://nvd.nist.gov/vuln/detail/CVE-2026-9983) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9984](https://nvd.nist.gov/vuln/detail/CVE-2026-9984) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9985](https://nvd.nist.gov/vuln/detail/CVE-2026-9985) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9986](https://nvd.nist.gov/vuln/detail/CVE-2026-9986) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9987](https://nvd.nist.gov/vuln/detail/CVE-2026-9987) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9988](https://nvd.nist.gov/vuln/detail/CVE-2026-9988) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9989](https://nvd.nist.gov/vuln/detail/CVE-2026-9989) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9990](https://nvd.nist.gov/vuln/detail/CVE-2026-9990) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9991](https://nvd.nist.gov/vuln/detail/CVE-2026-9991) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9992](https://nvd.nist.gov/vuln/detail/CVE-2026-9992) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9993](https://nvd.nist.gov/vuln/detail/CVE-2026-9993) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9994](https://nvd.nist.gov/vuln/detail/CVE-2026-9994) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9995](https://nvd.nist.gov/vuln/detail/CVE-2026-9995) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9996](https://nvd.nist.gov/vuln/detail/CVE-2026-9996) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9997](https://nvd.nist.gov/vuln/detail/CVE-2026-9997) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9998](https://nvd.nist.gov/vuln/detail/CVE-2026-9998) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-9999](https://nvd.nist.gov/vuln/detail/CVE-2026-9999) | HIGH | `chromium-sandbox` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2022-42916](https://nvd.nist.gov/vuln/detail/CVE-2022-42916) | HIGH | `curl` | unpatched · no fix | 5 images · v2.3 |
| [CVE-2022-43551](https://nvd.nist.gov/vuln/detail/CVE-2022-43551) | HIGH | `curl` | unpatched · no fix | 5 images · v2.3 |
| [CVE-2026-12064](https://nvd.nist.gov/vuln/detail/CVE-2026-12064) | HIGH | `curl` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-5773](https://nvd.nist.gov/vuln/detail/CVE-2026-5773) | HIGH | `curl` | unpatched · no fix | 5 images · v2.3 |
| [CVE-2026-6276](https://nvd.nist.gov/vuln/detail/CVE-2026-6276) | HIGH | `curl` | unpatched · no fix | 20 images · v2.3, v3.8, v4.2 |
| [CVE-2026-8286](https://nvd.nist.gov/vuln/detail/CVE-2026-8286) | HIGH | `curl` | unpatched · no fix | 25 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-8458](https://nvd.nist.gov/vuln/detail/CVE-2026-8458) | HIGH | `curl` | unpatched · no fix | 25 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-8927](https://nvd.nist.gov/vuln/detail/CVE-2026-8927) | HIGH | `curl` | unpatched · no fix | 25 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-24882](https://nvd.nist.gov/vuln/detail/CVE-2026-24882) | HIGH | `dirmngr` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-66140](https://nvd.nist.gov/vuln/detail/CVE-2026-66140) | HIGH | `exim4-base` | unpatched · no fix | 4 images · v2.3, v3.8, v4.2 |
| [CVE-2026-66140](https://nvd.nist.gov/vuln/detail/CVE-2026-66140) | HIGH | `exim4-config` | unpatched · no fix | 4 images · v2.3, v3.8, v4.2 |
| [CVE-2026-66140](https://nvd.nist.gov/vuln/detail/CVE-2026-66140) | HIGH | `exim4-daemon-light` | unpatched · no fix | 4 images · v2.3, v3.8, v4.2 |
| [CVE-2026-58049](https://nvd.nist.gov/vuln/detail/CVE-2026-58049) | HIGH | `ffmpeg` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64830](https://nvd.nist.gov/vuln/detail/CVE-2026-64830) | HIGH | `ffmpeg` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64831](https://nvd.nist.gov/vuln/detail/CVE-2026-64831) | HIGH | `ffmpeg` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64832](https://nvd.nist.gov/vuln/detail/CVE-2026-64832) | HIGH | `ffmpeg` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64833](https://nvd.nist.gov/vuln/detail/CVE-2026-64833) | HIGH | `ffmpeg` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64834](https://nvd.nist.gov/vuln/detail/CVE-2026-64834) | HIGH | `ffmpeg` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64835](https://nvd.nist.gov/vuln/detail/CVE-2026-64835) | HIGH | `ffmpeg` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-66036](https://nvd.nist.gov/vuln/detail/CVE-2026-66036) | HIGH | `ffmpeg` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-66039](https://nvd.nist.gov/vuln/detail/CVE-2026-66039) | HIGH | `ffmpeg` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-66040](https://nvd.nist.gov/vuln/detail/CVE-2026-66040) | HIGH | `ffmpeg` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-66041](https://nvd.nist.gov/vuln/detail/CVE-2026-66041) | HIGH | `ffmpeg` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-70628](https://nvd.nist.gov/vuln/detail/CVE-2026-70628) | HIGH | `ffmpeg` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-70632](https://nvd.nist.gov/vuln/detail/CVE-2026-70632) | HIGH | `ffmpeg` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2025-65104](https://nvd.nist.gov/vuln/detail/CVE-2025-65104) | HIGH | `firebird3.0-common` | unpatched · no fix | 4 images · v2.3, v3.8, v4.2 |
| [CVE-2025-65104](https://nvd.nist.gov/vuln/detail/CVE-2025-65104) | HIGH | `firebird3.0-common-doc` | unpatched · no fix | 4 images · v2.3, v3.8, v4.2 |
| [CVE-2025-65104](https://nvd.nist.gov/vuln/detail/CVE-2025-65104) | HIGH | `firebird3.0-server-core` | unpatched · no fix | 4 images · v2.3, v3.8, v4.2 |
| [CVE-2025-65104](https://nvd.nist.gov/vuln/detail/CVE-2025-65104) | HIGH | `firebird3.0-utils` | unpatched · no fix | 4 images · v2.3, v3.8, v4.2 |
| [CVE-2026-4430](https://nvd.nist.gov/vuln/detail/CVE-2026-4430) | HIGH | `fonts-opensymbol` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6040](https://nvd.nist.gov/vuln/detail/CVE-2026-6040) | HIGH | `fonts-opensymbol` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8357](https://nvd.nist.gov/vuln/detail/CVE-2026-8357) | HIGH | `fonts-opensymbol` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-24882](https://nvd.nist.gov/vuln/detail/CVE-2026-24882) | HIGH | `gnupg` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-24882](https://nvd.nist.gov/vuln/detail/CVE-2026-24882) | HIGH | `gnupg-l10n` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-24882](https://nvd.nist.gov/vuln/detail/CVE-2026-24882) | HIGH | `gnupg-utils` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-24882](https://nvd.nist.gov/vuln/detail/CVE-2026-24882) | HIGH | `gpg` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-24882](https://nvd.nist.gov/vuln/detail/CVE-2026-24882) | HIGH | `gpg-agent` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-24882](https://nvd.nist.gov/vuln/detail/CVE-2026-24882) | HIGH | `gpg-wks-client` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-24882](https://nvd.nist.gov/vuln/detail/CVE-2026-24882) | HIGH | `gpgconf` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-24882](https://nvd.nist.gov/vuln/detail/CVE-2026-24882) | HIGH | `gpgsm` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-24882](https://nvd.nist.gov/vuln/detail/CVE-2026-24882) | HIGH | `gpgv` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-19387](https://nvd.nist.gov/vuln/detail/CVE-2026-19387) | HIGH | `gstreamer1.0-plugins-bad` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-52720](https://nvd.nist.gov/vuln/detail/CVE-2026-52720) | HIGH | `gstreamer1.0-plugins-bad` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-52722](https://nvd.nist.gov/vuln/detail/CVE-2026-52722) | HIGH | `gstreamer1.0-plugins-bad` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-59691](https://nvd.nist.gov/vuln/detail/CVE-2026-59691) | HIGH | `gstreamer1.0-plugins-bad` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-59692](https://nvd.nist.gov/vuln/detail/CVE-2026-59692) | HIGH | `gstreamer1.0-plugins-bad` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-53705](https://nvd.nist.gov/vuln/detail/CVE-2026-53705) | HIGH | `gstreamer1.0-plugins-good` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-19389](https://nvd.nist.gov/vuln/detail/CVE-2026-19389) | HIGH | `gstreamer1.0-plugins-ugly` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-41992](https://nvd.nist.gov/vuln/detail/CVE-2026-41992) | HIGH | `gzip` | unpatched · no fix | 25 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-56374](https://nvd.nist.gov/vuln/detail/CVE-2026-56374) | HIGH | `imagemagick` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-61857](https://nvd.nist.gov/vuln/detail/CVE-2026-61857) | HIGH | `imagemagick` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-61861](https://nvd.nist.gov/vuln/detail/CVE-2026-61861) | HIGH | `imagemagick` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-61863](https://nvd.nist.gov/vuln/detail/CVE-2026-61863) | HIGH | `imagemagick` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-61866](https://nvd.nist.gov/vuln/detail/CVE-2026-61866) | HIGH | `imagemagick` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-61870](https://nvd.nist.gov/vuln/detail/CVE-2026-61870) | HIGH | `imagemagick` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-56374](https://nvd.nist.gov/vuln/detail/CVE-2026-56374) | HIGH | `imagemagick-7-common` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-61857](https://nvd.nist.gov/vuln/detail/CVE-2026-61857) | HIGH | `imagemagick-7-common` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-61861](https://nvd.nist.gov/vuln/detail/CVE-2026-61861) | HIGH | `imagemagick-7-common` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-61863](https://nvd.nist.gov/vuln/detail/CVE-2026-61863) | HIGH | `imagemagick-7-common` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-61866](https://nvd.nist.gov/vuln/detail/CVE-2026-61866) | HIGH | `imagemagick-7-common` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-61870](https://nvd.nist.gov/vuln/detail/CVE-2026-61870) | HIGH | `imagemagick-7-common` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-56374](https://nvd.nist.gov/vuln/detail/CVE-2026-56374) | HIGH | `imagemagick-7.q16` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-61857](https://nvd.nist.gov/vuln/detail/CVE-2026-61857) | HIGH | `imagemagick-7.q16` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-61861](https://nvd.nist.gov/vuln/detail/CVE-2026-61861) | HIGH | `imagemagick-7.q16` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-61863](https://nvd.nist.gov/vuln/detail/CVE-2026-61863) | HIGH | `imagemagick-7.q16` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-61866](https://nvd.nist.gov/vuln/detail/CVE-2026-61866) | HIGH | `imagemagick-7.q16` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-61870](https://nvd.nist.gov/vuln/detail/CVE-2026-61870) | HIGH | `imagemagick-7.q16` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-54369](https://nvd.nist.gov/vuln/detail/CVE-2026-54369) | HIGH | `libacl1` | unpatched · no fix | 25 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2020-0478](https://nvd.nist.gov/vuln/detail/CVE-2020-0478) | HIGH | `libaom0` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2026-58049](https://nvd.nist.gov/vuln/detail/CVE-2026-58049) | HIGH | `libavcodec61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64830](https://nvd.nist.gov/vuln/detail/CVE-2026-64830) | HIGH | `libavcodec61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64831](https://nvd.nist.gov/vuln/detail/CVE-2026-64831) | HIGH | `libavcodec61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64832](https://nvd.nist.gov/vuln/detail/CVE-2026-64832) | HIGH | `libavcodec61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64833](https://nvd.nist.gov/vuln/detail/CVE-2026-64833) | HIGH | `libavcodec61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64834](https://nvd.nist.gov/vuln/detail/CVE-2026-64834) | HIGH | `libavcodec61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64835](https://nvd.nist.gov/vuln/detail/CVE-2026-64835) | HIGH | `libavcodec61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-66036](https://nvd.nist.gov/vuln/detail/CVE-2026-66036) | HIGH | `libavcodec61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-66039](https://nvd.nist.gov/vuln/detail/CVE-2026-66039) | HIGH | `libavcodec61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-66040](https://nvd.nist.gov/vuln/detail/CVE-2026-66040) | HIGH | `libavcodec61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-66041](https://nvd.nist.gov/vuln/detail/CVE-2026-66041) | HIGH | `libavcodec61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-70628](https://nvd.nist.gov/vuln/detail/CVE-2026-70628) | HIGH | `libavcodec61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-70632](https://nvd.nist.gov/vuln/detail/CVE-2026-70632) | HIGH | `libavcodec61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-58049](https://nvd.nist.gov/vuln/detail/CVE-2026-58049) | HIGH | `libavdevice61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64830](https://nvd.nist.gov/vuln/detail/CVE-2026-64830) | HIGH | `libavdevice61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64831](https://nvd.nist.gov/vuln/detail/CVE-2026-64831) | HIGH | `libavdevice61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64832](https://nvd.nist.gov/vuln/detail/CVE-2026-64832) | HIGH | `libavdevice61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64833](https://nvd.nist.gov/vuln/detail/CVE-2026-64833) | HIGH | `libavdevice61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64834](https://nvd.nist.gov/vuln/detail/CVE-2026-64834) | HIGH | `libavdevice61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64835](https://nvd.nist.gov/vuln/detail/CVE-2026-64835) | HIGH | `libavdevice61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-66036](https://nvd.nist.gov/vuln/detail/CVE-2026-66036) | HIGH | `libavdevice61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-66039](https://nvd.nist.gov/vuln/detail/CVE-2026-66039) | HIGH | `libavdevice61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-66040](https://nvd.nist.gov/vuln/detail/CVE-2026-66040) | HIGH | `libavdevice61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-66041](https://nvd.nist.gov/vuln/detail/CVE-2026-66041) | HIGH | `libavdevice61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-70628](https://nvd.nist.gov/vuln/detail/CVE-2026-70628) | HIGH | `libavdevice61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-70632](https://nvd.nist.gov/vuln/detail/CVE-2026-70632) | HIGH | `libavdevice61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-58049](https://nvd.nist.gov/vuln/detail/CVE-2026-58049) | HIGH | `libavfilter10` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64830](https://nvd.nist.gov/vuln/detail/CVE-2026-64830) | HIGH | `libavfilter10` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64831](https://nvd.nist.gov/vuln/detail/CVE-2026-64831) | HIGH | `libavfilter10` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64832](https://nvd.nist.gov/vuln/detail/CVE-2026-64832) | HIGH | `libavfilter10` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64833](https://nvd.nist.gov/vuln/detail/CVE-2026-64833) | HIGH | `libavfilter10` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64834](https://nvd.nist.gov/vuln/detail/CVE-2026-64834) | HIGH | `libavfilter10` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64835](https://nvd.nist.gov/vuln/detail/CVE-2026-64835) | HIGH | `libavfilter10` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-66036](https://nvd.nist.gov/vuln/detail/CVE-2026-66036) | HIGH | `libavfilter10` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-66039](https://nvd.nist.gov/vuln/detail/CVE-2026-66039) | HIGH | `libavfilter10` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-66040](https://nvd.nist.gov/vuln/detail/CVE-2026-66040) | HIGH | `libavfilter10` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-66041](https://nvd.nist.gov/vuln/detail/CVE-2026-66041) | HIGH | `libavfilter10` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-70628](https://nvd.nist.gov/vuln/detail/CVE-2026-70628) | HIGH | `libavfilter10` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-70632](https://nvd.nist.gov/vuln/detail/CVE-2026-70632) | HIGH | `libavfilter10` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-58049](https://nvd.nist.gov/vuln/detail/CVE-2026-58049) | HIGH | `libavformat61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64830](https://nvd.nist.gov/vuln/detail/CVE-2026-64830) | HIGH | `libavformat61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64831](https://nvd.nist.gov/vuln/detail/CVE-2026-64831) | HIGH | `libavformat61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64832](https://nvd.nist.gov/vuln/detail/CVE-2026-64832) | HIGH | `libavformat61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64833](https://nvd.nist.gov/vuln/detail/CVE-2026-64833) | HIGH | `libavformat61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64834](https://nvd.nist.gov/vuln/detail/CVE-2026-64834) | HIGH | `libavformat61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64835](https://nvd.nist.gov/vuln/detail/CVE-2026-64835) | HIGH | `libavformat61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-66036](https://nvd.nist.gov/vuln/detail/CVE-2026-66036) | HIGH | `libavformat61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-66039](https://nvd.nist.gov/vuln/detail/CVE-2026-66039) | HIGH | `libavformat61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-66040](https://nvd.nist.gov/vuln/detail/CVE-2026-66040) | HIGH | `libavformat61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-66041](https://nvd.nist.gov/vuln/detail/CVE-2026-66041) | HIGH | `libavformat61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-70628](https://nvd.nist.gov/vuln/detail/CVE-2026-70628) | HIGH | `libavformat61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-70632](https://nvd.nist.gov/vuln/detail/CVE-2026-70632) | HIGH | `libavformat61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-58049](https://nvd.nist.gov/vuln/detail/CVE-2026-58049) | HIGH | `libavutil59` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64830](https://nvd.nist.gov/vuln/detail/CVE-2026-64830) | HIGH | `libavutil59` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64831](https://nvd.nist.gov/vuln/detail/CVE-2026-64831) | HIGH | `libavutil59` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64832](https://nvd.nist.gov/vuln/detail/CVE-2026-64832) | HIGH | `libavutil59` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64833](https://nvd.nist.gov/vuln/detail/CVE-2026-64833) | HIGH | `libavutil59` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64834](https://nvd.nist.gov/vuln/detail/CVE-2026-64834) | HIGH | `libavutil59` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64835](https://nvd.nist.gov/vuln/detail/CVE-2026-64835) | HIGH | `libavutil59` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-66036](https://nvd.nist.gov/vuln/detail/CVE-2026-66036) | HIGH | `libavutil59` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-66039](https://nvd.nist.gov/vuln/detail/CVE-2026-66039) | HIGH | `libavutil59` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-66040](https://nvd.nist.gov/vuln/detail/CVE-2026-66040) | HIGH | `libavutil59` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-66041](https://nvd.nist.gov/vuln/detail/CVE-2026-66041) | HIGH | `libavutil59` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-70628](https://nvd.nist.gov/vuln/detail/CVE-2026-70628) | HIGH | `libavutil59` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-70632](https://nvd.nist.gov/vuln/detail/CVE-2026-70632) | HIGH | `libavutil59` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-0636](https://nvd.nist.gov/vuln/detail/CVE-2026-0636) | HIGH | `libbcmail-java` | unpatched · no fix | 5 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-3505](https://nvd.nist.gov/vuln/detail/CVE-2026-3505) | HIGH | `libbcmail-java` | unpatched · no fix | 5 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-5588](https://nvd.nist.gov/vuln/detail/CVE-2026-5588) | HIGH | `libbcmail-java` | unpatched · no fix | 5 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-5598](https://nvd.nist.gov/vuln/detail/CVE-2026-5598) | HIGH | `libbcmail-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-0636](https://nvd.nist.gov/vuln/detail/CVE-2026-0636) | HIGH | `libbcpkix-java` | unpatched · no fix | 5 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-3505](https://nvd.nist.gov/vuln/detail/CVE-2026-3505) | HIGH | `libbcpkix-java` | unpatched · no fix | 5 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-5588](https://nvd.nist.gov/vuln/detail/CVE-2026-5588) | HIGH | `libbcpkix-java` | unpatched · no fix | 5 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-5598](https://nvd.nist.gov/vuln/detail/CVE-2026-5598) | HIGH | `libbcpkix-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-0636](https://nvd.nist.gov/vuln/detail/CVE-2026-0636) | HIGH | `libbcprov-java` | unpatched · no fix | 5 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-3505](https://nvd.nist.gov/vuln/detail/CVE-2026-3505) | HIGH | `libbcprov-java` | unpatched · no fix | 5 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-5588](https://nvd.nist.gov/vuln/detail/CVE-2026-5588) | HIGH | `libbcprov-java` | unpatched · no fix | 5 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-5598](https://nvd.nist.gov/vuln/detail/CVE-2026-5598) | HIGH | `libbcprov-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-0636](https://nvd.nist.gov/vuln/detail/CVE-2026-0636) | HIGH | `libbcutil-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-3505](https://nvd.nist.gov/vuln/detail/CVE-2026-3505) | HIGH | `libbcutil-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-5588](https://nvd.nist.gov/vuln/detail/CVE-2026-5588) | HIGH | `libbcutil-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-5598](https://nvd.nist.gov/vuln/detail/CVE-2026-5598) | HIGH | `libbcutil-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-53615](https://nvd.nist.gov/vuln/detail/CVE-2026-53615) | HIGH | `libblkid1` | unpatched · no fix | 25 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-4878](https://nvd.nist.gov/vuln/detail/CVE-2026-4878) | HIGH | `libcap2` | unpatched · no fix | 5 images · v2.3 |
| [CVE-2026-4878](https://nvd.nist.gov/vuln/detail/CVE-2026-4878) | HIGH | `libcap2-bin` | unpatched · no fix | 5 images · v2.3 |
| [CVE-2026-67216](https://nvd.nist.gov/vuln/detail/CVE-2026-67216) | HIGH | `libcjson1` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2021-35515](https://nvd.nist.gov/vuln/detail/CVE-2021-35515) | HIGH | `libcommons-compress-java` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2021-35516](https://nvd.nist.gov/vuln/detail/CVE-2021-35516) | HIGH | `libcommons-compress-java` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2021-35517](https://nvd.nist.gov/vuln/detail/CVE-2021-35517) | HIGH | `libcommons-compress-java` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2021-36090](https://nvd.nist.gov/vuln/detail/CVE-2021-36090) | HIGH | `libcommons-compress-java` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-34980](https://nvd.nist.gov/vuln/detail/CVE-2026-34980) | HIGH | `libcups2` | unpatched · no fix | 16 images · v2.3, v3.8, v4.2 |
| [CVE-2026-34980](https://nvd.nist.gov/vuln/detail/CVE-2026-34980) | HIGH | `libcups2t64` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2022-42916](https://nvd.nist.gov/vuln/detail/CVE-2022-42916) | HIGH | `libcurl3-gnutls` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2022-43551](https://nvd.nist.gov/vuln/detail/CVE-2022-43551) | HIGH | `libcurl3-gnutls` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2026-12064](https://nvd.nist.gov/vuln/detail/CVE-2026-12064) | HIGH | `libcurl3-gnutls` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-5773](https://nvd.nist.gov/vuln/detail/CVE-2026-5773) | HIGH | `libcurl3-gnutls` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2026-6276](https://nvd.nist.gov/vuln/detail/CVE-2026-6276) | HIGH | `libcurl3-gnutls` | unpatched · no fix | 16 images · v2.3, v3.8, v4.2 |
| [CVE-2026-8286](https://nvd.nist.gov/vuln/detail/CVE-2026-8286) | HIGH | `libcurl3-gnutls` | unpatched · no fix | 16 images · v2.3, v3.8, v4.2 |
| [CVE-2026-8458](https://nvd.nist.gov/vuln/detail/CVE-2026-8458) | HIGH | `libcurl3-gnutls` | unpatched · no fix | 16 images · v2.3, v3.8, v4.2 |
| [CVE-2026-8927](https://nvd.nist.gov/vuln/detail/CVE-2026-8927) | HIGH | `libcurl3-gnutls` | unpatched · no fix | 16 images · v2.3, v3.8, v4.2 |
| [CVE-2026-12064](https://nvd.nist.gov/vuln/detail/CVE-2026-12064) | HIGH | `libcurl3t64-gnutls` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-8286](https://nvd.nist.gov/vuln/detail/CVE-2026-8286) | HIGH | `libcurl3t64-gnutls` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-8458](https://nvd.nist.gov/vuln/detail/CVE-2026-8458) | HIGH | `libcurl3t64-gnutls` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-8927](https://nvd.nist.gov/vuln/detail/CVE-2026-8927) | HIGH | `libcurl3t64-gnutls` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2022-42916](https://nvd.nist.gov/vuln/detail/CVE-2022-42916) | HIGH | `libcurl4` | unpatched · no fix | 5 images · v2.3 |
| [CVE-2022-43551](https://nvd.nist.gov/vuln/detail/CVE-2022-43551) | HIGH | `libcurl4` | unpatched · no fix | 5 images · v2.3 |
| [CVE-2026-12064](https://nvd.nist.gov/vuln/detail/CVE-2026-12064) | HIGH | `libcurl4` | unpatched · no fix | 15 images · v3.8, v4.2 |
| [CVE-2026-5773](https://nvd.nist.gov/vuln/detail/CVE-2026-5773) | HIGH | `libcurl4` | unpatched · no fix | 5 images · v2.3 |
| [CVE-2026-6276](https://nvd.nist.gov/vuln/detail/CVE-2026-6276) | HIGH | `libcurl4` | unpatched · no fix | 20 images · v2.3, v3.8, v4.2 |
| [CVE-2026-8286](https://nvd.nist.gov/vuln/detail/CVE-2026-8286) | HIGH | `libcurl4` | unpatched · no fix | 20 images · v2.3, v3.8, v4.2 |
| [CVE-2026-8458](https://nvd.nist.gov/vuln/detail/CVE-2026-8458) | HIGH | `libcurl4` | unpatched · no fix | 20 images · v2.3, v3.8, v4.2 |
| [CVE-2026-8927](https://nvd.nist.gov/vuln/detail/CVE-2026-8927) | HIGH | `libcurl4` | unpatched · no fix | 20 images · v2.3, v3.8, v4.2 |
| [CVE-2026-12064](https://nvd.nist.gov/vuln/detail/CVE-2026-12064) | HIGH | `libcurl4t64` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-8286](https://nvd.nist.gov/vuln/detail/CVE-2026-8286) | HIGH | `libcurl4t64` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-8458](https://nvd.nist.gov/vuln/detail/CVE-2026-8458) | HIGH | `libcurl4t64` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-8927](https://nvd.nist.gov/vuln/detail/CVE-2026-8927) | HIGH | `libcurl4t64` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-33164](https://nvd.nist.gov/vuln/detail/CVE-2026-33164) | HIGH | `libde265-0` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2025-59375](https://nvd.nist.gov/vuln/detail/CVE-2025-59375) | HIGH | `libexpat1` | unpatched · no fix | 16 images · v2.3, v3.8, v4.2 |
| [CVE-2026-25210](https://nvd.nist.gov/vuln/detail/CVE-2026-25210) | HIGH | `libexpat1` | unpatched · no fix | 16 images · v2.3, v3.8, v4.2 |
| [CVE-2026-45186](https://nvd.nist.gov/vuln/detail/CVE-2026-45186) | HIGH | `libexpat1` | unpatched · no fix | 16 images · v2.3, v3.8, v4.2 |
| [CVE-2026-56408](https://nvd.nist.gov/vuln/detail/CVE-2026-56408) | HIGH | `libexpat1` | unpatched · no fix | 16 images · v2.3, v3.8, v4.2 |
| [CVE-2025-65104](https://nvd.nist.gov/vuln/detail/CVE-2025-65104) | HIGH | `libfbclient2` | unpatched · no fix | 4 images · v2.3, v3.8, v4.2 |
| [CVE-2026-53615](https://nvd.nist.gov/vuln/detail/CVE-2026-53615) | HIGH | `libfdisk1` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2021-33560](https://nvd.nist.gov/vuln/detail/CVE-2021-33560) | HIGH | `libgcrypt20` | unpatched · no fix | 5 images · v2.3 |
| [CVE-2026-58010](https://nvd.nist.gov/vuln/detail/CVE-2026-58010) | HIGH | `libglib2.0-0` | unpatched · no fix | 16 images · v2.3, v3.8, v4.2 |
| [CVE-2026-58011](https://nvd.nist.gov/vuln/detail/CVE-2026-58011) | HIGH | `libglib2.0-0` | unpatched · no fix | 16 images · v2.3, v3.8, v4.2 |
| [CVE-2026-58012](https://nvd.nist.gov/vuln/detail/CVE-2026-58012) | HIGH | `libglib2.0-0` | unpatched · no fix | 16 images · v2.3, v3.8, v4.2 |
| [CVE-2026-58013](https://nvd.nist.gov/vuln/detail/CVE-2026-58013) | HIGH | `libglib2.0-0` | unpatched · no fix | 16 images · v2.3, v3.8, v4.2 |
| [CVE-2026-58014](https://nvd.nist.gov/vuln/detail/CVE-2026-58014) | HIGH | `libglib2.0-0` | unpatched · no fix | 16 images · v2.3, v3.8, v4.2 |
| [CVE-2026-58015](https://nvd.nist.gov/vuln/detail/CVE-2026-58015) | HIGH | `libglib2.0-0` | unpatched · no fix | 16 images · v2.3, v3.8, v4.2 |
| [CVE-2026-58010](https://nvd.nist.gov/vuln/detail/CVE-2026-58010) | HIGH | `libglib2.0-0t64` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-58011](https://nvd.nist.gov/vuln/detail/CVE-2026-58011) | HIGH | `libglib2.0-0t64` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-58012](https://nvd.nist.gov/vuln/detail/CVE-2026-58012) | HIGH | `libglib2.0-0t64` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-58013](https://nvd.nist.gov/vuln/detail/CVE-2026-58013) | HIGH | `libglib2.0-0t64` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-58014](https://nvd.nist.gov/vuln/detail/CVE-2026-58014) | HIGH | `libglib2.0-0t64` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-58015](https://nvd.nist.gov/vuln/detail/CVE-2026-58015) | HIGH | `libglib2.0-0t64` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-58010](https://nvd.nist.gov/vuln/detail/CVE-2026-58010) | HIGH | `libglib2.0-data` | unpatched · no fix | 20 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-58011](https://nvd.nist.gov/vuln/detail/CVE-2026-58011) | HIGH | `libglib2.0-data` | unpatched · no fix | 20 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-58012](https://nvd.nist.gov/vuln/detail/CVE-2026-58012) | HIGH | `libglib2.0-data` | unpatched · no fix | 20 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-58013](https://nvd.nist.gov/vuln/detail/CVE-2026-58013) | HIGH | `libglib2.0-data` | unpatched · no fix | 20 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-58014](https://nvd.nist.gov/vuln/detail/CVE-2026-58014) | HIGH | `libglib2.0-data` | unpatched · no fix | 20 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-58015](https://nvd.nist.gov/vuln/detail/CVE-2026-58015) | HIGH | `libglib2.0-data` | unpatched · no fix | 20 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-19387](https://nvd.nist.gov/vuln/detail/CVE-2026-19387) | HIGH | `libgstreamer-plugins-bad1.0-0` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-52720](https://nvd.nist.gov/vuln/detail/CVE-2026-52720) | HIGH | `libgstreamer-plugins-bad1.0-0` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-52722](https://nvd.nist.gov/vuln/detail/CVE-2026-52722) | HIGH | `libgstreamer-plugins-bad1.0-0` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-59691](https://nvd.nist.gov/vuln/detail/CVE-2026-59691) | HIGH | `libgstreamer-plugins-bad1.0-0` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-59692](https://nvd.nist.gov/vuln/detail/CVE-2026-59692) | HIGH | `libgstreamer-plugins-bad1.0-0` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2023-2976](https://nvd.nist.gov/vuln/detail/CVE-2023-2976) | HIGH | `libguava-java` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2021-33516](https://nvd.nist.gov/vuln/detail/CVE-2021-33516) | HIGH | `libgupnp-1.2-0` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2023-25193](https://nvd.nist.gov/vuln/detail/CVE-2023-25193) | HIGH | `libharfbuzz-icu0` | unpatched · no fix | 4 images · v2.3, v3.8, v4.2 |
| [CVE-2023-25193](https://nvd.nist.gov/vuln/detail/CVE-2023-25193) | HIGH | `libharfbuzz0b` | unpatched · no fix | 16 images · v2.3, v3.8, v4.2 |
| [CVE-2025-68431](https://nvd.nist.gov/vuln/detail/CVE-2025-68431) | HIGH | `libheif1` | unpatched · no fix | 16 images · v2.3, v3.8, v4.2 |
| [CVE-2026-32740](https://nvd.nist.gov/vuln/detail/CVE-2026-32740) | HIGH | `libheif1` | unpatched · no fix | 16 images · v2.3, v3.8, v4.2 |
| [CVE-2026-32741](https://nvd.nist.gov/vuln/detail/CVE-2026-32741) | HIGH | `libheif1` | unpatched · no fix | 16 images · v2.3, v3.8, v4.2 |
| [CVE-2026-32882](https://nvd.nist.gov/vuln/detail/CVE-2026-32882) | HIGH | `libheif1` | unpatched · no fix | 16 images · v2.3, v3.8, v4.2 |
| [CVE-2026-41071](https://nvd.nist.gov/vuln/detail/CVE-2026-41071) | HIGH | `libheif1` | unpatched · no fix | 16 images · v2.3, v3.8, v4.2 |
| [CVE-2026-47178](https://nvd.nist.gov/vuln/detail/CVE-2026-47178) | HIGH | `libheif1` | unpatched · no fix | 16 images · v2.3, v3.8, v4.2 |
| [CVE-2026-54399](https://nvd.nist.gov/vuln/detail/CVE-2026-54399) | HIGH | `libhttpcore-java` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-65104](https://nvd.nist.gov/vuln/detail/CVE-2025-65104) | HIGH | `libib-util` | unpatched · no fix | 4 images · v2.3, v3.8, v4.2 |
| [CVE-2022-23935](https://nvd.nist.gov/vuln/detail/CVE-2022-23935) | HIGH | `libimage-exiftool-perl` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2021-37819](https://nvd.nist.gov/vuln/detail/CVE-2021-37819) | HIGH | `libitext-java` | unpatched · no fix | 4 images · v2.3, v3.8, v4.2 |
| [CVE-2021-37714](https://nvd.nist.gov/vuln/detail/CVE-2021-37714) | HIGH | `libjsoup-java` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4430](https://nvd.nist.gov/vuln/detail/CVE-2026-4430) | HIGH | `libjuh-java` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6040](https://nvd.nist.gov/vuln/detail/CVE-2026-6040) | HIGH | `libjuh-java` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8357](https://nvd.nist.gov/vuln/detail/CVE-2026-8357) | HIGH | `libjuh-java` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4430](https://nvd.nist.gov/vuln/detail/CVE-2026-4430) | HIGH | `libjurt-java` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6040](https://nvd.nist.gov/vuln/detail/CVE-2026-6040) | HIGH | `libjurt-java` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8357](https://nvd.nist.gov/vuln/detail/CVE-2026-8357) | HIGH | `libjurt-java` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-70103](https://nvd.nist.gov/vuln/detail/CVE-2025-70103) | HIGH | `libjxl0.7` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-53615](https://nvd.nist.gov/vuln/detail/CVE-2026-53615) | HIGH | `liblastlog2-2` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2023-2953](https://nvd.nist.gov/vuln/detail/CVE-2023-2953) | HIGH | `libldap-2.4-2` | unpatched · no fix | 5 images · v2.3 |
| [CVE-2023-2953](https://nvd.nist.gov/vuln/detail/CVE-2023-2953) | HIGH | `libldap-2.5-0` | unpatched · no fix | 15 images · v3.8, v4.2 |
| [CVE-2026-58221](https://nvd.nist.gov/vuln/detail/CVE-2026-58221) | HIGH | `libldb2` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-58222](https://nvd.nist.gov/vuln/detail/CVE-2026-58222) | HIGH | `libldb2` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-6949](https://nvd.nist.gov/vuln/detail/CVE-2026-6949) | HIGH | `libldb2` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-4430](https://nvd.nist.gov/vuln/detail/CVE-2026-4430) | HIGH | `liblibreoffice-java` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6040](https://nvd.nist.gov/vuln/detail/CVE-2026-6040) | HIGH | `liblibreoffice-java` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8357](https://nvd.nist.gov/vuln/detail/CVE-2026-8357) | HIGH | `liblibreoffice-java` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2019-16226](https://nvd.nist.gov/vuln/detail/CVE-2019-16226) | HIGH | `liblmdb0` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2019-16228](https://nvd.nist.gov/vuln/detail/CVE-2019-16228) | HIGH | `liblmdb0` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-34480](https://nvd.nist.gov/vuln/detail/CVE-2026-34480) | HIGH | `liblog4j1.2-java` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-56374](https://nvd.nist.gov/vuln/detail/CVE-2026-56374) | HIGH | `libmagickcore-7.q16-10` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-61857](https://nvd.nist.gov/vuln/detail/CVE-2026-61857) | HIGH | `libmagickcore-7.q16-10` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-61861](https://nvd.nist.gov/vuln/detail/CVE-2026-61861) | HIGH | `libmagickcore-7.q16-10` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-61863](https://nvd.nist.gov/vuln/detail/CVE-2026-61863) | HIGH | `libmagickcore-7.q16-10` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-61866](https://nvd.nist.gov/vuln/detail/CVE-2026-61866) | HIGH | `libmagickcore-7.q16-10` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-61870](https://nvd.nist.gov/vuln/detail/CVE-2026-61870) | HIGH | `libmagickcore-7.q16-10` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-56374](https://nvd.nist.gov/vuln/detail/CVE-2026-56374) | HIGH | `libmagickcore-7.q16-10-extra` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-61857](https://nvd.nist.gov/vuln/detail/CVE-2026-61857) | HIGH | `libmagickcore-7.q16-10-extra` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-61861](https://nvd.nist.gov/vuln/detail/CVE-2026-61861) | HIGH | `libmagickcore-7.q16-10-extra` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-61863](https://nvd.nist.gov/vuln/detail/CVE-2026-61863) | HIGH | `libmagickcore-7.q16-10-extra` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-61866](https://nvd.nist.gov/vuln/detail/CVE-2026-61866) | HIGH | `libmagickcore-7.q16-10-extra` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-61870](https://nvd.nist.gov/vuln/detail/CVE-2026-61870) | HIGH | `libmagickcore-7.q16-10-extra` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-56374](https://nvd.nist.gov/vuln/detail/CVE-2026-56374) | HIGH | `libmagickwand-7.q16-10` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-61857](https://nvd.nist.gov/vuln/detail/CVE-2026-61857) | HIGH | `libmagickwand-7.q16-10` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-61861](https://nvd.nist.gov/vuln/detail/CVE-2026-61861) | HIGH | `libmagickwand-7.q16-10` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-61863](https://nvd.nist.gov/vuln/detail/CVE-2026-61863) | HIGH | `libmagickwand-7.q16-10` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-61866](https://nvd.nist.gov/vuln/detail/CVE-2026-61866) | HIGH | `libmagickwand-7.q16-10` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-61870](https://nvd.nist.gov/vuln/detail/CVE-2026-61870) | HIGH | `libmagickwand-7.q16-10` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2025-7962](https://nvd.nist.gov/vuln/detail/CVE-2025-7962) | HIGH | `libmail-java` | unpatched · no fix | 5 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2025-13699](https://nvd.nist.gov/vuln/detail/CVE-2025-13699) | HIGH | `libmariadb3` | unpatched · no fix | 2 images · v2.3 |
| [CVE-2026-44168](https://nvd.nist.gov/vuln/detail/CVE-2026-44168) | HIGH | `libmariadb3` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-44171](https://nvd.nist.gov/vuln/detail/CVE-2026-44171) | HIGH | `libmariadb3` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-48163](https://nvd.nist.gov/vuln/detail/CVE-2026-48163) | HIGH | `libmariadb3` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-48165](https://nvd.nist.gov/vuln/detail/CVE-2026-48165) | HIGH | `libmariadb3` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-25835](https://nvd.nist.gov/vuln/detail/CVE-2026-25835) | HIGH | `libmbedcrypto16` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-34872](https://nvd.nist.gov/vuln/detail/CVE-2026-34872) | HIGH | `libmbedcrypto16` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2024-23775](https://nvd.nist.gov/vuln/detail/CVE-2024-23775) | HIGH | `libmbedcrypto3` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2026-25835](https://nvd.nist.gov/vuln/detail/CVE-2026-25835) | HIGH | `libmbedcrypto3` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2026-34872](https://nvd.nist.gov/vuln/detail/CVE-2026-34872) | HIGH | `libmbedcrypto3` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2024-23775](https://nvd.nist.gov/vuln/detail/CVE-2024-23775) | HIGH | `libmbedcrypto7` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2025-48965](https://nvd.nist.gov/vuln/detail/CVE-2025-48965) | HIGH | `libmbedcrypto7` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2025-52496](https://nvd.nist.gov/vuln/detail/CVE-2025-52496) | HIGH | `libmbedcrypto7` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-25835](https://nvd.nist.gov/vuln/detail/CVE-2026-25835) | HIGH | `libmbedcrypto7` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-34872](https://nvd.nist.gov/vuln/detail/CVE-2026-34872) | HIGH | `libmbedcrypto7` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2023-45221](https://nvd.nist.gov/vuln/detail/CVE-2023-45221) | HIGH | `libmfx1` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-53615](https://nvd.nist.gov/vuln/detail/CVE-2026-53615) | HIGH | `libmount1` | unpatched · no fix | 25 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2025-69720](https://nvd.nist.gov/vuln/detail/CVE-2025-69720) | HIGH | `libncurses6` | unpatched · no fix | 6 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2025-69720](https://nvd.nist.gov/vuln/detail/CVE-2025-69720) | HIGH | `libncursesw6` | unpatched · no fix | 20 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-27489](https://nvd.nist.gov/vuln/detail/CVE-2026-27489) | HIGH | `libonnx1t64` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2025-12495](https://nvd.nist.gov/vuln/detail/CVE-2025-12495) | HIGH | `libopenexr-3-1-30` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2025-12839](https://nvd.nist.gov/vuln/detail/CVE-2025-12839) | HIGH | `libopenexr-3-1-30` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2025-12840](https://nvd.nist.gov/vuln/detail/CVE-2025-12840) | HIGH | `libopenexr-3-1-30` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2025-64181](https://nvd.nist.gov/vuln/detail/CVE-2025-64181) | HIGH | `libopenexr-3-1-30` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-27622](https://nvd.nist.gov/vuln/detail/CVE-2026-27622) | HIGH | `libopenexr-3-1-30` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-34379](https://nvd.nist.gov/vuln/detail/CVE-2026-34379) | HIGH | `libopenexr-3-1-30` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-34543](https://nvd.nist.gov/vuln/detail/CVE-2026-34543) | HIGH | `libopenexr-3-1-30` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-34544](https://nvd.nist.gov/vuln/detail/CVE-2026-34544) | HIGH | `libopenexr-3-1-30` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-34545](https://nvd.nist.gov/vuln/detail/CVE-2026-34545) | HIGH | `libopenexr-3-1-30` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-34588](https://nvd.nist.gov/vuln/detail/CVE-2026-34588) | HIGH | `libopenexr-3-1-30` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-40244](https://nvd.nist.gov/vuln/detail/CVE-2026-40244) | HIGH | `libopenexr-3-1-30` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-40250](https://nvd.nist.gov/vuln/detail/CVE-2026-40250) | HIGH | `libopenexr-3-1-30` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-41142](https://nvd.nist.gov/vuln/detail/CVE-2026-41142) | HIGH | `libopenexr-3-1-30` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2025-12495](https://nvd.nist.gov/vuln/detail/CVE-2025-12495) | HIGH | `libopenexr25` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2025-12839](https://nvd.nist.gov/vuln/detail/CVE-2025-12839) | HIGH | `libopenexr25` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2025-12840](https://nvd.nist.gov/vuln/detail/CVE-2025-12840) | HIGH | `libopenexr25` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2026-27622](https://nvd.nist.gov/vuln/detail/CVE-2026-27622) | HIGH | `libopenexr25` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2026-34379](https://nvd.nist.gov/vuln/detail/CVE-2026-34379) | HIGH | `libopenexr25` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2026-34543](https://nvd.nist.gov/vuln/detail/CVE-2026-34543) | HIGH | `libopenexr25` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2026-34544](https://nvd.nist.gov/vuln/detail/CVE-2026-34544) | HIGH | `libopenexr25` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2026-34545](https://nvd.nist.gov/vuln/detail/CVE-2026-34545) | HIGH | `libopenexr25` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2026-34588](https://nvd.nist.gov/vuln/detail/CVE-2026-34588) | HIGH | `libopenexr25` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2026-40244](https://nvd.nist.gov/vuln/detail/CVE-2026-40244) | HIGH | `libopenexr25` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2026-40250](https://nvd.nist.gov/vuln/detail/CVE-2026-40250) | HIGH | `libopenexr25` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2026-41142](https://nvd.nist.gov/vuln/detail/CVE-2026-41142) | HIGH | `libopenexr25` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2026-4878](https://nvd.nist.gov/vuln/detail/CVE-2026-4878) | HIGH | `libpam-cap` | unpatched · no fix | 5 images · v2.3 |
| [CVE-2026-42497](https://nvd.nist.gov/vuln/detail/CVE-2026-42497) | HIGH | `libperl5.32` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2026-48962](https://nvd.nist.gov/vuln/detail/CVE-2026-48962) | HIGH | `libperl5.32` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2026-57432](https://nvd.nist.gov/vuln/detail/CVE-2026-57432) | HIGH | `libperl5.32` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2026-9538](https://nvd.nist.gov/vuln/detail/CVE-2026-9538) | HIGH | `libperl5.32` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2026-42497](https://nvd.nist.gov/vuln/detail/CVE-2026-42497) | HIGH | `libperl5.36` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-48962](https://nvd.nist.gov/vuln/detail/CVE-2026-48962) | HIGH | `libperl5.36` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-57432](https://nvd.nist.gov/vuln/detail/CVE-2026-57432) | HIGH | `libperl5.36` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-9538](https://nvd.nist.gov/vuln/detail/CVE-2026-9538) | HIGH | `libperl5.36` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-42497](https://nvd.nist.gov/vuln/detail/CVE-2026-42497) | HIGH | `libperl5.40` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-48962](https://nvd.nist.gov/vuln/detail/CVE-2026-48962) | HIGH | `libperl5.40` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-57432](https://nvd.nist.gov/vuln/detail/CVE-2026-57432) | HIGH | `libperl5.40` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-9538](https://nvd.nist.gov/vuln/detail/CVE-2026-9538) | HIGH | `libperl5.40` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-5674](https://nvd.nist.gov/vuln/detail/CVE-2026-5674) | HIGH | `libpipewire-0.3-0t64` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-5674](https://nvd.nist.gov/vuln/detail/CVE-2026-5674) | HIGH | `libpipewire-0.3-common` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2025-67030](https://nvd.nist.gov/vuln/detail/CVE-2025-67030) | HIGH | `libplexus-utils2-java` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-58049](https://nvd.nist.gov/vuln/detail/CVE-2026-58049) | HIGH | `libpostproc58` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64830](https://nvd.nist.gov/vuln/detail/CVE-2026-64830) | HIGH | `libpostproc58` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64831](https://nvd.nist.gov/vuln/detail/CVE-2026-64831) | HIGH | `libpostproc58` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64832](https://nvd.nist.gov/vuln/detail/CVE-2026-64832) | HIGH | `libpostproc58` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64833](https://nvd.nist.gov/vuln/detail/CVE-2026-64833) | HIGH | `libpostproc58` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64834](https://nvd.nist.gov/vuln/detail/CVE-2026-64834) | HIGH | `libpostproc58` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64835](https://nvd.nist.gov/vuln/detail/CVE-2026-64835) | HIGH | `libpostproc58` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-66036](https://nvd.nist.gov/vuln/detail/CVE-2026-66036) | HIGH | `libpostproc58` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-66039](https://nvd.nist.gov/vuln/detail/CVE-2026-66039) | HIGH | `libpostproc58` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-66040](https://nvd.nist.gov/vuln/detail/CVE-2026-66040) | HIGH | `libpostproc58` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-66041](https://nvd.nist.gov/vuln/detail/CVE-2026-66041) | HIGH | `libpostproc58` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-70628](https://nvd.nist.gov/vuln/detail/CVE-2026-70628) | HIGH | `libpostproc58` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-70632](https://nvd.nist.gov/vuln/detail/CVE-2026-70632) | HIGH | `libpostproc58` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2025-69534](https://nvd.nist.gov/vuln/detail/CVE-2025-69534) | HIGH | `libpython3.11` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-11940](https://nvd.nist.gov/vuln/detail/CVE-2026-11940) | HIGH | `libpython3.11` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-15308](https://nvd.nist.gov/vuln/detail/CVE-2026-15308) | HIGH | `libpython3.11` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-3644](https://nvd.nist.gov/vuln/detail/CVE-2026-3644) | HIGH | `libpython3.11` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-7210](https://nvd.nist.gov/vuln/detail/CVE-2026-7210) | HIGH | `libpython3.11` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2025-69534](https://nvd.nist.gov/vuln/detail/CVE-2025-69534) | HIGH | `libpython3.11-minimal` | unpatched · no fix | 6 images · v3.8, v4.2 |
| [CVE-2026-11940](https://nvd.nist.gov/vuln/detail/CVE-2026-11940) | HIGH | `libpython3.11-minimal` | unpatched · no fix | 6 images · v3.8, v4.2 |
| [CVE-2026-15308](https://nvd.nist.gov/vuln/detail/CVE-2026-15308) | HIGH | `libpython3.11-minimal` | unpatched · no fix | 6 images · v3.8, v4.2 |
| [CVE-2026-3644](https://nvd.nist.gov/vuln/detail/CVE-2026-3644) | HIGH | `libpython3.11-minimal` | unpatched · no fix | 6 images · v3.8, v4.2 |
| [CVE-2026-7210](https://nvd.nist.gov/vuln/detail/CVE-2026-7210) | HIGH | `libpython3.11-minimal` | unpatched · no fix | 6 images · v3.8, v4.2 |
| [CVE-2025-69534](https://nvd.nist.gov/vuln/detail/CVE-2025-69534) | HIGH | `libpython3.11-stdlib` | unpatched · no fix | 6 images · v3.8, v4.2 |
| [CVE-2026-11940](https://nvd.nist.gov/vuln/detail/CVE-2026-11940) | HIGH | `libpython3.11-stdlib` | unpatched · no fix | 6 images · v3.8, v4.2 |
| [CVE-2026-15308](https://nvd.nist.gov/vuln/detail/CVE-2026-15308) | HIGH | `libpython3.11-stdlib` | unpatched · no fix | 6 images · v3.8, v4.2 |
| [CVE-2026-3644](https://nvd.nist.gov/vuln/detail/CVE-2026-3644) | HIGH | `libpython3.11-stdlib` | unpatched · no fix | 6 images · v3.8, v4.2 |
| [CVE-2026-7210](https://nvd.nist.gov/vuln/detail/CVE-2026-7210) | HIGH | `libpython3.11-stdlib` | unpatched · no fix | 6 images · v3.8, v4.2 |
| [CVE-2026-11940](https://nvd.nist.gov/vuln/detail/CVE-2026-11940) | HIGH | `libpython3.13` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-15308](https://nvd.nist.gov/vuln/detail/CVE-2026-15308) | HIGH | `libpython3.13` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-7210](https://nvd.nist.gov/vuln/detail/CVE-2026-7210) | HIGH | `libpython3.13` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-11940](https://nvd.nist.gov/vuln/detail/CVE-2026-11940) | HIGH | `libpython3.13-minimal` | unpatched · no fix | 2 images · v5.2 |
| [CVE-2026-15308](https://nvd.nist.gov/vuln/detail/CVE-2026-15308) | HIGH | `libpython3.13-minimal` | unpatched · no fix | 2 images · v5.2 |
| [CVE-2026-7210](https://nvd.nist.gov/vuln/detail/CVE-2026-7210) | HIGH | `libpython3.13-minimal` | unpatched · no fix | 2 images · v5.2 |
| [CVE-2026-11940](https://nvd.nist.gov/vuln/detail/CVE-2026-11940) | HIGH | `libpython3.13-stdlib` | unpatched · no fix | 2 images · v5.2 |
| [CVE-2026-15308](https://nvd.nist.gov/vuln/detail/CVE-2026-15308) | HIGH | `libpython3.13-stdlib` | unpatched · no fix | 2 images · v5.2 |
| [CVE-2026-7210](https://nvd.nist.gov/vuln/detail/CVE-2026-7210) | HIGH | `libpython3.13-stdlib` | unpatched · no fix | 2 images · v5.2 |
| [CVE-2025-69534](https://nvd.nist.gov/vuln/detail/CVE-2025-69534) | HIGH | `libpython3.9` | unpatched · no fix | 2 images · v2.3 |
| [CVE-2026-11940](https://nvd.nist.gov/vuln/detail/CVE-2026-11940) | HIGH | `libpython3.9` | unpatched · no fix | 2 images · v2.3 |
| [CVE-2026-15308](https://nvd.nist.gov/vuln/detail/CVE-2026-15308) | HIGH | `libpython3.9` | unpatched · no fix | 2 images · v2.3 |
| [CVE-2026-7210](https://nvd.nist.gov/vuln/detail/CVE-2026-7210) | HIGH | `libpython3.9` | unpatched · no fix | 2 images · v2.3 |
| [CVE-2025-69534](https://nvd.nist.gov/vuln/detail/CVE-2025-69534) | HIGH | `libpython3.9-minimal` | unpatched · no fix | 2 images · v2.3 |
| [CVE-2026-11940](https://nvd.nist.gov/vuln/detail/CVE-2026-11940) | HIGH | `libpython3.9-minimal` | unpatched · no fix | 2 images · v2.3 |
| [CVE-2026-15308](https://nvd.nist.gov/vuln/detail/CVE-2026-15308) | HIGH | `libpython3.9-minimal` | unpatched · no fix | 2 images · v2.3 |
| [CVE-2026-7210](https://nvd.nist.gov/vuln/detail/CVE-2026-7210) | HIGH | `libpython3.9-minimal` | unpatched · no fix | 2 images · v2.3 |
| [CVE-2025-69534](https://nvd.nist.gov/vuln/detail/CVE-2025-69534) | HIGH | `libpython3.9-stdlib` | unpatched · no fix | 2 images · v2.3 |
| [CVE-2026-11940](https://nvd.nist.gov/vuln/detail/CVE-2026-11940) | HIGH | `libpython3.9-stdlib` | unpatched · no fix | 2 images · v2.3 |
| [CVE-2026-15308](https://nvd.nist.gov/vuln/detail/CVE-2026-15308) | HIGH | `libpython3.9-stdlib` | unpatched · no fix | 2 images · v2.3 |
| [CVE-2026-7210](https://nvd.nist.gov/vuln/detail/CVE-2026-7210) | HIGH | `libpython3.9-stdlib` | unpatched · no fix | 2 images · v2.3 |
| [CVE-2026-20889](https://nvd.nist.gov/vuln/detail/CVE-2026-20889) | HIGH | `libraw23t64` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-21413](https://nvd.nist.gov/vuln/detail/CVE-2026-21413) | HIGH | `libraw23t64` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-4430](https://nvd.nist.gov/vuln/detail/CVE-2026-4430) | HIGH | `libreoffice` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6040](https://nvd.nist.gov/vuln/detail/CVE-2026-6040) | HIGH | `libreoffice` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8357](https://nvd.nist.gov/vuln/detail/CVE-2026-8357) | HIGH | `libreoffice` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4430](https://nvd.nist.gov/vuln/detail/CVE-2026-4430) | HIGH | `libreoffice-base` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6040](https://nvd.nist.gov/vuln/detail/CVE-2026-6040) | HIGH | `libreoffice-base` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8357](https://nvd.nist.gov/vuln/detail/CVE-2026-8357) | HIGH | `libreoffice-base` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4430](https://nvd.nist.gov/vuln/detail/CVE-2026-4430) | HIGH | `libreoffice-base-core` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6040](https://nvd.nist.gov/vuln/detail/CVE-2026-6040) | HIGH | `libreoffice-base-core` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8357](https://nvd.nist.gov/vuln/detail/CVE-2026-8357) | HIGH | `libreoffice-base-core` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4430](https://nvd.nist.gov/vuln/detail/CVE-2026-4430) | HIGH | `libreoffice-base-drivers` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6040](https://nvd.nist.gov/vuln/detail/CVE-2026-6040) | HIGH | `libreoffice-base-drivers` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8357](https://nvd.nist.gov/vuln/detail/CVE-2026-8357) | HIGH | `libreoffice-base-drivers` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4430](https://nvd.nist.gov/vuln/detail/CVE-2026-4430) | HIGH | `libreoffice-calc` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6040](https://nvd.nist.gov/vuln/detail/CVE-2026-6040) | HIGH | `libreoffice-calc` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8357](https://nvd.nist.gov/vuln/detail/CVE-2026-8357) | HIGH | `libreoffice-calc` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4430](https://nvd.nist.gov/vuln/detail/CVE-2026-4430) | HIGH | `libreoffice-common` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6040](https://nvd.nist.gov/vuln/detail/CVE-2026-6040) | HIGH | `libreoffice-common` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8357](https://nvd.nist.gov/vuln/detail/CVE-2026-8357) | HIGH | `libreoffice-common` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4430](https://nvd.nist.gov/vuln/detail/CVE-2026-4430) | HIGH | `libreoffice-core` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6040](https://nvd.nist.gov/vuln/detail/CVE-2026-6040) | HIGH | `libreoffice-core` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8357](https://nvd.nist.gov/vuln/detail/CVE-2026-8357) | HIGH | `libreoffice-core` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4430](https://nvd.nist.gov/vuln/detail/CVE-2026-4430) | HIGH | `libreoffice-draw` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6040](https://nvd.nist.gov/vuln/detail/CVE-2026-6040) | HIGH | `libreoffice-draw` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8357](https://nvd.nist.gov/vuln/detail/CVE-2026-8357) | HIGH | `libreoffice-draw` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4430](https://nvd.nist.gov/vuln/detail/CVE-2026-4430) | HIGH | `libreoffice-impress` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6040](https://nvd.nist.gov/vuln/detail/CVE-2026-6040) | HIGH | `libreoffice-impress` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8357](https://nvd.nist.gov/vuln/detail/CVE-2026-8357) | HIGH | `libreoffice-impress` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4430](https://nvd.nist.gov/vuln/detail/CVE-2026-4430) | HIGH | `libreoffice-java-common` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6040](https://nvd.nist.gov/vuln/detail/CVE-2026-6040) | HIGH | `libreoffice-java-common` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8357](https://nvd.nist.gov/vuln/detail/CVE-2026-8357) | HIGH | `libreoffice-java-common` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4430](https://nvd.nist.gov/vuln/detail/CVE-2026-4430) | HIGH | `libreoffice-math` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6040](https://nvd.nist.gov/vuln/detail/CVE-2026-6040) | HIGH | `libreoffice-math` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8357](https://nvd.nist.gov/vuln/detail/CVE-2026-8357) | HIGH | `libreoffice-math` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4430](https://nvd.nist.gov/vuln/detail/CVE-2026-4430) | HIGH | `libreoffice-nlpsolver` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6040](https://nvd.nist.gov/vuln/detail/CVE-2026-6040) | HIGH | `libreoffice-nlpsolver` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8357](https://nvd.nist.gov/vuln/detail/CVE-2026-8357) | HIGH | `libreoffice-nlpsolver` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4430](https://nvd.nist.gov/vuln/detail/CVE-2026-4430) | HIGH | `libreoffice-report-builder` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6040](https://nvd.nist.gov/vuln/detail/CVE-2026-6040) | HIGH | `libreoffice-report-builder` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8357](https://nvd.nist.gov/vuln/detail/CVE-2026-8357) | HIGH | `libreoffice-report-builder` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4430](https://nvd.nist.gov/vuln/detail/CVE-2026-4430) | HIGH | `libreoffice-report-builder-bin` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6040](https://nvd.nist.gov/vuln/detail/CVE-2026-6040) | HIGH | `libreoffice-report-builder-bin` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8357](https://nvd.nist.gov/vuln/detail/CVE-2026-8357) | HIGH | `libreoffice-report-builder-bin` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4430](https://nvd.nist.gov/vuln/detail/CVE-2026-4430) | HIGH | `libreoffice-script-provider-bsh` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6040](https://nvd.nist.gov/vuln/detail/CVE-2026-6040) | HIGH | `libreoffice-script-provider-bsh` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8357](https://nvd.nist.gov/vuln/detail/CVE-2026-8357) | HIGH | `libreoffice-script-provider-bsh` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4430](https://nvd.nist.gov/vuln/detail/CVE-2026-4430) | HIGH | `libreoffice-script-provider-js` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6040](https://nvd.nist.gov/vuln/detail/CVE-2026-6040) | HIGH | `libreoffice-script-provider-js` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8357](https://nvd.nist.gov/vuln/detail/CVE-2026-8357) | HIGH | `libreoffice-script-provider-js` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4430](https://nvd.nist.gov/vuln/detail/CVE-2026-4430) | HIGH | `libreoffice-script-provider-python` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6040](https://nvd.nist.gov/vuln/detail/CVE-2026-6040) | HIGH | `libreoffice-script-provider-python` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8357](https://nvd.nist.gov/vuln/detail/CVE-2026-8357) | HIGH | `libreoffice-script-provider-python` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4430](https://nvd.nist.gov/vuln/detail/CVE-2026-4430) | HIGH | `libreoffice-sdbc-firebird` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6040](https://nvd.nist.gov/vuln/detail/CVE-2026-6040) | HIGH | `libreoffice-sdbc-firebird` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8357](https://nvd.nist.gov/vuln/detail/CVE-2026-8357) | HIGH | `libreoffice-sdbc-firebird` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4430](https://nvd.nist.gov/vuln/detail/CVE-2026-4430) | HIGH | `libreoffice-sdbc-hsqldb` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6040](https://nvd.nist.gov/vuln/detail/CVE-2026-6040) | HIGH | `libreoffice-sdbc-hsqldb` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8357](https://nvd.nist.gov/vuln/detail/CVE-2026-8357) | HIGH | `libreoffice-sdbc-hsqldb` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4430](https://nvd.nist.gov/vuln/detail/CVE-2026-4430) | HIGH | `libreoffice-sdbc-mysql` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6040](https://nvd.nist.gov/vuln/detail/CVE-2026-6040) | HIGH | `libreoffice-sdbc-mysql` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8357](https://nvd.nist.gov/vuln/detail/CVE-2026-8357) | HIGH | `libreoffice-sdbc-mysql` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4430](https://nvd.nist.gov/vuln/detail/CVE-2026-4430) | HIGH | `libreoffice-sdbc-postgresql` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6040](https://nvd.nist.gov/vuln/detail/CVE-2026-6040) | HIGH | `libreoffice-sdbc-postgresql` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8357](https://nvd.nist.gov/vuln/detail/CVE-2026-8357) | HIGH | `libreoffice-sdbc-postgresql` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4430](https://nvd.nist.gov/vuln/detail/CVE-2026-4430) | HIGH | `libreoffice-style-colibre` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6040](https://nvd.nist.gov/vuln/detail/CVE-2026-6040) | HIGH | `libreoffice-style-colibre` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8357](https://nvd.nist.gov/vuln/detail/CVE-2026-8357) | HIGH | `libreoffice-style-colibre` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4430](https://nvd.nist.gov/vuln/detail/CVE-2026-4430) | HIGH | `libreoffice-wiki-publisher` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6040](https://nvd.nist.gov/vuln/detail/CVE-2026-6040) | HIGH | `libreoffice-wiki-publisher` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8357](https://nvd.nist.gov/vuln/detail/CVE-2026-8357) | HIGH | `libreoffice-wiki-publisher` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4430](https://nvd.nist.gov/vuln/detail/CVE-2026-4430) | HIGH | `libreoffice-writer` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6040](https://nvd.nist.gov/vuln/detail/CVE-2026-6040) | HIGH | `libreoffice-writer` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8357](https://nvd.nist.gov/vuln/detail/CVE-2026-8357) | HIGH | `libreoffice-writer` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-16615](https://nvd.nist.gov/vuln/detail/CVE-2026-16615) | HIGH | `librest-0.7-0` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4430](https://nvd.nist.gov/vuln/detail/CVE-2026-4430) | HIGH | `libridl-java` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6040](https://nvd.nist.gov/vuln/detail/CVE-2026-6040) | HIGH | `libridl-java` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8357](https://nvd.nist.gov/vuln/detail/CVE-2026-8357) | HIGH | `libridl-java` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-53615](https://nvd.nist.gov/vuln/detail/CVE-2026-53615) | HIGH | `libsmartcols1` | unpatched · no fix | 25 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-58221](https://nvd.nist.gov/vuln/detail/CVE-2026-58221) | HIGH | `libsmbclient` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-58222](https://nvd.nist.gov/vuln/detail/CVE-2026-58222) | HIGH | `libsmbclient` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-6949](https://nvd.nist.gov/vuln/detail/CVE-2026-6949) | HIGH | `libsmbclient` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2023-43642](https://nvd.nist.gov/vuln/detail/CVE-2023-43642) | HIGH | `libsnappy-java` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2023-43642](https://nvd.nist.gov/vuln/detail/CVE-2023-43642) | HIGH | `libsnappy-jni` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-37555](https://nvd.nist.gov/vuln/detail/CVE-2026-37555) | HIGH | `libsndfile1` | unpatched · no fix | 20 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2025-11021](https://nvd.nist.gov/vuln/detail/CVE-2025-11021) | HIGH | `libsoup-3.0-0` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2025-14523](https://nvd.nist.gov/vuln/detail/CVE-2025-14523) | HIGH | `libsoup-3.0-0` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2025-32908](https://nvd.nist.gov/vuln/detail/CVE-2025-32908) | HIGH | `libsoup-3.0-0` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2025-32913](https://nvd.nist.gov/vuln/detail/CVE-2025-32913) | HIGH | `libsoup-3.0-0` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2025-4948](https://nvd.nist.gov/vuln/detail/CVE-2025-4948) | HIGH | `libsoup-3.0-0` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-0719](https://nvd.nist.gov/vuln/detail/CVE-2026-0719) | HIGH | `libsoup-3.0-0` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-1761](https://nvd.nist.gov/vuln/detail/CVE-2026-1761) | HIGH | `libsoup-3.0-0` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-2436](https://nvd.nist.gov/vuln/detail/CVE-2026-2436) | HIGH | `libsoup-3.0-0` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-3099](https://nvd.nist.gov/vuln/detail/CVE-2026-3099) | HIGH | `libsoup-3.0-0` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-4271](https://nvd.nist.gov/vuln/detail/CVE-2026-4271) | HIGH | `libsoup-3.0-0` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-5119](https://nvd.nist.gov/vuln/detail/CVE-2026-5119) | HIGH | `libsoup-3.0-0` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2025-11021](https://nvd.nist.gov/vuln/detail/CVE-2025-11021) | HIGH | `libsoup-3.0-common` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2025-14523](https://nvd.nist.gov/vuln/detail/CVE-2025-14523) | HIGH | `libsoup-3.0-common` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2025-32908](https://nvd.nist.gov/vuln/detail/CVE-2025-32908) | HIGH | `libsoup-3.0-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2025-32913](https://nvd.nist.gov/vuln/detail/CVE-2025-32913) | HIGH | `libsoup-3.0-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2025-4948](https://nvd.nist.gov/vuln/detail/CVE-2025-4948) | HIGH | `libsoup-3.0-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-0719](https://nvd.nist.gov/vuln/detail/CVE-2026-0719) | HIGH | `libsoup-3.0-common` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-1761](https://nvd.nist.gov/vuln/detail/CVE-2026-1761) | HIGH | `libsoup-3.0-common` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-2436](https://nvd.nist.gov/vuln/detail/CVE-2026-2436) | HIGH | `libsoup-3.0-common` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-3099](https://nvd.nist.gov/vuln/detail/CVE-2026-3099) | HIGH | `libsoup-3.0-common` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-4271](https://nvd.nist.gov/vuln/detail/CVE-2026-4271) | HIGH | `libsoup-3.0-common` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-5119](https://nvd.nist.gov/vuln/detail/CVE-2026-5119) | HIGH | `libsoup-3.0-common` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2025-14523](https://nvd.nist.gov/vuln/detail/CVE-2025-14523) | HIGH | `libsoup-gnome2.4-1` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-0719](https://nvd.nist.gov/vuln/detail/CVE-2026-0719) | HIGH | `libsoup-gnome2.4-1` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-1761](https://nvd.nist.gov/vuln/detail/CVE-2026-1761) | HIGH | `libsoup-gnome2.4-1` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-2436](https://nvd.nist.gov/vuln/detail/CVE-2026-2436) | HIGH | `libsoup-gnome2.4-1` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-3099](https://nvd.nist.gov/vuln/detail/CVE-2026-3099) | HIGH | `libsoup-gnome2.4-1` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4271](https://nvd.nist.gov/vuln/detail/CVE-2026-4271) | HIGH | `libsoup-gnome2.4-1` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-5119](https://nvd.nist.gov/vuln/detail/CVE-2026-5119) | HIGH | `libsoup-gnome2.4-1` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-14523](https://nvd.nist.gov/vuln/detail/CVE-2025-14523) | HIGH | `libsoup2.4-1` | unpatched · no fix | 4 images · v2.3, v3.8, v4.2 |
| [CVE-2025-32906](https://nvd.nist.gov/vuln/detail/CVE-2025-32906) | HIGH | `libsoup2.4-1` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2025-32911](https://nvd.nist.gov/vuln/detail/CVE-2025-32911) | HIGH | `libsoup2.4-1` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2025-32913](https://nvd.nist.gov/vuln/detail/CVE-2025-32913) | HIGH | `libsoup2.4-1` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2025-4948](https://nvd.nist.gov/vuln/detail/CVE-2025-4948) | HIGH | `libsoup2.4-1` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-0719](https://nvd.nist.gov/vuln/detail/CVE-2026-0719) | HIGH | `libsoup2.4-1` | unpatched · no fix | 4 images · v2.3, v3.8, v4.2 |
| [CVE-2026-1761](https://nvd.nist.gov/vuln/detail/CVE-2026-1761) | HIGH | `libsoup2.4-1` | unpatched · no fix | 4 images · v2.3, v3.8, v4.2 |
| [CVE-2026-2436](https://nvd.nist.gov/vuln/detail/CVE-2026-2436) | HIGH | `libsoup2.4-1` | unpatched · no fix | 4 images · v2.3, v3.8, v4.2 |
| [CVE-2026-3099](https://nvd.nist.gov/vuln/detail/CVE-2026-3099) | HIGH | `libsoup2.4-1` | unpatched · no fix | 4 images · v2.3, v3.8, v4.2 |
| [CVE-2026-4271](https://nvd.nist.gov/vuln/detail/CVE-2026-4271) | HIGH | `libsoup2.4-1` | unpatched · no fix | 4 images · v2.3, v3.8, v4.2 |
| [CVE-2026-5119](https://nvd.nist.gov/vuln/detail/CVE-2026-5119) | HIGH | `libsoup2.4-1` | unpatched · no fix | 4 images · v2.3, v3.8, v4.2 |
| [CVE-2025-14523](https://nvd.nist.gov/vuln/detail/CVE-2025-14523) | HIGH | `libsoup2.4-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2025-32906](https://nvd.nist.gov/vuln/detail/CVE-2025-32906) | HIGH | `libsoup2.4-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2025-32911](https://nvd.nist.gov/vuln/detail/CVE-2025-32911) | HIGH | `libsoup2.4-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2025-32913](https://nvd.nist.gov/vuln/detail/CVE-2025-32913) | HIGH | `libsoup2.4-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2025-4948](https://nvd.nist.gov/vuln/detail/CVE-2025-4948) | HIGH | `libsoup2.4-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-0719](https://nvd.nist.gov/vuln/detail/CVE-2026-0719) | HIGH | `libsoup2.4-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-1761](https://nvd.nist.gov/vuln/detail/CVE-2026-1761) | HIGH | `libsoup2.4-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-2436](https://nvd.nist.gov/vuln/detail/CVE-2026-2436) | HIGH | `libsoup2.4-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-3099](https://nvd.nist.gov/vuln/detail/CVE-2026-3099) | HIGH | `libsoup2.4-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-4271](https://nvd.nist.gov/vuln/detail/CVE-2026-4271) | HIGH | `libsoup2.4-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-5119](https://nvd.nist.gov/vuln/detail/CVE-2026-5119) | HIGH | `libsoup2.4-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-5674](https://nvd.nist.gov/vuln/detail/CVE-2026-5674) | HIGH | `libspa-0.2-modules` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2025-6965](https://nvd.nist.gov/vuln/detail/CVE-2025-6965) | HIGH | `libsqlite3-0` | unpatched · no fix | 5 images · v2.3 |
| [CVE-2026-58050](https://nvd.nist.gov/vuln/detail/CVE-2026-58050) | HIGH | `libssh2-1` | unpatched · no fix | 20 images · v2.3, v3.8, v4.2 |
| [CVE-2026-7598](https://nvd.nist.gov/vuln/detail/CVE-2026-7598) | HIGH | `libssh2-1` | unpatched · no fix | 20 images · v2.3, v3.8, v4.2 |
| [CVE-2026-58050](https://nvd.nist.gov/vuln/detail/CVE-2026-58050) | HIGH | `libssh2-1t64` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-58049](https://nvd.nist.gov/vuln/detail/CVE-2026-58049) | HIGH | `libswresample5` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64830](https://nvd.nist.gov/vuln/detail/CVE-2026-64830) | HIGH | `libswresample5` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64831](https://nvd.nist.gov/vuln/detail/CVE-2026-64831) | HIGH | `libswresample5` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64832](https://nvd.nist.gov/vuln/detail/CVE-2026-64832) | HIGH | `libswresample5` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64833](https://nvd.nist.gov/vuln/detail/CVE-2026-64833) | HIGH | `libswresample5` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64834](https://nvd.nist.gov/vuln/detail/CVE-2026-64834) | HIGH | `libswresample5` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64835](https://nvd.nist.gov/vuln/detail/CVE-2026-64835) | HIGH | `libswresample5` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-66036](https://nvd.nist.gov/vuln/detail/CVE-2026-66036) | HIGH | `libswresample5` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-66039](https://nvd.nist.gov/vuln/detail/CVE-2026-66039) | HIGH | `libswresample5` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-66040](https://nvd.nist.gov/vuln/detail/CVE-2026-66040) | HIGH | `libswresample5` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-66041](https://nvd.nist.gov/vuln/detail/CVE-2026-66041) | HIGH | `libswresample5` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-70628](https://nvd.nist.gov/vuln/detail/CVE-2026-70628) | HIGH | `libswresample5` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-70632](https://nvd.nist.gov/vuln/detail/CVE-2026-70632) | HIGH | `libswresample5` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-58049](https://nvd.nist.gov/vuln/detail/CVE-2026-58049) | HIGH | `libswscale8` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64830](https://nvd.nist.gov/vuln/detail/CVE-2026-64830) | HIGH | `libswscale8` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64831](https://nvd.nist.gov/vuln/detail/CVE-2026-64831) | HIGH | `libswscale8` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64832](https://nvd.nist.gov/vuln/detail/CVE-2026-64832) | HIGH | `libswscale8` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64833](https://nvd.nist.gov/vuln/detail/CVE-2026-64833) | HIGH | `libswscale8` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64834](https://nvd.nist.gov/vuln/detail/CVE-2026-64834) | HIGH | `libswscale8` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64835](https://nvd.nist.gov/vuln/detail/CVE-2026-64835) | HIGH | `libswscale8` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-66036](https://nvd.nist.gov/vuln/detail/CVE-2026-66036) | HIGH | `libswscale8` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-66039](https://nvd.nist.gov/vuln/detail/CVE-2026-66039) | HIGH | `libswscale8` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-66040](https://nvd.nist.gov/vuln/detail/CVE-2026-66040) | HIGH | `libswscale8` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-66041](https://nvd.nist.gov/vuln/detail/CVE-2026-66041) | HIGH | `libswscale8` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-70628](https://nvd.nist.gov/vuln/detail/CVE-2026-70628) | HIGH | `libswscale8` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-70632](https://nvd.nist.gov/vuln/detail/CVE-2026-70632) | HIGH | `libswscale8` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2021-36081](https://nvd.nist.gov/vuln/detail/CVE-2021-36081) | HIGH | `libtesseract4` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2023-52355](https://nvd.nist.gov/vuln/detail/CVE-2023-52355) | HIGH | `libtiff5` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2026-12912](https://nvd.nist.gov/vuln/detail/CVE-2026-12912) | HIGH | `libtiff5` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2026-36849](https://nvd.nist.gov/vuln/detail/CVE-2026-36849) | HIGH | `libtiff5` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2023-52355](https://nvd.nist.gov/vuln/detail/CVE-2023-52355) | HIGH | `libtiff6` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-12912](https://nvd.nist.gov/vuln/detail/CVE-2026-12912) | HIGH | `libtiff6` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-36849](https://nvd.nist.gov/vuln/detail/CVE-2026-36849) | HIGH | `libtiff6` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2025-69720](https://nvd.nist.gov/vuln/detail/CVE-2025-69720) | HIGH | `libtinfo6` | unpatched · no fix | 25 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-32665](https://nvd.nist.gov/vuln/detail/CVE-2026-32665) | HIGH | `libunbound8` | unpatched · no fix | 5 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-40622](https://nvd.nist.gov/vuln/detail/CVE-2026-40622) | HIGH | `libunbound8` | unpatched · no fix | 4 images · v2.3, v3.8, v4.2 |
| [CVE-2026-40691](https://nvd.nist.gov/vuln/detail/CVE-2026-40691) | HIGH | `libunbound8` | unpatched · no fix | 5 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-41292](https://nvd.nist.gov/vuln/detail/CVE-2026-41292) | HIGH | `libunbound8` | unpatched · no fix | 4 images · v2.3, v3.8, v4.2 |
| [CVE-2026-42944](https://nvd.nist.gov/vuln/detail/CVE-2026-42944) | HIGH | `libunbound8` | unpatched · no fix | 4 images · v2.3, v3.8, v4.2 |
| [CVE-2026-42959](https://nvd.nist.gov/vuln/detail/CVE-2026-42959) | HIGH | `libunbound8` | unpatched · no fix | 4 images · v2.3, v3.8, v4.2 |
| [CVE-2026-44621](https://nvd.nist.gov/vuln/detail/CVE-2026-44621) | HIGH | `libunbound8` | unpatched · no fix | 5 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-44687](https://nvd.nist.gov/vuln/detail/CVE-2026-44687) | HIGH | `libunbound8` | unpatched · no fix | 5 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-44690](https://nvd.nist.gov/vuln/detail/CVE-2026-44690) | HIGH | `libunbound8` | unpatched · no fix | 5 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-50248](https://nvd.nist.gov/vuln/detail/CVE-2026-50248) | HIGH | `libunbound8` | unpatched · no fix | 5 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-55708](https://nvd.nist.gov/vuln/detail/CVE-2026-55708) | HIGH | `libunbound8` | unpatched · no fix | 5 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-55717](https://nvd.nist.gov/vuln/detail/CVE-2026-55717) | HIGH | `libunbound8` | unpatched · no fix | 5 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-55973](https://nvd.nist.gov/vuln/detail/CVE-2026-55973) | HIGH | `libunbound8` | unpatched · no fix | 5 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-4430](https://nvd.nist.gov/vuln/detail/CVE-2026-4430) | HIGH | `libuno-cppu3` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6040](https://nvd.nist.gov/vuln/detail/CVE-2026-6040) | HIGH | `libuno-cppu3` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8357](https://nvd.nist.gov/vuln/detail/CVE-2026-8357) | HIGH | `libuno-cppu3` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4430](https://nvd.nist.gov/vuln/detail/CVE-2026-4430) | HIGH | `libuno-cppuhelpergcc3-3` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6040](https://nvd.nist.gov/vuln/detail/CVE-2026-6040) | HIGH | `libuno-cppuhelpergcc3-3` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8357](https://nvd.nist.gov/vuln/detail/CVE-2026-8357) | HIGH | `libuno-cppuhelpergcc3-3` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4430](https://nvd.nist.gov/vuln/detail/CVE-2026-4430) | HIGH | `libuno-purpenvhelpergcc3-3` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6040](https://nvd.nist.gov/vuln/detail/CVE-2026-6040) | HIGH | `libuno-purpenvhelpergcc3-3` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8357](https://nvd.nist.gov/vuln/detail/CVE-2026-8357) | HIGH | `libuno-purpenvhelpergcc3-3` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4430](https://nvd.nist.gov/vuln/detail/CVE-2026-4430) | HIGH | `libuno-sal3` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6040](https://nvd.nist.gov/vuln/detail/CVE-2026-6040) | HIGH | `libuno-sal3` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8357](https://nvd.nist.gov/vuln/detail/CVE-2026-8357) | HIGH | `libuno-sal3` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4430](https://nvd.nist.gov/vuln/detail/CVE-2026-4430) | HIGH | `libuno-salhelpergcc3-3` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6040](https://nvd.nist.gov/vuln/detail/CVE-2026-6040) | HIGH | `libuno-salhelpergcc3-3` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8357](https://nvd.nist.gov/vuln/detail/CVE-2026-8357) | HIGH | `libuno-salhelpergcc3-3` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4430](https://nvd.nist.gov/vuln/detail/CVE-2026-4430) | HIGH | `libunoil-java` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6040](https://nvd.nist.gov/vuln/detail/CVE-2026-6040) | HIGH | `libunoil-java` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8357](https://nvd.nist.gov/vuln/detail/CVE-2026-8357) | HIGH | `libunoil-java` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4430](https://nvd.nist.gov/vuln/detail/CVE-2026-4430) | HIGH | `libunoloader-java` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6040](https://nvd.nist.gov/vuln/detail/CVE-2026-6040) | HIGH | `libunoloader-java` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8357](https://nvd.nist.gov/vuln/detail/CVE-2026-8357) | HIGH | `libunoloader-java` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-53615](https://nvd.nist.gov/vuln/detail/CVE-2026-53615) | HIGH | `libuuid1` | unpatched · no fix | 25 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-58221](https://nvd.nist.gov/vuln/detail/CVE-2026-58221) | HIGH | `libwbclient0` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-58222](https://nvd.nist.gov/vuln/detail/CVE-2026-58222) | HIGH | `libwbclient0` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-6949](https://nvd.nist.gov/vuln/detail/CVE-2026-6949) | HIGH | `libwbclient0` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2022-4899](https://nvd.nist.gov/vuln/detail/CVE-2022-4899) | HIGH | `libzstd1` | unpatched · no fix | 5 images · v2.3 |
| [CVE-2026-53615](https://nvd.nist.gov/vuln/detail/CVE-2026-53615) | HIGH | `login` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2025-13699](https://nvd.nist.gov/vuln/detail/CVE-2025-13699) | HIGH | `mariadb-common` | unpatched · no fix | 2 images · v2.3 |
| [CVE-2026-44168](https://nvd.nist.gov/vuln/detail/CVE-2026-44168) | HIGH | `mariadb-common` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-44171](https://nvd.nist.gov/vuln/detail/CVE-2026-44171) | HIGH | `mariadb-common` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-48163](https://nvd.nist.gov/vuln/detail/CVE-2026-48163) | HIGH | `mariadb-common` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-48165](https://nvd.nist.gov/vuln/detail/CVE-2026-48165) | HIGH | `mariadb-common` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-53615](https://nvd.nist.gov/vuln/detail/CVE-2026-53615) | HIGH | `mount` | unpatched · no fix | 25 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2025-69720](https://nvd.nist.gov/vuln/detail/CVE-2025-69720) | HIGH | `ncurses-base` | unpatched · no fix | 25 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2025-69720](https://nvd.nist.gov/vuln/detail/CVE-2025-69720) | HIGH | `ncurses-bin` | unpatched · no fix | 25 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-59999](https://nvd.nist.gov/vuln/detail/CVE-2026-59999) | HIGH | `openssh-client` | unpatched · no fix | 20 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-60000](https://nvd.nist.gov/vuln/detail/CVE-2026-60000) | HIGH | `openssh-client` | unpatched · no fix | 20 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-42497](https://nvd.nist.gov/vuln/detail/CVE-2026-42497) | HIGH | `perl` | unpatched · no fix | 21 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-48962](https://nvd.nist.gov/vuln/detail/CVE-2026-48962) | HIGH | `perl` | unpatched · no fix | 21 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-57432](https://nvd.nist.gov/vuln/detail/CVE-2026-57432) | HIGH | `perl` | unpatched · no fix | 21 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-9538](https://nvd.nist.gov/vuln/detail/CVE-2026-9538) | HIGH | `perl` | unpatched · no fix | 21 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-42497](https://nvd.nist.gov/vuln/detail/CVE-2026-42497) | HIGH | `perl-base` | unpatched · no fix | 25 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-48962](https://nvd.nist.gov/vuln/detail/CVE-2026-48962) | HIGH | `perl-base` | unpatched · no fix | 25 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-57432](https://nvd.nist.gov/vuln/detail/CVE-2026-57432) | HIGH | `perl-base` | unpatched · no fix | 25 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-9538](https://nvd.nist.gov/vuln/detail/CVE-2026-9538) | HIGH | `perl-base` | unpatched · no fix | 25 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-42497](https://nvd.nist.gov/vuln/detail/CVE-2026-42497) | HIGH | `perl-modules-5.32` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2026-48962](https://nvd.nist.gov/vuln/detail/CVE-2026-48962) | HIGH | `perl-modules-5.32` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2026-57432](https://nvd.nist.gov/vuln/detail/CVE-2026-57432) | HIGH | `perl-modules-5.32` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2026-9538](https://nvd.nist.gov/vuln/detail/CVE-2026-9538) | HIGH | `perl-modules-5.32` | unpatched · no fix | 4 images · v2.3 |
| [CVE-2026-42497](https://nvd.nist.gov/vuln/detail/CVE-2026-42497) | HIGH | `perl-modules-5.36` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-48962](https://nvd.nist.gov/vuln/detail/CVE-2026-48962) | HIGH | `perl-modules-5.36` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-57432](https://nvd.nist.gov/vuln/detail/CVE-2026-57432) | HIGH | `perl-modules-5.36` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-9538](https://nvd.nist.gov/vuln/detail/CVE-2026-9538) | HIGH | `perl-modules-5.36` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-42497](https://nvd.nist.gov/vuln/detail/CVE-2026-42497) | HIGH | `perl-modules-5.40` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-48962](https://nvd.nist.gov/vuln/detail/CVE-2026-48962) | HIGH | `perl-modules-5.40` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-57432](https://nvd.nist.gov/vuln/detail/CVE-2026-57432) | HIGH | `perl-modules-5.40` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-9538](https://nvd.nist.gov/vuln/detail/CVE-2026-9538) | HIGH | `perl-modules-5.40` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-23949](https://nvd.nist.gov/vuln/detail/CVE-2026-23949) | HIGH | `python3-pkg-resources` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-4430](https://nvd.nist.gov/vuln/detail/CVE-2026-4430) | HIGH | `python3-uno` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6040](https://nvd.nist.gov/vuln/detail/CVE-2026-6040) | HIGH | `python3-uno` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8357](https://nvd.nist.gov/vuln/detail/CVE-2026-8357) | HIGH | `python3-uno` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2025-69534](https://nvd.nist.gov/vuln/detail/CVE-2025-69534) | HIGH | `python3.11` | unpatched · no fix | 6 images · v3.8, v4.2 |
| [CVE-2026-11940](https://nvd.nist.gov/vuln/detail/CVE-2026-11940) | HIGH | `python3.11` | unpatched · no fix | 6 images · v3.8, v4.2 |
| [CVE-2026-15308](https://nvd.nist.gov/vuln/detail/CVE-2026-15308) | HIGH | `python3.11` | unpatched · no fix | 6 images · v3.8, v4.2 |
| [CVE-2026-3644](https://nvd.nist.gov/vuln/detail/CVE-2026-3644) | HIGH | `python3.11` | unpatched · no fix | 6 images · v3.8, v4.2 |
| [CVE-2026-7210](https://nvd.nist.gov/vuln/detail/CVE-2026-7210) | HIGH | `python3.11` | unpatched · no fix | 6 images · v3.8, v4.2 |
| [CVE-2025-69534](https://nvd.nist.gov/vuln/detail/CVE-2025-69534) | HIGH | `python3.11-minimal` | unpatched · no fix | 6 images · v3.8, v4.2 |
| [CVE-2026-11940](https://nvd.nist.gov/vuln/detail/CVE-2026-11940) | HIGH | `python3.11-minimal` | unpatched · no fix | 6 images · v3.8, v4.2 |
| [CVE-2026-15308](https://nvd.nist.gov/vuln/detail/CVE-2026-15308) | HIGH | `python3.11-minimal` | unpatched · no fix | 6 images · v3.8, v4.2 |
| [CVE-2026-3644](https://nvd.nist.gov/vuln/detail/CVE-2026-3644) | HIGH | `python3.11-minimal` | unpatched · no fix | 6 images · v3.8, v4.2 |
| [CVE-2026-7210](https://nvd.nist.gov/vuln/detail/CVE-2026-7210) | HIGH | `python3.11-minimal` | unpatched · no fix | 6 images · v3.8, v4.2 |
| [CVE-2026-11940](https://nvd.nist.gov/vuln/detail/CVE-2026-11940) | HIGH | `python3.13` | unpatched · no fix | 2 images · v5.2 |
| [CVE-2026-15308](https://nvd.nist.gov/vuln/detail/CVE-2026-15308) | HIGH | `python3.13` | unpatched · no fix | 2 images · v5.2 |
| [CVE-2026-7210](https://nvd.nist.gov/vuln/detail/CVE-2026-7210) | HIGH | `python3.13` | unpatched · no fix | 2 images · v5.2 |
| [CVE-2026-11940](https://nvd.nist.gov/vuln/detail/CVE-2026-11940) | HIGH | `python3.13-minimal` | unpatched · no fix | 2 images · v5.2 |
| [CVE-2026-15308](https://nvd.nist.gov/vuln/detail/CVE-2026-15308) | HIGH | `python3.13-minimal` | unpatched · no fix | 2 images · v5.2 |
| [CVE-2026-7210](https://nvd.nist.gov/vuln/detail/CVE-2026-7210) | HIGH | `python3.13-minimal` | unpatched · no fix | 2 images · v5.2 |
| [CVE-2025-69534](https://nvd.nist.gov/vuln/detail/CVE-2025-69534) | HIGH | `python3.9` | unpatched · no fix | 2 images · v2.3 |
| [CVE-2026-11940](https://nvd.nist.gov/vuln/detail/CVE-2026-11940) | HIGH | `python3.9` | unpatched · no fix | 2 images · v2.3 |
| [CVE-2026-15308](https://nvd.nist.gov/vuln/detail/CVE-2026-15308) | HIGH | `python3.9` | unpatched · no fix | 2 images · v2.3 |
| [CVE-2026-7210](https://nvd.nist.gov/vuln/detail/CVE-2026-7210) | HIGH | `python3.9` | unpatched · no fix | 2 images · v2.3 |
| [CVE-2025-69534](https://nvd.nist.gov/vuln/detail/CVE-2025-69534) | HIGH | `python3.9-minimal` | unpatched · no fix | 2 images · v2.3 |
| [CVE-2026-11940](https://nvd.nist.gov/vuln/detail/CVE-2026-11940) | HIGH | `python3.9-minimal` | unpatched · no fix | 2 images · v2.3 |
| [CVE-2026-15308](https://nvd.nist.gov/vuln/detail/CVE-2026-15308) | HIGH | `python3.9-minimal` | unpatched · no fix | 2 images · v2.3 |
| [CVE-2026-7210](https://nvd.nist.gov/vuln/detail/CVE-2026-7210) | HIGH | `python3.9-minimal` | unpatched · no fix | 2 images · v2.3 |
| [CVE-2026-58221](https://nvd.nist.gov/vuln/detail/CVE-2026-58221) | HIGH | `samba-libs` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-58222](https://nvd.nist.gov/vuln/detail/CVE-2026-58222) | HIGH | `samba-libs` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-6949](https://nvd.nist.gov/vuln/detail/CVE-2026-6949) | HIGH | `samba-libs` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-4430](https://nvd.nist.gov/vuln/detail/CVE-2026-4430) | HIGH | `uno-libs-private` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6040](https://nvd.nist.gov/vuln/detail/CVE-2026-6040) | HIGH | `uno-libs-private` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8357](https://nvd.nist.gov/vuln/detail/CVE-2026-8357) | HIGH | `uno-libs-private` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-4430](https://nvd.nist.gov/vuln/detail/CVE-2026-4430) | HIGH | `ure` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-6040](https://nvd.nist.gov/vuln/detail/CVE-2026-6040) | HIGH | `ure` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-8357](https://nvd.nist.gov/vuln/detail/CVE-2026-8357) | HIGH | `ure` | unpatched · no fix | 1 image · v2.3 |
| [CVE-2026-53615](https://nvd.nist.gov/vuln/detail/CVE-2026-53615) | HIGH | `util-linux` | unpatched · no fix | 25 images · v2.3, v3.8, v4.2, v5.2 |
| [CVE-2026-53615](https://nvd.nist.gov/vuln/detail/CVE-2026-53615) | HIGH | `util-linux-extra` | unpatched · no fix | 15 images · v3.8, v4.2 |
| [CVE-2022-4055](https://nvd.nist.gov/vuln/detail/CVE-2022-4055) | HIGH | `xdg-utils` | unpatched · no fix | 5 images · v2.3, v3.8, v4.2, v5.2 |


Full detail for the remaining severities: [MEDIUM](known-cves-medium.md) · [LOW and UNKNOWN](known-cves-low.md).
