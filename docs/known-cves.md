# Known CVEs & hardening report

_Generated 2026-11-11 02:47 UTC._

Per published **stable release image**: known CVEs from a full Trivy scan (all
severities, OS + library packages, unfixable CVEs included). **Development / rolling
tags (`*-dev`) are not covered** -- they are plain-only and never Copa-patched.

## Hardening outcome

**No fixable CVE was available upstream for any image in this run.** Debian ships no fix for any of the 1435 distinct CVEs found, so Copa had nothing to patch.
 Some images have no `-hardened` tag this run (the severity gate failed or hardening was disabled); their rows are marked `unpatched`.

**Status legend:** `fixed` = Copa patched it (old → new version) · `residual` = still
present in the hardened image · `unpatched` = no hardened image was produced.

## Severity totals

| Severity | Distinct CVEs | Tabulated rows |
|----------|---------------|----------------|
| CRITICAL | 29 | 52 |
| HIGH | 345 | 974 |
| MEDIUM | 504 | 2005 |
| LOW | 458 | 1796 |
| UNKNOWN | 100 | 263 |

## Not tabulated

**2057 `linux-libc-dev` rows (2057 distinct CVEs) are excluded from the tables.** These are Linux kernel *header* CVEs. A container runs on the host kernel, so they are not reachable inside these images. They remain in `cve-data.json`, uploaded as the `cve-report-json` artifact on the release run.

## CVEs by variant

Variants differ enormously. This table is the fastest way to see which image flavour
carries the CVE surface, and therefore which one to pick if you do not need its extras.

| Variant | Distinct CVEs | Image builds |
|---------|---------------|--------------|
| `max` | 1379 | 7 |
| `supervisord` | 929 | 7 |
| `debug` | 847 | 7 |
| `default` | 847 | 7 |
| `min` | 324 | 7 |

## Most-affected packages

| Package | Distinct CVEs | Image builds affected |
|---------|---------------|-----------------------|
| `chromium-sandbox` | 222 | 7 |
| `binutils` | 69 | 10 |
| `binutils-aarch64-linux-gnu` | 69 | 5 |
| `binutils-common` | 69 | 10 |
| `binutils-x86-64-linux-gnu` | 69 | 5 |
| `libbinutils` | 69 | 10 |
| `libctf-nobfd0` | 69 | 10 |
| `libctf0` | 69 | 10 |
| `libgprofng0` | 69 | 10 |
| `libheif1` | 69 | 28 |

_"Image builds" counts each architecture separately (amd64 and arm64 of one tag are
two builds), so these figures are larger than the arch-collapsed `Affects` column in
the detail tables. Both describe the same rows._

## Images

| Image | Arch | CRIT | HIGH | MED | LOW | UNK | Fixable | Hardening | Plain digest |
|-------|------|------|------|-----|-----|-----|---------|-----------|--------------|
| `php8.2-debug-v3.8` | amd64 | 17 | 427 | 1930 | 861 | 87 | 0 | not-produced | `c6fff9dc9f43` |
| `php8.2-debug-v3.8` | arm64 | 17 | 427 | 1930 | 861 | 87 | 0 | not-produced | `c3e42681346c` |
| `php8.2-max-v3.8` | amd64 | 41 | 874 | 2863 | 1179 | 142 | 0 | not-produced | `3fe81a1f9905` |
| `php8.2-max-v3.8` | arm64 | 41 | 873 | 2857 | 1174 | 138 | 0 | not-produced | `f158392e9216` |
| `php8.2-min-v3.8` | amd64 | 5 | 302 | 1632 | 544 | 15 | 0 | not-produced | `d176f467d8a6` |
| `php8.2-min-v3.8` | arm64 | 5 | 302 | 1632 | 544 | 15 | 0 | not-produced | `c9fa3c5f8dcb` |
| `php8.2-supervisord-v3.8` | amd64 | 22 | 456 | 1993 | 895 | 91 | 0 | not-produced | `8f11d59c417f` |
| `php8.2-supervisord-v3.8` | arm64 | 22 | 456 | 1993 | 895 | 91 | 0 | not-produced | `7554e5a8c3e2` |
| `php8.2-v3.8` | amd64 | 17 | 427 | 1930 | 861 | 87 | 0 | not-produced | `d3eda99df6e3` |
| `php8.2-v3.8` | arm64 | 17 | 427 | 1930 | 861 | 87 | 0 | not-produced | `86519dcf3188` |
| `php8.3-debug-v3.8` | amd64 | 17 | 427 | 1930 | 861 | 87 | 0 | not-produced | `bf84418341e7` |
| `php8.3-debug-v3.8` | arm64 | 17 | 427 | 1930 | 861 | 87 | 0 | not-produced | `c57be8a4dd65` |
| `php8.3-max-v3.8` | amd64 | 41 | 874 | 2863 | 1179 | 142 | 0 | not-produced | `b8b2143bc3f7` |
| `php8.3-max-v3.8` | arm64 | 41 | 873 | 2857 | 1174 | 138 | 0 | not-produced | `6f05a108f7ec` |
| `php8.3-min-v3.8` | amd64 | 5 | 302 | 1632 | 544 | 15 | 0 | not-produced | `4181f98e3b1f` |
| `php8.3-min-v3.8` | arm64 | 5 | 302 | 1632 | 544 | 15 | 0 | not-produced | `52aa667276d6` |
| `php8.3-supervisord-v3.8` | amd64 | 22 | 456 | 1993 | 895 | 91 | 0 | not-produced | `078f7cecea83` |
| `php8.3-supervisord-v3.8` | arm64 | 22 | 456 | 1993 | 895 | 91 | 0 | not-produced | `feb3b7b55d15` |
| `php8.3-v3.8` | amd64 | 17 | 427 | 1930 | 861 | 87 | 0 | not-produced | `c2e40c448292` |
| `php8.3-v3.8` | arm64 | 17 | 427 | 1930 | 861 | 87 | 0 | not-produced | `0cde123f8f51` |
| `php8.4-debug-v4.2` | arm64 | 17 | 433 | 1936 | 925 | 87 | 0 | not-produced | `738a7d37411e` |
| `php8.4-max-v4.2` | arm64 | 41 | 875 | 2859 | 1194 | 138 | 0 | not-produced | `0e615c9fd33f` |
| `php8.4-min-v4.2` | arm64 | 5 | 302 | 1632 | 544 | 15 | 0 | not-produced | `8e0a4306f7bd` |
| `php8.4-supervisord-v4.2` | arm64 | 22 | 462 | 1999 | 959 | 91 | 0 | not-produced | `cc9e3e2a57e7` |
| `php8.4-v4.2` | arm64 | 17 | 433 | 1936 | 925 | 87 | 0 | not-produced | `d87d15fd0061` |
| `php8.5-debug-v5.2` | amd64 | 4 | 364 | 895 | 1242 | 126 | 0 | not-produced | `4b16b6f28211` |
| `php8.5-debug-v5.2` | arm64 | 4 | 364 | 890 | 1241 | 126 | 0 | not-produced | `5348919e975a` |
| `php8.5-max-v5.2` | amd64 | 27 | 672 | 1267 | 1452 | 176 | 0 | not-produced | `bc6b17a1e0c0` |
| `php8.5-max-v5.2` | arm64 | 27 | 672 | 1262 | 1451 | 176 | 0 | not-produced | `e92a3c3edf1c` |
| `php8.5-min-v5.2` | amd64 | 1 | 139 | 465 | 857 | 15 | 0 | not-produced | `aff602eef4ec` |
| `php8.5-min-v5.2` | arm64 | 1 | 139 | 460 | 856 | 15 | 0 | not-produced | `96bcebf8ef1b` |
| `php8.5-supervisord-v5.2` | amd64 | 4 | 385 | 939 | 1265 | 130 | 0 | not-produced | `0fe4afe167bf` |
| `php8.5-supervisord-v5.2` | arm64 | 4 | 385 | 934 | 1264 | 130 | 0 | not-produced | `c74a5abf682d` |
| `php8.5-v5.2` | amd64 | 4 | 364 | 895 | 1242 | 126 | 0 | not-produced | `645ae5c77d39` |
| `php8.5-v5.2` | arm64 | 4 | 364 | 890 | 1241 | 126 | 0 | not-produced | `41e1f7a673b9` |

_`CRIT`-`UNK` and `Fixable` above are **raw Trivy totals for the image as published**: unlike the tabulated counts earlier in this report they still include the 2057 un-tabulated `linux-libc-dev` rows, so they intentionally exceed every tabulated count above. A `CRIT`/`HIGH` here with no matching row in any detail table is a kernel-header CVE -- see **Not tabulated** above. `Fixable` is also measured across both OS and library packages, wider than the OS-packages-only scope of the scan that feeds Copa -- severity plays no part in that difference._

## Critical & high severity

| CVE | Severity | Package | Status | Affects |
|-----|----------|---------|--------|---------|
| [CVE-2026-58062](https://nvd.nist.gov/vuln/detail/CVE-2026-58062) | CRITICAL | `libbcmail-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59650](https://nvd.nist.gov/vuln/detail/CVE-2026-59650) | CRITICAL | `libbcmail-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-8763](https://nvd.nist.gov/vuln/detail/CVE-2026-8763) | CRITICAL | `libbcmail-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-58062](https://nvd.nist.gov/vuln/detail/CVE-2026-58062) | CRITICAL | `libbcpkix-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59650](https://nvd.nist.gov/vuln/detail/CVE-2026-59650) | CRITICAL | `libbcpkix-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-8763](https://nvd.nist.gov/vuln/detail/CVE-2026-8763) | CRITICAL | `libbcpkix-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-58062](https://nvd.nist.gov/vuln/detail/CVE-2026-58062) | CRITICAL | `libbcprov-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59650](https://nvd.nist.gov/vuln/detail/CVE-2026-59650) | CRITICAL | `libbcprov-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-8763](https://nvd.nist.gov/vuln/detail/CVE-2026-8763) | CRITICAL | `libbcprov-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-58062](https://nvd.nist.gov/vuln/detail/CVE-2026-58062) | CRITICAL | `libbcutil-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59650](https://nvd.nist.gov/vuln/detail/CVE-2026-59650) | CRITICAL | `libbcutil-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-8763](https://nvd.nist.gov/vuln/detail/CVE-2026-8763) | CRITICAL | `libbcutil-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-58016](https://nvd.nist.gov/vuln/detail/CVE-2026-58016) | CRITICAL | `libglib2.0-0` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-58016](https://nvd.nist.gov/vuln/detail/CVE-2026-58016) | CRITICAL | `libglib2.0-data` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2019-16224](https://nvd.nist.gov/vuln/detail/CVE-2019-16224) | CRITICAL | `liblmdb0` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2019-16225](https://nvd.nist.gov/vuln/detail/CVE-2019-16225) | CRITICAL | `liblmdb0` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2019-16227](https://nvd.nist.gov/vuln/detail/CVE-2019-16227) | CRITICAL | `liblmdb0` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-44172](https://nvd.nist.gov/vuln/detail/CVE-2026-44172) | CRITICAL | `libmariadb3` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-49261](https://nvd.nist.gov/vuln/detail/CVE-2026-49261) | CRITICAL | `libmariadb3` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2025-47917](https://nvd.nist.gov/vuln/detail/CVE-2025-47917) | CRITICAL | `libmbedcrypto7` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-34873](https://nvd.nist.gov/vuln/detail/CVE-2026-34873) | CRITICAL | `libmbedcrypto7` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-34875](https://nvd.nist.gov/vuln/detail/CVE-2026-34875) | CRITICAL | `libmbedcrypto7` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-28500](https://nvd.nist.gov/vuln/detail/CVE-2026-28500) | CRITICAL | `libonnx1t64` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2023-5841](https://nvd.nist.gov/vuln/detail/CVE-2023-5841) | CRITICAL | `libopenexr-3-1-30` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-42216](https://nvd.nist.gov/vuln/detail/CVE-2026-42216) | CRITICAL | `libopenexr-3-1-30` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-42217](https://nvd.nist.gov/vuln/detail/CVE-2026-42217) | CRITICAL | `libopenexr-3-1-30` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-102560](https://nvd.nist.gov/vuln/detail/CVE-2026-102560) | CRITICAL | `libsoup-3.0-0` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-2369](https://nvd.nist.gov/vuln/detail/CVE-2026-2369) | CRITICAL | `libsoup-3.0-0` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-102560](https://nvd.nist.gov/vuln/detail/CVE-2026-102560) | CRITICAL | `libsoup-3.0-common` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-2369](https://nvd.nist.gov/vuln/detail/CVE-2026-2369) | CRITICAL | `libsoup-3.0-common` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-102560](https://nvd.nist.gov/vuln/detail/CVE-2026-102560) | CRITICAL | `libsoup2.4-1` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-2369](https://nvd.nist.gov/vuln/detail/CVE-2026-2369) | CRITICAL | `libsoup2.4-1` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-102560](https://nvd.nist.gov/vuln/detail/CVE-2026-102560) | CRITICAL | `libsoup2.4-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-2369](https://nvd.nist.gov/vuln/detail/CVE-2026-2369) | CRITICAL | `libsoup2.4-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2025-7458](https://nvd.nist.gov/vuln/detail/CVE-2025-7458) | CRITICAL | `libsqlite3-0` | unpatched · no fix | 15 images · v3.8, v4.2 |
| [CVE-2026-33278](https://nvd.nist.gov/vuln/detail/CVE-2026-33278) | CRITICAL | `libunbound8` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-42960](https://nvd.nist.gov/vuln/detail/CVE-2026-42960) | CRITICAL | `libunbound8` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-50252](https://nvd.nist.gov/vuln/detail/CVE-2026-50252) | CRITICAL | `libunbound8` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-81642](https://nvd.nist.gov/vuln/detail/CVE-2026-81642) | CRITICAL | `libunbound8` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-82717](https://nvd.nist.gov/vuln/detail/CVE-2026-82717) | CRITICAL | `libunbound8` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-6653](https://nvd.nist.gov/vuln/detail/CVE-2026-6653) | CRITICAL | `libxml2` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-44172](https://nvd.nist.gov/vuln/detail/CVE-2026-44172) | CRITICAL | `mariadb-common` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-49261](https://nvd.nist.gov/vuln/detail/CVE-2026-49261) | CRITICAL | `mariadb-common` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-114820](https://nvd.nist.gov/vuln/detail/CVE-2026-114820) | CRITICAL | `openjdk-17-jre` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-91403](https://nvd.nist.gov/vuln/detail/CVE-2026-91403) | CRITICAL | `openjdk-17-jre` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-114820](https://nvd.nist.gov/vuln/detail/CVE-2026-114820) | CRITICAL | `openjdk-17-jre-headless` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-91403](https://nvd.nist.gov/vuln/detail/CVE-2026-91403) | CRITICAL | `openjdk-17-jre-headless` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-114820](https://nvd.nist.gov/vuln/detail/CVE-2026-114820) | CRITICAL | `openjdk-21-jre` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-114820](https://nvd.nist.gov/vuln/detail/CVE-2026-114820) | CRITICAL | `openjdk-21-jre-headless` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-60002](https://nvd.nist.gov/vuln/detail/CVE-2026-60002) | CRITICAL | `openssh-client` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2023-45853](https://nvd.nist.gov/vuln/detail/CVE-2023-45853) | CRITICAL | `zlib1g` | unpatched · no fix | 15 images · v3.8, v4.2 |
| [CVE-2023-45853](https://nvd.nist.gov/vuln/detail/CVE-2023-45853) | CRITICAL | `zlib1g-dev` | unpatched · no fix | 15 images · v3.8, v4.2 |
| [CVE-2026-53613](https://nvd.nist.gov/vuln/detail/CVE-2026-53613) | HIGH | `bsdutils` | unpatched · no fix | 15 images · v3.8, v4.2 |
| [CVE-2026-53615](https://nvd.nist.gov/vuln/detail/CVE-2026-53615) | HIGH | `bsdutils` | unpatched · no fix | 15 images · v3.8, v4.2 |
| [CVE-2026-76642](https://nvd.nist.gov/vuln/detail/CVE-2026-76642) | HIGH | `bsdutils` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-78408](https://nvd.nist.gov/vuln/detail/CVE-2026-78408) | HIGH | `bsdutils` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-78409](https://nvd.nist.gov/vuln/detail/CVE-2026-78409) | HIGH | `bsdutils` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-78410](https://nvd.nist.gov/vuln/detail/CVE-2026-78410) | HIGH | `bsdutils` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121032](https://nvd.nist.gov/vuln/detail/CVE-2026-121032) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121034](https://nvd.nist.gov/vuln/detail/CVE-2026-121034) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121035](https://nvd.nist.gov/vuln/detail/CVE-2026-121035) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121036](https://nvd.nist.gov/vuln/detail/CVE-2026-121036) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121037](https://nvd.nist.gov/vuln/detail/CVE-2026-121037) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121038](https://nvd.nist.gov/vuln/detail/CVE-2026-121038) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121044](https://nvd.nist.gov/vuln/detail/CVE-2026-121044) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121047](https://nvd.nist.gov/vuln/detail/CVE-2026-121047) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121051](https://nvd.nist.gov/vuln/detail/CVE-2026-121051) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121052](https://nvd.nist.gov/vuln/detail/CVE-2026-121052) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121057](https://nvd.nist.gov/vuln/detail/CVE-2026-121057) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121060](https://nvd.nist.gov/vuln/detail/CVE-2026-121060) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121061](https://nvd.nist.gov/vuln/detail/CVE-2026-121061) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121068](https://nvd.nist.gov/vuln/detail/CVE-2026-121068) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121071](https://nvd.nist.gov/vuln/detail/CVE-2026-121071) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121074](https://nvd.nist.gov/vuln/detail/CVE-2026-121074) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121076](https://nvd.nist.gov/vuln/detail/CVE-2026-121076) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121078](https://nvd.nist.gov/vuln/detail/CVE-2026-121078) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121079](https://nvd.nist.gov/vuln/detail/CVE-2026-121079) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121080](https://nvd.nist.gov/vuln/detail/CVE-2026-121080) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121082](https://nvd.nist.gov/vuln/detail/CVE-2026-121082) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121083](https://nvd.nist.gov/vuln/detail/CVE-2026-121083) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121084](https://nvd.nist.gov/vuln/detail/CVE-2026-121084) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121086](https://nvd.nist.gov/vuln/detail/CVE-2026-121086) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121087](https://nvd.nist.gov/vuln/detail/CVE-2026-121087) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121089](https://nvd.nist.gov/vuln/detail/CVE-2026-121089) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121090](https://nvd.nist.gov/vuln/detail/CVE-2026-121090) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121094](https://nvd.nist.gov/vuln/detail/CVE-2026-121094) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121095](https://nvd.nist.gov/vuln/detail/CVE-2026-121095) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121097](https://nvd.nist.gov/vuln/detail/CVE-2026-121097) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121098](https://nvd.nist.gov/vuln/detail/CVE-2026-121098) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121100](https://nvd.nist.gov/vuln/detail/CVE-2026-121100) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121104](https://nvd.nist.gov/vuln/detail/CVE-2026-121104) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121107](https://nvd.nist.gov/vuln/detail/CVE-2026-121107) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121112](https://nvd.nist.gov/vuln/detail/CVE-2026-121112) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121113](https://nvd.nist.gov/vuln/detail/CVE-2026-121113) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121114](https://nvd.nist.gov/vuln/detail/CVE-2026-121114) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121117](https://nvd.nist.gov/vuln/detail/CVE-2026-121117) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121118](https://nvd.nist.gov/vuln/detail/CVE-2026-121118) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121119](https://nvd.nist.gov/vuln/detail/CVE-2026-121119) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121123](https://nvd.nist.gov/vuln/detail/CVE-2026-121123) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121124](https://nvd.nist.gov/vuln/detail/CVE-2026-121124) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121126](https://nvd.nist.gov/vuln/detail/CVE-2026-121126) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121127](https://nvd.nist.gov/vuln/detail/CVE-2026-121127) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121129](https://nvd.nist.gov/vuln/detail/CVE-2026-121129) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121131](https://nvd.nist.gov/vuln/detail/CVE-2026-121131) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121133](https://nvd.nist.gov/vuln/detail/CVE-2026-121133) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121137](https://nvd.nist.gov/vuln/detail/CVE-2026-121137) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121140](https://nvd.nist.gov/vuln/detail/CVE-2026-121140) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121143](https://nvd.nist.gov/vuln/detail/CVE-2026-121143) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121148](https://nvd.nist.gov/vuln/detail/CVE-2026-121148) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121156](https://nvd.nist.gov/vuln/detail/CVE-2026-121156) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121160](https://nvd.nist.gov/vuln/detail/CVE-2026-121160) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121166](https://nvd.nist.gov/vuln/detail/CVE-2026-121166) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121173](https://nvd.nist.gov/vuln/detail/CVE-2026-121173) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121174](https://nvd.nist.gov/vuln/detail/CVE-2026-121174) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121178](https://nvd.nist.gov/vuln/detail/CVE-2026-121178) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121179](https://nvd.nist.gov/vuln/detail/CVE-2026-121179) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121180](https://nvd.nist.gov/vuln/detail/CVE-2026-121180) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121181](https://nvd.nist.gov/vuln/detail/CVE-2026-121181) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121182](https://nvd.nist.gov/vuln/detail/CVE-2026-121182) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121185](https://nvd.nist.gov/vuln/detail/CVE-2026-121185) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121188](https://nvd.nist.gov/vuln/detail/CVE-2026-121188) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121197](https://nvd.nist.gov/vuln/detail/CVE-2026-121197) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121201](https://nvd.nist.gov/vuln/detail/CVE-2026-121201) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121203](https://nvd.nist.gov/vuln/detail/CVE-2026-121203) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121207](https://nvd.nist.gov/vuln/detail/CVE-2026-121207) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121208](https://nvd.nist.gov/vuln/detail/CVE-2026-121208) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121210](https://nvd.nist.gov/vuln/detail/CVE-2026-121210) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121211](https://nvd.nist.gov/vuln/detail/CVE-2026-121211) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121213](https://nvd.nist.gov/vuln/detail/CVE-2026-121213) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121214](https://nvd.nist.gov/vuln/detail/CVE-2026-121214) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121221](https://nvd.nist.gov/vuln/detail/CVE-2026-121221) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121224](https://nvd.nist.gov/vuln/detail/CVE-2026-121224) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121226](https://nvd.nist.gov/vuln/detail/CVE-2026-121226) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121227](https://nvd.nist.gov/vuln/detail/CVE-2026-121227) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121228](https://nvd.nist.gov/vuln/detail/CVE-2026-121228) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121229](https://nvd.nist.gov/vuln/detail/CVE-2026-121229) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121233](https://nvd.nist.gov/vuln/detail/CVE-2026-121233) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121241](https://nvd.nist.gov/vuln/detail/CVE-2026-121241) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121246](https://nvd.nist.gov/vuln/detail/CVE-2026-121246) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121247](https://nvd.nist.gov/vuln/detail/CVE-2026-121247) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121249](https://nvd.nist.gov/vuln/detail/CVE-2026-121249) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-121250](https://nvd.nist.gov/vuln/detail/CVE-2026-121250) | HIGH | `chromium-sandbox` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-12064](https://nvd.nist.gov/vuln/detail/CVE-2026-12064) | HIGH | `curl` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-6276](https://nvd.nist.gov/vuln/detail/CVE-2026-6276) | HIGH | `curl` | unpatched · no fix | 15 images · v3.8, v4.2 |
| [CVE-2026-8286](https://nvd.nist.gov/vuln/detail/CVE-2026-8286) | HIGH | `curl` | unpatched · no fix | 15 images · v3.8, v4.2 |
| [CVE-2026-8458](https://nvd.nist.gov/vuln/detail/CVE-2026-8458) | HIGH | `curl` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-8927](https://nvd.nist.gov/vuln/detail/CVE-2026-8927) | HIGH | `curl` | unpatched · no fix | 15 images · v3.8, v4.2 |
| [CVE-2026-24882](https://nvd.nist.gov/vuln/detail/CVE-2026-24882) | HIGH | `dirmngr` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-66140](https://nvd.nist.gov/vuln/detail/CVE-2026-66140) | HIGH | `exim4-base` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-66141](https://nvd.nist.gov/vuln/detail/CVE-2026-66141) | HIGH | `exim4-base` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-94056](https://nvd.nist.gov/vuln/detail/CVE-2026-94056) | HIGH | `exim4-base` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-66140](https://nvd.nist.gov/vuln/detail/CVE-2026-66140) | HIGH | `exim4-config` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-66141](https://nvd.nist.gov/vuln/detail/CVE-2026-66141) | HIGH | `exim4-config` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-94056](https://nvd.nist.gov/vuln/detail/CVE-2026-94056) | HIGH | `exim4-config` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-66140](https://nvd.nist.gov/vuln/detail/CVE-2026-66140) | HIGH | `exim4-daemon-light` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-66141](https://nvd.nist.gov/vuln/detail/CVE-2026-66141) | HIGH | `exim4-daemon-light` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-94056](https://nvd.nist.gov/vuln/detail/CVE-2026-94056) | HIGH | `exim4-daemon-light` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-58049](https://nvd.nist.gov/vuln/detail/CVE-2026-58049) | HIGH | `ffmpeg` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64830](https://nvd.nist.gov/vuln/detail/CVE-2026-64830) | HIGH | `ffmpeg` | unpatched · no fix | 4 images · v5.2 |
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
| [CVE-2026-75141](https://nvd.nist.gov/vuln/detail/CVE-2026-75141) | HIGH | `ffmpeg` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-75142](https://nvd.nist.gov/vuln/detail/CVE-2026-75142) | HIGH | `ffmpeg` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-75143](https://nvd.nist.gov/vuln/detail/CVE-2026-75143) | HIGH | `ffmpeg` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-75144](https://nvd.nist.gov/vuln/detail/CVE-2026-75144) | HIGH | `ffmpeg` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-75146](https://nvd.nist.gov/vuln/detail/CVE-2026-75146) | HIGH | `ffmpeg` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2025-65104](https://nvd.nist.gov/vuln/detail/CVE-2025-65104) | HIGH | `firebird3.0-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2025-65104](https://nvd.nist.gov/vuln/detail/CVE-2025-65104) | HIGH | `firebird3.0-common-doc` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2025-65104](https://nvd.nist.gov/vuln/detail/CVE-2025-65104) | HIGH | `firebird3.0-server-core` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2025-65104](https://nvd.nist.gov/vuln/detail/CVE-2025-65104) | HIGH | `firebird3.0-utils` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-63277](https://nvd.nist.gov/vuln/detail/CVE-2026-63277) | HIGH | `fonts-opensymbol` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-101258](https://nvd.nist.gov/vuln/detail/CVE-2026-101258) | HIGH | `ghostscript` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-103226](https://nvd.nist.gov/vuln/detail/CVE-2026-103226) | HIGH | `ghostscript` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-24882](https://nvd.nist.gov/vuln/detail/CVE-2026-24882) | HIGH | `gnupg` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-24882](https://nvd.nist.gov/vuln/detail/CVE-2026-24882) | HIGH | `gnupg-l10n` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-24882](https://nvd.nist.gov/vuln/detail/CVE-2026-24882) | HIGH | `gnupg-utils` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-24882](https://nvd.nist.gov/vuln/detail/CVE-2026-24882) | HIGH | `gpg` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-24882](https://nvd.nist.gov/vuln/detail/CVE-2026-24882) | HIGH | `gpg-agent` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-24882](https://nvd.nist.gov/vuln/detail/CVE-2026-24882) | HIGH | `gpg-wks-client` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-24882](https://nvd.nist.gov/vuln/detail/CVE-2026-24882) | HIGH | `gpgconf` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-24882](https://nvd.nist.gov/vuln/detail/CVE-2026-24882) | HIGH | `gpgsm` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-24882](https://nvd.nist.gov/vuln/detail/CVE-2026-24882) | HIGH | `gpgv` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-86476](https://nvd.nist.gov/vuln/detail/CVE-2026-86476) | HIGH | `gstreamer1.0-gl` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-119777](https://nvd.nist.gov/vuln/detail/CVE-2026-119777) | HIGH | `gstreamer1.0-plugins-bad` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-59691](https://nvd.nist.gov/vuln/detail/CVE-2026-59691) | HIGH | `gstreamer1.0-plugins-bad` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-59692](https://nvd.nist.gov/vuln/detail/CVE-2026-59692) | HIGH | `gstreamer1.0-plugins-bad` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-86476](https://nvd.nist.gov/vuln/detail/CVE-2026-86476) | HIGH | `gstreamer1.0-plugins-base` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-119610](https://nvd.nist.gov/vuln/detail/CVE-2026-119610) | HIGH | `gstreamer1.0-plugins-good` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-121629](https://nvd.nist.gov/vuln/detail/CVE-2026-121629) | HIGH | `gstreamer1.0-plugins-good` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-18298](https://nvd.nist.gov/vuln/detail/CVE-2026-18298) | HIGH | `gstreamer1.0-plugins-good` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-18299](https://nvd.nist.gov/vuln/detail/CVE-2026-18299) | HIGH | `gstreamer1.0-plugins-good` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-53705](https://nvd.nist.gov/vuln/detail/CVE-2026-53705) | HIGH | `gstreamer1.0-plugins-good` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-19389](https://nvd.nist.gov/vuln/detail/CVE-2026-19389) | HIGH | `gstreamer1.0-plugins-ugly` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-86476](https://nvd.nist.gov/vuln/detail/CVE-2026-86476) | HIGH | `gstreamer1.0-x` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-41992](https://nvd.nist.gov/vuln/detail/CVE-2026-41992) | HIGH | `gzip` | unpatched · no fix | 15 images · v3.8, v4.2 |
| [CVE-2026-119123](https://nvd.nist.gov/vuln/detail/CVE-2026-119123) | HIGH | `imagemagick` | unpatched · no fix | 8 images · v4.2, v5.2 |
| [CVE-2026-119123](https://nvd.nist.gov/vuln/detail/CVE-2026-119123) | HIGH | `imagemagick-6-common` | unpatched · no fix | 6 images · v3.8, v4.2 |
| [CVE-2026-119123](https://nvd.nist.gov/vuln/detail/CVE-2026-119123) | HIGH | `imagemagick-6.q16` | unpatched · no fix | 4 images · v4.2 |
| [CVE-2026-119123](https://nvd.nist.gov/vuln/detail/CVE-2026-119123) | HIGH | `imagemagick-7-common` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-119123](https://nvd.nist.gov/vuln/detail/CVE-2026-119123) | HIGH | `imagemagick-7.q16` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-107364](https://nvd.nist.gov/vuln/detail/CVE-2026-107364) | HIGH | `krb5-multidev` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112315](https://nvd.nist.gov/vuln/detail/CVE-2026-112315) | HIGH | `krb5-multidev` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112316](https://nvd.nist.gov/vuln/detail/CVE-2026-112316) | HIGH | `krb5-multidev` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112317](https://nvd.nist.gov/vuln/detail/CVE-2026-112317) | HIGH | `krb5-multidev` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112318](https://nvd.nist.gov/vuln/detail/CVE-2026-112318) | HIGH | `krb5-multidev` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112319](https://nvd.nist.gov/vuln/detail/CVE-2026-112319) | HIGH | `krb5-multidev` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112320](https://nvd.nist.gov/vuln/detail/CVE-2026-112320) | HIGH | `krb5-multidev` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112321](https://nvd.nist.gov/vuln/detail/CVE-2026-112321) | HIGH | `krb5-multidev` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112322](https://nvd.nist.gov/vuln/detail/CVE-2026-112322) | HIGH | `krb5-multidev` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112323](https://nvd.nist.gov/vuln/detail/CVE-2026-112323) | HIGH | `krb5-multidev` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-118380](https://nvd.nist.gov/vuln/detail/CVE-2026-118380) | HIGH | `krb5-multidev` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-119079](https://nvd.nist.gov/vuln/detail/CVE-2026-119079) | HIGH | `krb5-multidev` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-71199](https://nvd.nist.gov/vuln/detail/CVE-2026-71199) | HIGH | `krb5-multidev` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-71200](https://nvd.nist.gov/vuln/detail/CVE-2026-71200) | HIGH | `krb5-multidev` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-54369](https://nvd.nist.gov/vuln/detail/CVE-2026-54369) | HIGH | `libacl1` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-58049](https://nvd.nist.gov/vuln/detail/CVE-2026-58049) | HIGH | `libavcodec61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64830](https://nvd.nist.gov/vuln/detail/CVE-2026-64830) | HIGH | `libavcodec61` | unpatched · no fix | 4 images · v5.2 |
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
| [CVE-2026-75141](https://nvd.nist.gov/vuln/detail/CVE-2026-75141) | HIGH | `libavcodec61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-75142](https://nvd.nist.gov/vuln/detail/CVE-2026-75142) | HIGH | `libavcodec61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-75143](https://nvd.nist.gov/vuln/detail/CVE-2026-75143) | HIGH | `libavcodec61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-75144](https://nvd.nist.gov/vuln/detail/CVE-2026-75144) | HIGH | `libavcodec61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-75146](https://nvd.nist.gov/vuln/detail/CVE-2026-75146) | HIGH | `libavcodec61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-58049](https://nvd.nist.gov/vuln/detail/CVE-2026-58049) | HIGH | `libavdevice61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64830](https://nvd.nist.gov/vuln/detail/CVE-2026-64830) | HIGH | `libavdevice61` | unpatched · no fix | 4 images · v5.2 |
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
| [CVE-2026-75141](https://nvd.nist.gov/vuln/detail/CVE-2026-75141) | HIGH | `libavdevice61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-75142](https://nvd.nist.gov/vuln/detail/CVE-2026-75142) | HIGH | `libavdevice61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-75143](https://nvd.nist.gov/vuln/detail/CVE-2026-75143) | HIGH | `libavdevice61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-75144](https://nvd.nist.gov/vuln/detail/CVE-2026-75144) | HIGH | `libavdevice61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-75146](https://nvd.nist.gov/vuln/detail/CVE-2026-75146) | HIGH | `libavdevice61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-58049](https://nvd.nist.gov/vuln/detail/CVE-2026-58049) | HIGH | `libavfilter10` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64830](https://nvd.nist.gov/vuln/detail/CVE-2026-64830) | HIGH | `libavfilter10` | unpatched · no fix | 4 images · v5.2 |
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
| [CVE-2026-75141](https://nvd.nist.gov/vuln/detail/CVE-2026-75141) | HIGH | `libavfilter10` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-75142](https://nvd.nist.gov/vuln/detail/CVE-2026-75142) | HIGH | `libavfilter10` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-75143](https://nvd.nist.gov/vuln/detail/CVE-2026-75143) | HIGH | `libavfilter10` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-75144](https://nvd.nist.gov/vuln/detail/CVE-2026-75144) | HIGH | `libavfilter10` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-75146](https://nvd.nist.gov/vuln/detail/CVE-2026-75146) | HIGH | `libavfilter10` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-58049](https://nvd.nist.gov/vuln/detail/CVE-2026-58049) | HIGH | `libavformat61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64830](https://nvd.nist.gov/vuln/detail/CVE-2026-64830) | HIGH | `libavformat61` | unpatched · no fix | 4 images · v5.2 |
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
| [CVE-2026-75141](https://nvd.nist.gov/vuln/detail/CVE-2026-75141) | HIGH | `libavformat61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-75142](https://nvd.nist.gov/vuln/detail/CVE-2026-75142) | HIGH | `libavformat61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-75143](https://nvd.nist.gov/vuln/detail/CVE-2026-75143) | HIGH | `libavformat61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-75144](https://nvd.nist.gov/vuln/detail/CVE-2026-75144) | HIGH | `libavformat61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-75146](https://nvd.nist.gov/vuln/detail/CVE-2026-75146) | HIGH | `libavformat61` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-58049](https://nvd.nist.gov/vuln/detail/CVE-2026-58049) | HIGH | `libavutil59` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64830](https://nvd.nist.gov/vuln/detail/CVE-2026-64830) | HIGH | `libavutil59` | unpatched · no fix | 4 images · v5.2 |
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
| [CVE-2026-75141](https://nvd.nist.gov/vuln/detail/CVE-2026-75141) | HIGH | `libavutil59` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-75142](https://nvd.nist.gov/vuln/detail/CVE-2026-75142) | HIGH | `libavutil59` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-75143](https://nvd.nist.gov/vuln/detail/CVE-2026-75143) | HIGH | `libavutil59` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-75144](https://nvd.nist.gov/vuln/detail/CVE-2026-75144) | HIGH | `libavutil59` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-75146](https://nvd.nist.gov/vuln/detail/CVE-2026-75146) | HIGH | `libavutil59` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-0636](https://nvd.nist.gov/vuln/detail/CVE-2026-0636) | HIGH | `libbcmail-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-12185](https://nvd.nist.gov/vuln/detail/CVE-2026-12185) | HIGH | `libbcmail-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-12802](https://nvd.nist.gov/vuln/detail/CVE-2026-12802) | HIGH | `libbcmail-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-12803](https://nvd.nist.gov/vuln/detail/CVE-2026-12803) | HIGH | `libbcmail-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-12816](https://nvd.nist.gov/vuln/detail/CVE-2026-12816) | HIGH | `libbcmail-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-12817](https://nvd.nist.gov/vuln/detail/CVE-2026-12817) | HIGH | `libbcmail-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-12852](https://nvd.nist.gov/vuln/detail/CVE-2026-12852) | HIGH | `libbcmail-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-13506](https://nvd.nist.gov/vuln/detail/CVE-2026-13506) | HIGH | `libbcmail-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-13586](https://nvd.nist.gov/vuln/detail/CVE-2026-13586) | HIGH | `libbcmail-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-14682](https://nvd.nist.gov/vuln/detail/CVE-2026-14682) | HIGH | `libbcmail-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-15055](https://nvd.nist.gov/vuln/detail/CVE-2026-15055) | HIGH | `libbcmail-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-17507](https://nvd.nist.gov/vuln/detail/CVE-2026-17507) | HIGH | `libbcmail-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-3505](https://nvd.nist.gov/vuln/detail/CVE-2026-3505) | HIGH | `libbcmail-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-5588](https://nvd.nist.gov/vuln/detail/CVE-2026-5588) | HIGH | `libbcmail-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-5598](https://nvd.nist.gov/vuln/detail/CVE-2026-5598) | HIGH | `libbcmail-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-58059](https://nvd.nist.gov/vuln/detail/CVE-2026-58059) | HIGH | `libbcmail-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-58060](https://nvd.nist.gov/vuln/detail/CVE-2026-58060) | HIGH | `libbcmail-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-58061](https://nvd.nist.gov/vuln/detail/CVE-2026-58061) | HIGH | `libbcmail-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59639](https://nvd.nist.gov/vuln/detail/CVE-2026-59639) | HIGH | `libbcmail-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59642](https://nvd.nist.gov/vuln/detail/CVE-2026-59642) | HIGH | `libbcmail-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59643](https://nvd.nist.gov/vuln/detail/CVE-2026-59643) | HIGH | `libbcmail-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59644](https://nvd.nist.gov/vuln/detail/CVE-2026-59644) | HIGH | `libbcmail-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59645](https://nvd.nist.gov/vuln/detail/CVE-2026-59645) | HIGH | `libbcmail-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59646](https://nvd.nist.gov/vuln/detail/CVE-2026-59646) | HIGH | `libbcmail-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59649](https://nvd.nist.gov/vuln/detail/CVE-2026-59649) | HIGH | `libbcmail-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59651](https://nvd.nist.gov/vuln/detail/CVE-2026-59651) | HIGH | `libbcmail-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-71887](https://nvd.nist.gov/vuln/detail/CVE-2026-71887) | HIGH | `libbcmail-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-71888](https://nvd.nist.gov/vuln/detail/CVE-2026-71888) | HIGH | `libbcmail-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-71889](https://nvd.nist.gov/vuln/detail/CVE-2026-71889) | HIGH | `libbcmail-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-0636](https://nvd.nist.gov/vuln/detail/CVE-2026-0636) | HIGH | `libbcpkix-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-12185](https://nvd.nist.gov/vuln/detail/CVE-2026-12185) | HIGH | `libbcpkix-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-12802](https://nvd.nist.gov/vuln/detail/CVE-2026-12802) | HIGH | `libbcpkix-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-12803](https://nvd.nist.gov/vuln/detail/CVE-2026-12803) | HIGH | `libbcpkix-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-12816](https://nvd.nist.gov/vuln/detail/CVE-2026-12816) | HIGH | `libbcpkix-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-12817](https://nvd.nist.gov/vuln/detail/CVE-2026-12817) | HIGH | `libbcpkix-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-12852](https://nvd.nist.gov/vuln/detail/CVE-2026-12852) | HIGH | `libbcpkix-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-13506](https://nvd.nist.gov/vuln/detail/CVE-2026-13506) | HIGH | `libbcpkix-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-13586](https://nvd.nist.gov/vuln/detail/CVE-2026-13586) | HIGH | `libbcpkix-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-14682](https://nvd.nist.gov/vuln/detail/CVE-2026-14682) | HIGH | `libbcpkix-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-15055](https://nvd.nist.gov/vuln/detail/CVE-2026-15055) | HIGH | `libbcpkix-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-17507](https://nvd.nist.gov/vuln/detail/CVE-2026-17507) | HIGH | `libbcpkix-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-3505](https://nvd.nist.gov/vuln/detail/CVE-2026-3505) | HIGH | `libbcpkix-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-5588](https://nvd.nist.gov/vuln/detail/CVE-2026-5588) | HIGH | `libbcpkix-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-5598](https://nvd.nist.gov/vuln/detail/CVE-2026-5598) | HIGH | `libbcpkix-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-58059](https://nvd.nist.gov/vuln/detail/CVE-2026-58059) | HIGH | `libbcpkix-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-58060](https://nvd.nist.gov/vuln/detail/CVE-2026-58060) | HIGH | `libbcpkix-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-58061](https://nvd.nist.gov/vuln/detail/CVE-2026-58061) | HIGH | `libbcpkix-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59639](https://nvd.nist.gov/vuln/detail/CVE-2026-59639) | HIGH | `libbcpkix-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59642](https://nvd.nist.gov/vuln/detail/CVE-2026-59642) | HIGH | `libbcpkix-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59643](https://nvd.nist.gov/vuln/detail/CVE-2026-59643) | HIGH | `libbcpkix-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59644](https://nvd.nist.gov/vuln/detail/CVE-2026-59644) | HIGH | `libbcpkix-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59645](https://nvd.nist.gov/vuln/detail/CVE-2026-59645) | HIGH | `libbcpkix-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59646](https://nvd.nist.gov/vuln/detail/CVE-2026-59646) | HIGH | `libbcpkix-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59649](https://nvd.nist.gov/vuln/detail/CVE-2026-59649) | HIGH | `libbcpkix-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59651](https://nvd.nist.gov/vuln/detail/CVE-2026-59651) | HIGH | `libbcpkix-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-71887](https://nvd.nist.gov/vuln/detail/CVE-2026-71887) | HIGH | `libbcpkix-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-71888](https://nvd.nist.gov/vuln/detail/CVE-2026-71888) | HIGH | `libbcpkix-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-71889](https://nvd.nist.gov/vuln/detail/CVE-2026-71889) | HIGH | `libbcpkix-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-0636](https://nvd.nist.gov/vuln/detail/CVE-2026-0636) | HIGH | `libbcprov-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-12185](https://nvd.nist.gov/vuln/detail/CVE-2026-12185) | HIGH | `libbcprov-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-12802](https://nvd.nist.gov/vuln/detail/CVE-2026-12802) | HIGH | `libbcprov-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-12803](https://nvd.nist.gov/vuln/detail/CVE-2026-12803) | HIGH | `libbcprov-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-12816](https://nvd.nist.gov/vuln/detail/CVE-2026-12816) | HIGH | `libbcprov-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-12817](https://nvd.nist.gov/vuln/detail/CVE-2026-12817) | HIGH | `libbcprov-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-12852](https://nvd.nist.gov/vuln/detail/CVE-2026-12852) | HIGH | `libbcprov-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-13506](https://nvd.nist.gov/vuln/detail/CVE-2026-13506) | HIGH | `libbcprov-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-13586](https://nvd.nist.gov/vuln/detail/CVE-2026-13586) | HIGH | `libbcprov-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-14682](https://nvd.nist.gov/vuln/detail/CVE-2026-14682) | HIGH | `libbcprov-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-15055](https://nvd.nist.gov/vuln/detail/CVE-2026-15055) | HIGH | `libbcprov-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-17507](https://nvd.nist.gov/vuln/detail/CVE-2026-17507) | HIGH | `libbcprov-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-3505](https://nvd.nist.gov/vuln/detail/CVE-2026-3505) | HIGH | `libbcprov-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-5588](https://nvd.nist.gov/vuln/detail/CVE-2026-5588) | HIGH | `libbcprov-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-5598](https://nvd.nist.gov/vuln/detail/CVE-2026-5598) | HIGH | `libbcprov-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-58059](https://nvd.nist.gov/vuln/detail/CVE-2026-58059) | HIGH | `libbcprov-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-58060](https://nvd.nist.gov/vuln/detail/CVE-2026-58060) | HIGH | `libbcprov-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-58061](https://nvd.nist.gov/vuln/detail/CVE-2026-58061) | HIGH | `libbcprov-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59639](https://nvd.nist.gov/vuln/detail/CVE-2026-59639) | HIGH | `libbcprov-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59642](https://nvd.nist.gov/vuln/detail/CVE-2026-59642) | HIGH | `libbcprov-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59643](https://nvd.nist.gov/vuln/detail/CVE-2026-59643) | HIGH | `libbcprov-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59644](https://nvd.nist.gov/vuln/detail/CVE-2026-59644) | HIGH | `libbcprov-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59645](https://nvd.nist.gov/vuln/detail/CVE-2026-59645) | HIGH | `libbcprov-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59646](https://nvd.nist.gov/vuln/detail/CVE-2026-59646) | HIGH | `libbcprov-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59649](https://nvd.nist.gov/vuln/detail/CVE-2026-59649) | HIGH | `libbcprov-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59651](https://nvd.nist.gov/vuln/detail/CVE-2026-59651) | HIGH | `libbcprov-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-71887](https://nvd.nist.gov/vuln/detail/CVE-2026-71887) | HIGH | `libbcprov-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-71888](https://nvd.nist.gov/vuln/detail/CVE-2026-71888) | HIGH | `libbcprov-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-71889](https://nvd.nist.gov/vuln/detail/CVE-2026-71889) | HIGH | `libbcprov-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-0636](https://nvd.nist.gov/vuln/detail/CVE-2026-0636) | HIGH | `libbcutil-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-12185](https://nvd.nist.gov/vuln/detail/CVE-2026-12185) | HIGH | `libbcutil-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-12802](https://nvd.nist.gov/vuln/detail/CVE-2026-12802) | HIGH | `libbcutil-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-12803](https://nvd.nist.gov/vuln/detail/CVE-2026-12803) | HIGH | `libbcutil-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-12816](https://nvd.nist.gov/vuln/detail/CVE-2026-12816) | HIGH | `libbcutil-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-12817](https://nvd.nist.gov/vuln/detail/CVE-2026-12817) | HIGH | `libbcutil-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-12852](https://nvd.nist.gov/vuln/detail/CVE-2026-12852) | HIGH | `libbcutil-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-13506](https://nvd.nist.gov/vuln/detail/CVE-2026-13506) | HIGH | `libbcutil-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-13586](https://nvd.nist.gov/vuln/detail/CVE-2026-13586) | HIGH | `libbcutil-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-14682](https://nvd.nist.gov/vuln/detail/CVE-2026-14682) | HIGH | `libbcutil-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-15055](https://nvd.nist.gov/vuln/detail/CVE-2026-15055) | HIGH | `libbcutil-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-17507](https://nvd.nist.gov/vuln/detail/CVE-2026-17507) | HIGH | `libbcutil-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-3505](https://nvd.nist.gov/vuln/detail/CVE-2026-3505) | HIGH | `libbcutil-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-5588](https://nvd.nist.gov/vuln/detail/CVE-2026-5588) | HIGH | `libbcutil-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-5598](https://nvd.nist.gov/vuln/detail/CVE-2026-5598) | HIGH | `libbcutil-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-58059](https://nvd.nist.gov/vuln/detail/CVE-2026-58059) | HIGH | `libbcutil-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-58060](https://nvd.nist.gov/vuln/detail/CVE-2026-58060) | HIGH | `libbcutil-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-58061](https://nvd.nist.gov/vuln/detail/CVE-2026-58061) | HIGH | `libbcutil-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59639](https://nvd.nist.gov/vuln/detail/CVE-2026-59639) | HIGH | `libbcutil-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59642](https://nvd.nist.gov/vuln/detail/CVE-2026-59642) | HIGH | `libbcutil-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59643](https://nvd.nist.gov/vuln/detail/CVE-2026-59643) | HIGH | `libbcutil-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59644](https://nvd.nist.gov/vuln/detail/CVE-2026-59644) | HIGH | `libbcutil-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59645](https://nvd.nist.gov/vuln/detail/CVE-2026-59645) | HIGH | `libbcutil-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59646](https://nvd.nist.gov/vuln/detail/CVE-2026-59646) | HIGH | `libbcutil-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59649](https://nvd.nist.gov/vuln/detail/CVE-2026-59649) | HIGH | `libbcutil-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59651](https://nvd.nist.gov/vuln/detail/CVE-2026-59651) | HIGH | `libbcutil-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-71887](https://nvd.nist.gov/vuln/detail/CVE-2026-71887) | HIGH | `libbcutil-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-71888](https://nvd.nist.gov/vuln/detail/CVE-2026-71888) | HIGH | `libbcutil-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-71889](https://nvd.nist.gov/vuln/detail/CVE-2026-71889) | HIGH | `libbcutil-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-53613](https://nvd.nist.gov/vuln/detail/CVE-2026-53613) | HIGH | `libblkid1` | unpatched · no fix | 15 images · v3.8, v4.2 |
| [CVE-2026-53615](https://nvd.nist.gov/vuln/detail/CVE-2026-53615) | HIGH | `libblkid1` | unpatched · no fix | 15 images · v3.8, v4.2 |
| [CVE-2026-76642](https://nvd.nist.gov/vuln/detail/CVE-2026-76642) | HIGH | `libblkid1` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-78408](https://nvd.nist.gov/vuln/detail/CVE-2026-78408) | HIGH | `libblkid1` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-78409](https://nvd.nist.gov/vuln/detail/CVE-2026-78409) | HIGH | `libblkid1` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-78410](https://nvd.nist.gov/vuln/detail/CVE-2026-78410) | HIGH | `libblkid1` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-16554](https://nvd.nist.gov/vuln/detail/CVE-2026-16554) | HIGH | `libcjson1` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-29036](https://nvd.nist.gov/vuln/detail/CVE-2026-29036) | HIGH | `libcjson1` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-67215](https://nvd.nist.gov/vuln/detail/CVE-2026-67215) | HIGH | `libcjson1` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-67216](https://nvd.nist.gov/vuln/detail/CVE-2026-67216) | HIGH | `libcjson1` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-87933](https://nvd.nist.gov/vuln/detail/CVE-2026-87933) | HIGH | `libcjson1` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-34980](https://nvd.nist.gov/vuln/detail/CVE-2026-34980) | HIGH | `libcups2` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-55453](https://nvd.nist.gov/vuln/detail/CVE-2026-55453) | HIGH | `libcups2` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-34980](https://nvd.nist.gov/vuln/detail/CVE-2026-34980) | HIGH | `libcups2t64` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-55453](https://nvd.nist.gov/vuln/detail/CVE-2026-55453) | HIGH | `libcups2t64` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-12064](https://nvd.nist.gov/vuln/detail/CVE-2026-12064) | HIGH | `libcurl3-gnutls` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-6276](https://nvd.nist.gov/vuln/detail/CVE-2026-6276) | HIGH | `libcurl3-gnutls` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-8286](https://nvd.nist.gov/vuln/detail/CVE-2026-8286) | HIGH | `libcurl3-gnutls` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-8458](https://nvd.nist.gov/vuln/detail/CVE-2026-8458) | HIGH | `libcurl3-gnutls` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-8927](https://nvd.nist.gov/vuln/detail/CVE-2026-8927) | HIGH | `libcurl3-gnutls` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-12064](https://nvd.nist.gov/vuln/detail/CVE-2026-12064) | HIGH | `libcurl3t64-gnutls` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-8458](https://nvd.nist.gov/vuln/detail/CVE-2026-8458) | HIGH | `libcurl3t64-gnutls` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-12064](https://nvd.nist.gov/vuln/detail/CVE-2026-12064) | HIGH | `libcurl4` | unpatched · no fix | 15 images · v3.8, v4.2 |
| [CVE-2026-6276](https://nvd.nist.gov/vuln/detail/CVE-2026-6276) | HIGH | `libcurl4` | unpatched · no fix | 15 images · v3.8, v4.2 |
| [CVE-2026-8286](https://nvd.nist.gov/vuln/detail/CVE-2026-8286) | HIGH | `libcurl4` | unpatched · no fix | 15 images · v3.8, v4.2 |
| [CVE-2026-8458](https://nvd.nist.gov/vuln/detail/CVE-2026-8458) | HIGH | `libcurl4` | unpatched · no fix | 15 images · v3.8, v4.2 |
| [CVE-2026-8927](https://nvd.nist.gov/vuln/detail/CVE-2026-8927) | HIGH | `libcurl4` | unpatched · no fix | 15 images · v3.8, v4.2 |
| [CVE-2026-12064](https://nvd.nist.gov/vuln/detail/CVE-2026-12064) | HIGH | `libcurl4t64` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-8458](https://nvd.nist.gov/vuln/detail/CVE-2026-8458) | HIGH | `libcurl4t64` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-113351](https://nvd.nist.gov/vuln/detail/CVE-2026-113351) | HIGH | `libexpat1` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-115506](https://nvd.nist.gov/vuln/detail/CVE-2026-115506) | HIGH | `libexpat1` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-117610](https://nvd.nist.gov/vuln/detail/CVE-2026-117610) | HIGH | `libexpat1` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-118370](https://nvd.nist.gov/vuln/detail/CVE-2026-118370) | HIGH | `libexpat1` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2025-65104](https://nvd.nist.gov/vuln/detail/CVE-2025-65104) | HIGH | `libfbclient2` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-53613](https://nvd.nist.gov/vuln/detail/CVE-2026-53613) | HIGH | `libfdisk1` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-53615](https://nvd.nist.gov/vuln/detail/CVE-2026-53615) | HIGH | `libfdisk1` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-78410](https://nvd.nist.gov/vuln/detail/CVE-2026-78410) | HIGH | `libfdisk1` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-61714](https://nvd.nist.gov/vuln/detail/CVE-2026-61714) | HIGH | `libfluidsynth3` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-58010](https://nvd.nist.gov/vuln/detail/CVE-2026-58010) | HIGH | `libglib2.0-0` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-58011](https://nvd.nist.gov/vuln/detail/CVE-2026-58011) | HIGH | `libglib2.0-0` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-58012](https://nvd.nist.gov/vuln/detail/CVE-2026-58012) | HIGH | `libglib2.0-0` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-58013](https://nvd.nist.gov/vuln/detail/CVE-2026-58013) | HIGH | `libglib2.0-0` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-58014](https://nvd.nist.gov/vuln/detail/CVE-2026-58014) | HIGH | `libglib2.0-0` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-58015](https://nvd.nist.gov/vuln/detail/CVE-2026-58015) | HIGH | `libglib2.0-0` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-58010](https://nvd.nist.gov/vuln/detail/CVE-2026-58010) | HIGH | `libglib2.0-data` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-58011](https://nvd.nist.gov/vuln/detail/CVE-2026-58011) | HIGH | `libglib2.0-data` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-58012](https://nvd.nist.gov/vuln/detail/CVE-2026-58012) | HIGH | `libglib2.0-data` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-58013](https://nvd.nist.gov/vuln/detail/CVE-2026-58013) | HIGH | `libglib2.0-data` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-58014](https://nvd.nist.gov/vuln/detail/CVE-2026-58014) | HIGH | `libglib2.0-data` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-58015](https://nvd.nist.gov/vuln/detail/CVE-2026-58015) | HIGH | `libglib2.0-data` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-101258](https://nvd.nist.gov/vuln/detail/CVE-2026-101258) | HIGH | `libgs-common` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-103226](https://nvd.nist.gov/vuln/detail/CVE-2026-103226) | HIGH | `libgs-common` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-101258](https://nvd.nist.gov/vuln/detail/CVE-2026-101258) | HIGH | `libgs10` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-103226](https://nvd.nist.gov/vuln/detail/CVE-2026-103226) | HIGH | `libgs10` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-101258](https://nvd.nist.gov/vuln/detail/CVE-2026-101258) | HIGH | `libgs10-common` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-103226](https://nvd.nist.gov/vuln/detail/CVE-2026-103226) | HIGH | `libgs10-common` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-107364](https://nvd.nist.gov/vuln/detail/CVE-2026-107364) | HIGH | `libgssapi-krb5-2` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-112315](https://nvd.nist.gov/vuln/detail/CVE-2026-112315) | HIGH | `libgssapi-krb5-2` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-112316](https://nvd.nist.gov/vuln/detail/CVE-2026-112316) | HIGH | `libgssapi-krb5-2` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-112317](https://nvd.nist.gov/vuln/detail/CVE-2026-112317) | HIGH | `libgssapi-krb5-2` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-112318](https://nvd.nist.gov/vuln/detail/CVE-2026-112318) | HIGH | `libgssapi-krb5-2` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-112319](https://nvd.nist.gov/vuln/detail/CVE-2026-112319) | HIGH | `libgssapi-krb5-2` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-112320](https://nvd.nist.gov/vuln/detail/CVE-2026-112320) | HIGH | `libgssapi-krb5-2` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-112321](https://nvd.nist.gov/vuln/detail/CVE-2026-112321) | HIGH | `libgssapi-krb5-2` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-112322](https://nvd.nist.gov/vuln/detail/CVE-2026-112322) | HIGH | `libgssapi-krb5-2` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-112323](https://nvd.nist.gov/vuln/detail/CVE-2026-112323) | HIGH | `libgssapi-krb5-2` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-118380](https://nvd.nist.gov/vuln/detail/CVE-2026-118380) | HIGH | `libgssapi-krb5-2` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-119079](https://nvd.nist.gov/vuln/detail/CVE-2026-119079) | HIGH | `libgssapi-krb5-2` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-71199](https://nvd.nist.gov/vuln/detail/CVE-2026-71199) | HIGH | `libgssapi-krb5-2` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-71200](https://nvd.nist.gov/vuln/detail/CVE-2026-71200) | HIGH | `libgssapi-krb5-2` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-107364](https://nvd.nist.gov/vuln/detail/CVE-2026-107364) | HIGH | `libgssrpc4` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112315](https://nvd.nist.gov/vuln/detail/CVE-2026-112315) | HIGH | `libgssrpc4` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112316](https://nvd.nist.gov/vuln/detail/CVE-2026-112316) | HIGH | `libgssrpc4` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112317](https://nvd.nist.gov/vuln/detail/CVE-2026-112317) | HIGH | `libgssrpc4` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112318](https://nvd.nist.gov/vuln/detail/CVE-2026-112318) | HIGH | `libgssrpc4` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112319](https://nvd.nist.gov/vuln/detail/CVE-2026-112319) | HIGH | `libgssrpc4` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112320](https://nvd.nist.gov/vuln/detail/CVE-2026-112320) | HIGH | `libgssrpc4` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112321](https://nvd.nist.gov/vuln/detail/CVE-2026-112321) | HIGH | `libgssrpc4` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112322](https://nvd.nist.gov/vuln/detail/CVE-2026-112322) | HIGH | `libgssrpc4` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112323](https://nvd.nist.gov/vuln/detail/CVE-2026-112323) | HIGH | `libgssrpc4` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-118380](https://nvd.nist.gov/vuln/detail/CVE-2026-118380) | HIGH | `libgssrpc4` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-119079](https://nvd.nist.gov/vuln/detail/CVE-2026-119079) | HIGH | `libgssrpc4` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-71199](https://nvd.nist.gov/vuln/detail/CVE-2026-71199) | HIGH | `libgssrpc4` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-71200](https://nvd.nist.gov/vuln/detail/CVE-2026-71200) | HIGH | `libgssrpc4` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-86476](https://nvd.nist.gov/vuln/detail/CVE-2026-86476) | HIGH | `libgstreamer-gl1.0-0` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-119777](https://nvd.nist.gov/vuln/detail/CVE-2026-119777) | HIGH | `libgstreamer-plugins-bad1.0-0` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-59691](https://nvd.nist.gov/vuln/detail/CVE-2026-59691) | HIGH | `libgstreamer-plugins-bad1.0-0` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-59692](https://nvd.nist.gov/vuln/detail/CVE-2026-59692) | HIGH | `libgstreamer-plugins-bad1.0-0` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-86476](https://nvd.nist.gov/vuln/detail/CVE-2026-86476) | HIGH | `libgstreamer-plugins-base1.0-0` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2023-25193](https://nvd.nist.gov/vuln/detail/CVE-2023-25193) | HIGH | `libharfbuzz-icu0` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2023-25193](https://nvd.nist.gov/vuln/detail/CVE-2023-25193) | HIGH | `libharfbuzz0b` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2025-68431](https://nvd.nist.gov/vuln/detail/CVE-2025-68431) | HIGH | `libheif1` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-120208](https://nvd.nist.gov/vuln/detail/CVE-2026-120208) | HIGH | `libheif1` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-32740](https://nvd.nist.gov/vuln/detail/CVE-2026-32740) | HIGH | `libheif1` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-32741](https://nvd.nist.gov/vuln/detail/CVE-2026-32741) | HIGH | `libheif1` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-32882](https://nvd.nist.gov/vuln/detail/CVE-2026-32882) | HIGH | `libheif1` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-41071](https://nvd.nist.gov/vuln/detail/CVE-2026-41071) | HIGH | `libheif1` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-47178](https://nvd.nist.gov/vuln/detail/CVE-2026-47178) | HIGH | `libheif1` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-50142](https://nvd.nist.gov/vuln/detail/CVE-2026-50142) | HIGH | `libheif1` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-62289](https://nvd.nist.gov/vuln/detail/CVE-2026-62289) | HIGH | `libheif1` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-62292](https://nvd.nist.gov/vuln/detail/CVE-2026-62292) | HIGH | `libheif1` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-84384](https://nvd.nist.gov/vuln/detail/CVE-2026-84384) | HIGH | `libheif1` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-84444](https://nvd.nist.gov/vuln/detail/CVE-2026-84444) | HIGH | `libheif1` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-84446](https://nvd.nist.gov/vuln/detail/CVE-2026-84446) | HIGH | `libheif1` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-84447](https://nvd.nist.gov/vuln/detail/CVE-2026-84447) | HIGH | `libheif1` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-84450](https://nvd.nist.gov/vuln/detail/CVE-2026-84450) | HIGH | `libheif1` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-84451](https://nvd.nist.gov/vuln/detail/CVE-2026-84451) | HIGH | `libheif1` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-14741](https://nvd.nist.gov/vuln/detail/CVE-2026-14741) | HIGH | `libhttp-date-perl` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2025-65104](https://nvd.nist.gov/vuln/detail/CVE-2025-65104) | HIGH | `libib-util` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2021-37819](https://nvd.nist.gov/vuln/detail/CVE-2021-37819) | HIGH | `libitext-java` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-120194](https://nvd.nist.gov/vuln/detail/CVE-2026-120194) | HIGH | `libjson-glib-1.0-0` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-120194](https://nvd.nist.gov/vuln/detail/CVE-2026-120194) | HIGH | `libjson-glib-1.0-common` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2025-70103](https://nvd.nist.gov/vuln/detail/CVE-2025-70103) | HIGH | `libjxl0.7` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-107364](https://nvd.nist.gov/vuln/detail/CVE-2026-107364) | HIGH | `libk5crypto3` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-112315](https://nvd.nist.gov/vuln/detail/CVE-2026-112315) | HIGH | `libk5crypto3` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-112316](https://nvd.nist.gov/vuln/detail/CVE-2026-112316) | HIGH | `libk5crypto3` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-112317](https://nvd.nist.gov/vuln/detail/CVE-2026-112317) | HIGH | `libk5crypto3` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-112318](https://nvd.nist.gov/vuln/detail/CVE-2026-112318) | HIGH | `libk5crypto3` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-112319](https://nvd.nist.gov/vuln/detail/CVE-2026-112319) | HIGH | `libk5crypto3` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-112320](https://nvd.nist.gov/vuln/detail/CVE-2026-112320) | HIGH | `libk5crypto3` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-112321](https://nvd.nist.gov/vuln/detail/CVE-2026-112321) | HIGH | `libk5crypto3` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-112322](https://nvd.nist.gov/vuln/detail/CVE-2026-112322) | HIGH | `libk5crypto3` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-112323](https://nvd.nist.gov/vuln/detail/CVE-2026-112323) | HIGH | `libk5crypto3` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-118380](https://nvd.nist.gov/vuln/detail/CVE-2026-118380) | HIGH | `libk5crypto3` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-119079](https://nvd.nist.gov/vuln/detail/CVE-2026-119079) | HIGH | `libk5crypto3` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-71199](https://nvd.nist.gov/vuln/detail/CVE-2026-71199) | HIGH | `libk5crypto3` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-71200](https://nvd.nist.gov/vuln/detail/CVE-2026-71200) | HIGH | `libk5crypto3` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-107364](https://nvd.nist.gov/vuln/detail/CVE-2026-107364) | HIGH | `libkadm5clnt-mit12` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112315](https://nvd.nist.gov/vuln/detail/CVE-2026-112315) | HIGH | `libkadm5clnt-mit12` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112316](https://nvd.nist.gov/vuln/detail/CVE-2026-112316) | HIGH | `libkadm5clnt-mit12` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112317](https://nvd.nist.gov/vuln/detail/CVE-2026-112317) | HIGH | `libkadm5clnt-mit12` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112318](https://nvd.nist.gov/vuln/detail/CVE-2026-112318) | HIGH | `libkadm5clnt-mit12` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112319](https://nvd.nist.gov/vuln/detail/CVE-2026-112319) | HIGH | `libkadm5clnt-mit12` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112320](https://nvd.nist.gov/vuln/detail/CVE-2026-112320) | HIGH | `libkadm5clnt-mit12` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112321](https://nvd.nist.gov/vuln/detail/CVE-2026-112321) | HIGH | `libkadm5clnt-mit12` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112322](https://nvd.nist.gov/vuln/detail/CVE-2026-112322) | HIGH | `libkadm5clnt-mit12` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112323](https://nvd.nist.gov/vuln/detail/CVE-2026-112323) | HIGH | `libkadm5clnt-mit12` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-118380](https://nvd.nist.gov/vuln/detail/CVE-2026-118380) | HIGH | `libkadm5clnt-mit12` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-119079](https://nvd.nist.gov/vuln/detail/CVE-2026-119079) | HIGH | `libkadm5clnt-mit12` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-71199](https://nvd.nist.gov/vuln/detail/CVE-2026-71199) | HIGH | `libkadm5clnt-mit12` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-71200](https://nvd.nist.gov/vuln/detail/CVE-2026-71200) | HIGH | `libkadm5clnt-mit12` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-107364](https://nvd.nist.gov/vuln/detail/CVE-2026-107364) | HIGH | `libkadm5srv-mit12` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112315](https://nvd.nist.gov/vuln/detail/CVE-2026-112315) | HIGH | `libkadm5srv-mit12` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112316](https://nvd.nist.gov/vuln/detail/CVE-2026-112316) | HIGH | `libkadm5srv-mit12` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112317](https://nvd.nist.gov/vuln/detail/CVE-2026-112317) | HIGH | `libkadm5srv-mit12` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112318](https://nvd.nist.gov/vuln/detail/CVE-2026-112318) | HIGH | `libkadm5srv-mit12` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112319](https://nvd.nist.gov/vuln/detail/CVE-2026-112319) | HIGH | `libkadm5srv-mit12` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112320](https://nvd.nist.gov/vuln/detail/CVE-2026-112320) | HIGH | `libkadm5srv-mit12` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112321](https://nvd.nist.gov/vuln/detail/CVE-2026-112321) | HIGH | `libkadm5srv-mit12` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112322](https://nvd.nist.gov/vuln/detail/CVE-2026-112322) | HIGH | `libkadm5srv-mit12` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112323](https://nvd.nist.gov/vuln/detail/CVE-2026-112323) | HIGH | `libkadm5srv-mit12` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-118380](https://nvd.nist.gov/vuln/detail/CVE-2026-118380) | HIGH | `libkadm5srv-mit12` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-119079](https://nvd.nist.gov/vuln/detail/CVE-2026-119079) | HIGH | `libkadm5srv-mit12` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-71199](https://nvd.nist.gov/vuln/detail/CVE-2026-71199) | HIGH | `libkadm5srv-mit12` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-71200](https://nvd.nist.gov/vuln/detail/CVE-2026-71200) | HIGH | `libkadm5srv-mit12` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-107364](https://nvd.nist.gov/vuln/detail/CVE-2026-107364) | HIGH | `libkdb5-10` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112315](https://nvd.nist.gov/vuln/detail/CVE-2026-112315) | HIGH | `libkdb5-10` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112316](https://nvd.nist.gov/vuln/detail/CVE-2026-112316) | HIGH | `libkdb5-10` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112317](https://nvd.nist.gov/vuln/detail/CVE-2026-112317) | HIGH | `libkdb5-10` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112318](https://nvd.nist.gov/vuln/detail/CVE-2026-112318) | HIGH | `libkdb5-10` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112319](https://nvd.nist.gov/vuln/detail/CVE-2026-112319) | HIGH | `libkdb5-10` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112320](https://nvd.nist.gov/vuln/detail/CVE-2026-112320) | HIGH | `libkdb5-10` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112321](https://nvd.nist.gov/vuln/detail/CVE-2026-112321) | HIGH | `libkdb5-10` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112322](https://nvd.nist.gov/vuln/detail/CVE-2026-112322) | HIGH | `libkdb5-10` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112323](https://nvd.nist.gov/vuln/detail/CVE-2026-112323) | HIGH | `libkdb5-10` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-118380](https://nvd.nist.gov/vuln/detail/CVE-2026-118380) | HIGH | `libkdb5-10` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-119079](https://nvd.nist.gov/vuln/detail/CVE-2026-119079) | HIGH | `libkdb5-10` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-71199](https://nvd.nist.gov/vuln/detail/CVE-2026-71199) | HIGH | `libkdb5-10` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-71200](https://nvd.nist.gov/vuln/detail/CVE-2026-71200) | HIGH | `libkdb5-10` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-107364](https://nvd.nist.gov/vuln/detail/CVE-2026-107364) | HIGH | `libkrb5-3` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-112315](https://nvd.nist.gov/vuln/detail/CVE-2026-112315) | HIGH | `libkrb5-3` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-112316](https://nvd.nist.gov/vuln/detail/CVE-2026-112316) | HIGH | `libkrb5-3` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-112317](https://nvd.nist.gov/vuln/detail/CVE-2026-112317) | HIGH | `libkrb5-3` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-112318](https://nvd.nist.gov/vuln/detail/CVE-2026-112318) | HIGH | `libkrb5-3` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-112319](https://nvd.nist.gov/vuln/detail/CVE-2026-112319) | HIGH | `libkrb5-3` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-112320](https://nvd.nist.gov/vuln/detail/CVE-2026-112320) | HIGH | `libkrb5-3` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-112321](https://nvd.nist.gov/vuln/detail/CVE-2026-112321) | HIGH | `libkrb5-3` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-112322](https://nvd.nist.gov/vuln/detail/CVE-2026-112322) | HIGH | `libkrb5-3` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-112323](https://nvd.nist.gov/vuln/detail/CVE-2026-112323) | HIGH | `libkrb5-3` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-118380](https://nvd.nist.gov/vuln/detail/CVE-2026-118380) | HIGH | `libkrb5-3` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-119079](https://nvd.nist.gov/vuln/detail/CVE-2026-119079) | HIGH | `libkrb5-3` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-71199](https://nvd.nist.gov/vuln/detail/CVE-2026-71199) | HIGH | `libkrb5-3` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-71200](https://nvd.nist.gov/vuln/detail/CVE-2026-71200) | HIGH | `libkrb5-3` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-107364](https://nvd.nist.gov/vuln/detail/CVE-2026-107364) | HIGH | `libkrb5-dev` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112315](https://nvd.nist.gov/vuln/detail/CVE-2026-112315) | HIGH | `libkrb5-dev` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112316](https://nvd.nist.gov/vuln/detail/CVE-2026-112316) | HIGH | `libkrb5-dev` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112317](https://nvd.nist.gov/vuln/detail/CVE-2026-112317) | HIGH | `libkrb5-dev` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112318](https://nvd.nist.gov/vuln/detail/CVE-2026-112318) | HIGH | `libkrb5-dev` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112319](https://nvd.nist.gov/vuln/detail/CVE-2026-112319) | HIGH | `libkrb5-dev` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112320](https://nvd.nist.gov/vuln/detail/CVE-2026-112320) | HIGH | `libkrb5-dev` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112321](https://nvd.nist.gov/vuln/detail/CVE-2026-112321) | HIGH | `libkrb5-dev` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112322](https://nvd.nist.gov/vuln/detail/CVE-2026-112322) | HIGH | `libkrb5-dev` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-112323](https://nvd.nist.gov/vuln/detail/CVE-2026-112323) | HIGH | `libkrb5-dev` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-118380](https://nvd.nist.gov/vuln/detail/CVE-2026-118380) | HIGH | `libkrb5-dev` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-119079](https://nvd.nist.gov/vuln/detail/CVE-2026-119079) | HIGH | `libkrb5-dev` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-71199](https://nvd.nist.gov/vuln/detail/CVE-2026-71199) | HIGH | `libkrb5-dev` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-71200](https://nvd.nist.gov/vuln/detail/CVE-2026-71200) | HIGH | `libkrb5-dev` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-107364](https://nvd.nist.gov/vuln/detail/CVE-2026-107364) | HIGH | `libkrb5support0` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-112315](https://nvd.nist.gov/vuln/detail/CVE-2026-112315) | HIGH | `libkrb5support0` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-112316](https://nvd.nist.gov/vuln/detail/CVE-2026-112316) | HIGH | `libkrb5support0` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-112317](https://nvd.nist.gov/vuln/detail/CVE-2026-112317) | HIGH | `libkrb5support0` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-112318](https://nvd.nist.gov/vuln/detail/CVE-2026-112318) | HIGH | `libkrb5support0` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-112319](https://nvd.nist.gov/vuln/detail/CVE-2026-112319) | HIGH | `libkrb5support0` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-112320](https://nvd.nist.gov/vuln/detail/CVE-2026-112320) | HIGH | `libkrb5support0` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-112321](https://nvd.nist.gov/vuln/detail/CVE-2026-112321) | HIGH | `libkrb5support0` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-112322](https://nvd.nist.gov/vuln/detail/CVE-2026-112322) | HIGH | `libkrb5support0` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-112323](https://nvd.nist.gov/vuln/detail/CVE-2026-112323) | HIGH | `libkrb5support0` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-118380](https://nvd.nist.gov/vuln/detail/CVE-2026-118380) | HIGH | `libkrb5support0` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-119079](https://nvd.nist.gov/vuln/detail/CVE-2026-119079) | HIGH | `libkrb5support0` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-71199](https://nvd.nist.gov/vuln/detail/CVE-2026-71199) | HIGH | `libkrb5support0` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-71200](https://nvd.nist.gov/vuln/detail/CVE-2026-71200) | HIGH | `libkrb5support0` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-76642](https://nvd.nist.gov/vuln/detail/CVE-2026-76642) | HIGH | `liblastlog2-2` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-78408](https://nvd.nist.gov/vuln/detail/CVE-2026-78408) | HIGH | `liblastlog2-2` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-78409](https://nvd.nist.gov/vuln/detail/CVE-2026-78409) | HIGH | `liblastlog2-2` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-78410](https://nvd.nist.gov/vuln/detail/CVE-2026-78410) | HIGH | `liblastlog2-2` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2023-2953](https://nvd.nist.gov/vuln/detail/CVE-2023-2953) | HIGH | `libldap-2.5-0` | unpatched · no fix | 15 images · v3.8, v4.2 |
| [CVE-2026-58221](https://nvd.nist.gov/vuln/detail/CVE-2026-58221) | HIGH | `libldb2` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-58222](https://nvd.nist.gov/vuln/detail/CVE-2026-58222) | HIGH | `libldb2` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-6949](https://nvd.nist.gov/vuln/detail/CVE-2026-6949) | HIGH | `libldb2` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-63277](https://nvd.nist.gov/vuln/detail/CVE-2026-63277) | HIGH | `liblibreoffice-java` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2019-16226](https://nvd.nist.gov/vuln/detail/CVE-2019-16226) | HIGH | `liblmdb0` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2019-16228](https://nvd.nist.gov/vuln/detail/CVE-2019-16228) | HIGH | `liblmdb0` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-119123](https://nvd.nist.gov/vuln/detail/CVE-2026-119123) | HIGH | `libmagickcore-6.q16-6` | unpatched · no fix | 6 images · v3.8, v4.2 |
| [CVE-2026-119123](https://nvd.nist.gov/vuln/detail/CVE-2026-119123) | HIGH | `libmagickcore-6.q16-6-extra` | unpatched · no fix | 6 images · v3.8, v4.2 |
| [CVE-2026-119123](https://nvd.nist.gov/vuln/detail/CVE-2026-119123) | HIGH | `libmagickcore-7.q16-10` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-119123](https://nvd.nist.gov/vuln/detail/CVE-2026-119123) | HIGH | `libmagickcore-7.q16-10-extra` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-119123](https://nvd.nist.gov/vuln/detail/CVE-2026-119123) | HIGH | `libmagickwand-6.q16-6` | unpatched · no fix | 6 images · v3.8, v4.2 |
| [CVE-2026-119123](https://nvd.nist.gov/vuln/detail/CVE-2026-119123) | HIGH | `libmagickwand-7.q16-10` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2025-7962](https://nvd.nist.gov/vuln/detail/CVE-2025-7962) | HIGH | `libmail-java` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-102523](https://nvd.nist.gov/vuln/detail/CVE-2026-102523) | HIGH | `libmariadb3` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-107815](https://nvd.nist.gov/vuln/detail/CVE-2026-107815) | HIGH | `libmariadb3` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-107818](https://nvd.nist.gov/vuln/detail/CVE-2026-107818) | HIGH | `libmariadb3` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-107823](https://nvd.nist.gov/vuln/detail/CVE-2026-107823) | HIGH | `libmariadb3` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-44168](https://nvd.nist.gov/vuln/detail/CVE-2026-44168) | HIGH | `libmariadb3` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-44171](https://nvd.nist.gov/vuln/detail/CVE-2026-44171) | HIGH | `libmariadb3` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-48163](https://nvd.nist.gov/vuln/detail/CVE-2026-48163) | HIGH | `libmariadb3` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-48165](https://nvd.nist.gov/vuln/detail/CVE-2026-48165) | HIGH | `libmariadb3` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-85746](https://nvd.nist.gov/vuln/detail/CVE-2026-85746) | HIGH | `libmariadb3` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-86047](https://nvd.nist.gov/vuln/detail/CVE-2026-86047) | HIGH | `libmariadb3` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-92262](https://nvd.nist.gov/vuln/detail/CVE-2026-92262) | HIGH | `libmariadb3` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-97380](https://nvd.nist.gov/vuln/detail/CVE-2026-97380) | HIGH | `libmariadb3` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2024-23775](https://nvd.nist.gov/vuln/detail/CVE-2024-23775) | HIGH | `libmbedcrypto7` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2025-48965](https://nvd.nist.gov/vuln/detail/CVE-2025-48965) | HIGH | `libmbedcrypto7` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2025-52496](https://nvd.nist.gov/vuln/detail/CVE-2025-52496) | HIGH | `libmbedcrypto7` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-25835](https://nvd.nist.gov/vuln/detail/CVE-2026-25835) | HIGH | `libmbedcrypto7` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-34872](https://nvd.nist.gov/vuln/detail/CVE-2026-34872) | HIGH | `libmbedcrypto7` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2023-45221](https://nvd.nist.gov/vuln/detail/CVE-2023-45221) | HIGH | `libmfx1` | unpatched · no fix | 2 images · v3.8 |
| [CVE-2026-53613](https://nvd.nist.gov/vuln/detail/CVE-2026-53613) | HIGH | `libmount1` | unpatched · no fix | 15 images · v3.8, v4.2 |
| [CVE-2026-53615](https://nvd.nist.gov/vuln/detail/CVE-2026-53615) | HIGH | `libmount1` | unpatched · no fix | 15 images · v3.8, v4.2 |
| [CVE-2026-76642](https://nvd.nist.gov/vuln/detail/CVE-2026-76642) | HIGH | `libmount1` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-78408](https://nvd.nist.gov/vuln/detail/CVE-2026-78408) | HIGH | `libmount1` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-78409](https://nvd.nist.gov/vuln/detail/CVE-2026-78409) | HIGH | `libmount1` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-78410](https://nvd.nist.gov/vuln/detail/CVE-2026-78410) | HIGH | `libmount1` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2025-69720](https://nvd.nist.gov/vuln/detail/CVE-2025-69720) | HIGH | `libncurses6` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2025-69720](https://nvd.nist.gov/vuln/detail/CVE-2025-69720) | HIGH | `libncursesw6` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-120432](https://nvd.nist.gov/vuln/detail/CVE-2026-120432) | HIGH | `libnetpbm11` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-120436](https://nvd.nist.gov/vuln/detail/CVE-2026-120436) | HIGH | `libnetpbm11` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-120432](https://nvd.nist.gov/vuln/detail/CVE-2026-120432) | HIGH | `libnetpbm11t64` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-120436](https://nvd.nist.gov/vuln/detail/CVE-2026-120436) | HIGH | `libnetpbm11t64` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-16742](https://nvd.nist.gov/vuln/detail/CVE-2026-16742) | HIGH | `libnss-systemd` | unpatched · no fix | 7 images · v3.8, v4.2, v5.2 |
| [CVE-2026-27489](https://nvd.nist.gov/vuln/detail/CVE-2026-27489) | HIGH | `libonnx1t64` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-49114](https://nvd.nist.gov/vuln/detail/CVE-2026-49114) | HIGH | `libonnx1t64` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2025-12495](https://nvd.nist.gov/vuln/detail/CVE-2025-12495) | HIGH | `libopenexr-3-1-30` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2025-12839](https://nvd.nist.gov/vuln/detail/CVE-2025-12839) | HIGH | `libopenexr-3-1-30` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2025-12840](https://nvd.nist.gov/vuln/detail/CVE-2025-12840) | HIGH | `libopenexr-3-1-30` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2025-64181](https://nvd.nist.gov/vuln/detail/CVE-2025-64181) | HIGH | `libopenexr-3-1-30` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-27622](https://nvd.nist.gov/vuln/detail/CVE-2026-27622) | HIGH | `libopenexr-3-1-30` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-34379](https://nvd.nist.gov/vuln/detail/CVE-2026-34379) | HIGH | `libopenexr-3-1-30` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-34543](https://nvd.nist.gov/vuln/detail/CVE-2026-34543) | HIGH | `libopenexr-3-1-30` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-34544](https://nvd.nist.gov/vuln/detail/CVE-2026-34544) | HIGH | `libopenexr-3-1-30` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-34545](https://nvd.nist.gov/vuln/detail/CVE-2026-34545) | HIGH | `libopenexr-3-1-30` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-34588](https://nvd.nist.gov/vuln/detail/CVE-2026-34588) | HIGH | `libopenexr-3-1-30` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-40244](https://nvd.nist.gov/vuln/detail/CVE-2026-40244) | HIGH | `libopenexr-3-1-30` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-40250](https://nvd.nist.gov/vuln/detail/CVE-2026-40250) | HIGH | `libopenexr-3-1-30` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-41142](https://nvd.nist.gov/vuln/detail/CVE-2026-41142) | HIGH | `libopenexr-3-1-30` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59184](https://nvd.nist.gov/vuln/detail/CVE-2026-59184) | HIGH | `libopenexr-3-1-30` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59186](https://nvd.nist.gov/vuln/detail/CVE-2026-59186) | HIGH | `libopenexr-3-1-30` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59187](https://nvd.nist.gov/vuln/detail/CVE-2026-59187) | HIGH | `libopenexr-3-1-30` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-59189](https://nvd.nist.gov/vuln/detail/CVE-2026-59189) | HIGH | `libopenexr-3-1-30` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59981](https://nvd.nist.gov/vuln/detail/CVE-2026-59981) | HIGH | `libopenexr-3-1-30` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59982](https://nvd.nist.gov/vuln/detail/CVE-2026-59982) | HIGH | `libopenexr-3-1-30` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-68515](https://nvd.nist.gov/vuln/detail/CVE-2026-68515) | HIGH | `libopenexr-3-1-30` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-16742](https://nvd.nist.gov/vuln/detail/CVE-2026-16742) | HIGH | `libpam-systemd` | unpatched · no fix | 7 images · v3.8, v4.2, v5.2 |
| [CVE-2026-9538](https://nvd.nist.gov/vuln/detail/CVE-2026-9538) | HIGH | `libperl5.36` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-9538](https://nvd.nist.gov/vuln/detail/CVE-2026-9538) | HIGH | `libperl5.40` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-5674](https://nvd.nist.gov/vuln/detail/CVE-2026-5674) | HIGH | `libpipewire-0.3-0t64` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-5674](https://nvd.nist.gov/vuln/detail/CVE-2026-5674) | HIGH | `libpipewire-0.3-common` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-58049](https://nvd.nist.gov/vuln/detail/CVE-2026-58049) | HIGH | `libpostproc58` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64830](https://nvd.nist.gov/vuln/detail/CVE-2026-64830) | HIGH | `libpostproc58` | unpatched · no fix | 4 images · v5.2 |
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
| [CVE-2026-75141](https://nvd.nist.gov/vuln/detail/CVE-2026-75141) | HIGH | `libpostproc58` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-75142](https://nvd.nist.gov/vuln/detail/CVE-2026-75142) | HIGH | `libpostproc58` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-75143](https://nvd.nist.gov/vuln/detail/CVE-2026-75143) | HIGH | `libpostproc58` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-75144](https://nvd.nist.gov/vuln/detail/CVE-2026-75144) | HIGH | `libpostproc58` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-75146](https://nvd.nist.gov/vuln/detail/CVE-2026-75146) | HIGH | `libpostproc58` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-11940](https://nvd.nist.gov/vuln/detail/CVE-2026-11940) | HIGH | `libpython3.11` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-7210](https://nvd.nist.gov/vuln/detail/CVE-2026-7210) | HIGH | `libpython3.11` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-11940](https://nvd.nist.gov/vuln/detail/CVE-2026-11940) | HIGH | `libpython3.11-minimal` | unpatched · no fix | 6 images · v3.8, v4.2 |
| [CVE-2026-7210](https://nvd.nist.gov/vuln/detail/CVE-2026-7210) | HIGH | `libpython3.11-minimal` | unpatched · no fix | 6 images · v3.8, v4.2 |
| [CVE-2026-11940](https://nvd.nist.gov/vuln/detail/CVE-2026-11940) | HIGH | `libpython3.11-stdlib` | unpatched · no fix | 6 images · v3.8, v4.2 |
| [CVE-2026-7210](https://nvd.nist.gov/vuln/detail/CVE-2026-7210) | HIGH | `libpython3.11-stdlib` | unpatched · no fix | 6 images · v3.8, v4.2 |
| [CVE-2026-15308](https://nvd.nist.gov/vuln/detail/CVE-2026-15308) | HIGH | `libpython3.13` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-19445](https://nvd.nist.gov/vuln/detail/CVE-2026-19445) | HIGH | `libpython3.13` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-19553](https://nvd.nist.gov/vuln/detail/CVE-2026-19553) | HIGH | `libpython3.13` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-7210](https://nvd.nist.gov/vuln/detail/CVE-2026-7210) | HIGH | `libpython3.13` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-82049](https://nvd.nist.gov/vuln/detail/CVE-2026-82049) | HIGH | `libpython3.13` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-15308](https://nvd.nist.gov/vuln/detail/CVE-2026-15308) | HIGH | `libpython3.13-minimal` | unpatched · no fix | 2 images · v5.2 |
| [CVE-2026-19445](https://nvd.nist.gov/vuln/detail/CVE-2026-19445) | HIGH | `libpython3.13-minimal` | unpatched · no fix | 2 images · v5.2 |
| [CVE-2026-19553](https://nvd.nist.gov/vuln/detail/CVE-2026-19553) | HIGH | `libpython3.13-minimal` | unpatched · no fix | 2 images · v5.2 |
| [CVE-2026-7210](https://nvd.nist.gov/vuln/detail/CVE-2026-7210) | HIGH | `libpython3.13-minimal` | unpatched · no fix | 2 images · v5.2 |
| [CVE-2026-82049](https://nvd.nist.gov/vuln/detail/CVE-2026-82049) | HIGH | `libpython3.13-minimal` | unpatched · no fix | 2 images · v5.2 |
| [CVE-2026-15308](https://nvd.nist.gov/vuln/detail/CVE-2026-15308) | HIGH | `libpython3.13-stdlib` | unpatched · no fix | 2 images · v5.2 |
| [CVE-2026-19445](https://nvd.nist.gov/vuln/detail/CVE-2026-19445) | HIGH | `libpython3.13-stdlib` | unpatched · no fix | 2 images · v5.2 |
| [CVE-2026-19553](https://nvd.nist.gov/vuln/detail/CVE-2026-19553) | HIGH | `libpython3.13-stdlib` | unpatched · no fix | 2 images · v5.2 |
| [CVE-2026-7210](https://nvd.nist.gov/vuln/detail/CVE-2026-7210) | HIGH | `libpython3.13-stdlib` | unpatched · no fix | 2 images · v5.2 |
| [CVE-2026-82049](https://nvd.nist.gov/vuln/detail/CVE-2026-82049) | HIGH | `libpython3.13-stdlib` | unpatched · no fix | 2 images · v5.2 |
| [CVE-2025-71436](https://nvd.nist.gov/vuln/detail/CVE-2025-71436) | HIGH | `libraptor2-0` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-63277](https://nvd.nist.gov/vuln/detail/CVE-2026-63277) | HIGH | `libreoffice` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-63277](https://nvd.nist.gov/vuln/detail/CVE-2026-63277) | HIGH | `libreoffice-base` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-63277](https://nvd.nist.gov/vuln/detail/CVE-2026-63277) | HIGH | `libreoffice-base-core` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-63277](https://nvd.nist.gov/vuln/detail/CVE-2026-63277) | HIGH | `libreoffice-base-drivers` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-63277](https://nvd.nist.gov/vuln/detail/CVE-2026-63277) | HIGH | `libreoffice-calc` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-63277](https://nvd.nist.gov/vuln/detail/CVE-2026-63277) | HIGH | `libreoffice-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-63277](https://nvd.nist.gov/vuln/detail/CVE-2026-63277) | HIGH | `libreoffice-core` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-63277](https://nvd.nist.gov/vuln/detail/CVE-2026-63277) | HIGH | `libreoffice-draw` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-63277](https://nvd.nist.gov/vuln/detail/CVE-2026-63277) | HIGH | `libreoffice-impress` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-63277](https://nvd.nist.gov/vuln/detail/CVE-2026-63277) | HIGH | `libreoffice-java-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-63277](https://nvd.nist.gov/vuln/detail/CVE-2026-63277) | HIGH | `libreoffice-math` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-63277](https://nvd.nist.gov/vuln/detail/CVE-2026-63277) | HIGH | `libreoffice-nlpsolver` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-63277](https://nvd.nist.gov/vuln/detail/CVE-2026-63277) | HIGH | `libreoffice-report-builder` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-63277](https://nvd.nist.gov/vuln/detail/CVE-2026-63277) | HIGH | `libreoffice-report-builder-bin` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-63277](https://nvd.nist.gov/vuln/detail/CVE-2026-63277) | HIGH | `libreoffice-script-provider-bsh` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-63277](https://nvd.nist.gov/vuln/detail/CVE-2026-63277) | HIGH | `libreoffice-script-provider-js` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-63277](https://nvd.nist.gov/vuln/detail/CVE-2026-63277) | HIGH | `libreoffice-script-provider-python` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-63277](https://nvd.nist.gov/vuln/detail/CVE-2026-63277) | HIGH | `libreoffice-sdbc-firebird` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-63277](https://nvd.nist.gov/vuln/detail/CVE-2026-63277) | HIGH | `libreoffice-sdbc-hsqldb` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-63277](https://nvd.nist.gov/vuln/detail/CVE-2026-63277) | HIGH | `libreoffice-sdbc-mysql` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-63277](https://nvd.nist.gov/vuln/detail/CVE-2026-63277) | HIGH | `libreoffice-sdbc-postgresql` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-63277](https://nvd.nist.gov/vuln/detail/CVE-2026-63277) | HIGH | `libreoffice-style-colibre` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-63277](https://nvd.nist.gov/vuln/detail/CVE-2026-63277) | HIGH | `libreoffice-wiki-publisher` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-63277](https://nvd.nist.gov/vuln/detail/CVE-2026-63277) | HIGH | `libreoffice-writer` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-96889](https://nvd.nist.gov/vuln/detail/CVE-2026-96889) | HIGH | `librsvg2-2` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-96889](https://nvd.nist.gov/vuln/detail/CVE-2026-96889) | HIGH | `librsvg2-common` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-53613](https://nvd.nist.gov/vuln/detail/CVE-2026-53613) | HIGH | `libsmartcols1` | unpatched · no fix | 15 images · v3.8, v4.2 |
| [CVE-2026-53615](https://nvd.nist.gov/vuln/detail/CVE-2026-53615) | HIGH | `libsmartcols1` | unpatched · no fix | 15 images · v3.8, v4.2 |
| [CVE-2026-76642](https://nvd.nist.gov/vuln/detail/CVE-2026-76642) | HIGH | `libsmartcols1` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-78408](https://nvd.nist.gov/vuln/detail/CVE-2026-78408) | HIGH | `libsmartcols1` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-78409](https://nvd.nist.gov/vuln/detail/CVE-2026-78409) | HIGH | `libsmartcols1` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-78410](https://nvd.nist.gov/vuln/detail/CVE-2026-78410) | HIGH | `libsmartcols1` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-58221](https://nvd.nist.gov/vuln/detail/CVE-2026-58221) | HIGH | `libsmbclient` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-58222](https://nvd.nist.gov/vuln/detail/CVE-2026-58222) | HIGH | `libsmbclient` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-6949](https://nvd.nist.gov/vuln/detail/CVE-2026-6949) | HIGH | `libsmbclient` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-37555](https://nvd.nist.gov/vuln/detail/CVE-2026-37555) | HIGH | `libsndfile1` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2025-11021](https://nvd.nist.gov/vuln/detail/CVE-2025-11021) | HIGH | `libsoup-3.0-0` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2025-14523](https://nvd.nist.gov/vuln/detail/CVE-2025-14523) | HIGH | `libsoup-3.0-0` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2025-32908](https://nvd.nist.gov/vuln/detail/CVE-2025-32908) | HIGH | `libsoup-3.0-0` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2025-32913](https://nvd.nist.gov/vuln/detail/CVE-2025-32913) | HIGH | `libsoup-3.0-0` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2025-4948](https://nvd.nist.gov/vuln/detail/CVE-2025-4948) | HIGH | `libsoup-3.0-0` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-0719](https://nvd.nist.gov/vuln/detail/CVE-2026-0719) | HIGH | `libsoup-3.0-0` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-102555](https://nvd.nist.gov/vuln/detail/CVE-2026-102555) | HIGH | `libsoup-3.0-0` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-102556](https://nvd.nist.gov/vuln/detail/CVE-2026-102556) | HIGH | `libsoup-3.0-0` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-102557](https://nvd.nist.gov/vuln/detail/CVE-2026-102557) | HIGH | `libsoup-3.0-0` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-102558](https://nvd.nist.gov/vuln/detail/CVE-2026-102558) | HIGH | `libsoup-3.0-0` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-102559](https://nvd.nist.gov/vuln/detail/CVE-2026-102559) | HIGH | `libsoup-3.0-0` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-1761](https://nvd.nist.gov/vuln/detail/CVE-2026-1761) | HIGH | `libsoup-3.0-0` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-2436](https://nvd.nist.gov/vuln/detail/CVE-2026-2436) | HIGH | `libsoup-3.0-0` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-3099](https://nvd.nist.gov/vuln/detail/CVE-2026-3099) | HIGH | `libsoup-3.0-0` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-4271](https://nvd.nist.gov/vuln/detail/CVE-2026-4271) | HIGH | `libsoup-3.0-0` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-5119](https://nvd.nist.gov/vuln/detail/CVE-2026-5119) | HIGH | `libsoup-3.0-0` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-66338](https://nvd.nist.gov/vuln/detail/CVE-2026-66338) | HIGH | `libsoup-3.0-0` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-85197](https://nvd.nist.gov/vuln/detail/CVE-2026-85197) | HIGH | `libsoup-3.0-0` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2025-11021](https://nvd.nist.gov/vuln/detail/CVE-2025-11021) | HIGH | `libsoup-3.0-common` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2025-14523](https://nvd.nist.gov/vuln/detail/CVE-2025-14523) | HIGH | `libsoup-3.0-common` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2025-32908](https://nvd.nist.gov/vuln/detail/CVE-2025-32908) | HIGH | `libsoup-3.0-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2025-32913](https://nvd.nist.gov/vuln/detail/CVE-2025-32913) | HIGH | `libsoup-3.0-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2025-4948](https://nvd.nist.gov/vuln/detail/CVE-2025-4948) | HIGH | `libsoup-3.0-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-0719](https://nvd.nist.gov/vuln/detail/CVE-2026-0719) | HIGH | `libsoup-3.0-common` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-102555](https://nvd.nist.gov/vuln/detail/CVE-2026-102555) | HIGH | `libsoup-3.0-common` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-102556](https://nvd.nist.gov/vuln/detail/CVE-2026-102556) | HIGH | `libsoup-3.0-common` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-102557](https://nvd.nist.gov/vuln/detail/CVE-2026-102557) | HIGH | `libsoup-3.0-common` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-102558](https://nvd.nist.gov/vuln/detail/CVE-2026-102558) | HIGH | `libsoup-3.0-common` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-102559](https://nvd.nist.gov/vuln/detail/CVE-2026-102559) | HIGH | `libsoup-3.0-common` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-1761](https://nvd.nist.gov/vuln/detail/CVE-2026-1761) | HIGH | `libsoup-3.0-common` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-2436](https://nvd.nist.gov/vuln/detail/CVE-2026-2436) | HIGH | `libsoup-3.0-common` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-3099](https://nvd.nist.gov/vuln/detail/CVE-2026-3099) | HIGH | `libsoup-3.0-common` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-4271](https://nvd.nist.gov/vuln/detail/CVE-2026-4271) | HIGH | `libsoup-3.0-common` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-5119](https://nvd.nist.gov/vuln/detail/CVE-2026-5119) | HIGH | `libsoup-3.0-common` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-66338](https://nvd.nist.gov/vuln/detail/CVE-2026-66338) | HIGH | `libsoup-3.0-common` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-85197](https://nvd.nist.gov/vuln/detail/CVE-2026-85197) | HIGH | `libsoup-3.0-common` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2025-14523](https://nvd.nist.gov/vuln/detail/CVE-2025-14523) | HIGH | `libsoup2.4-1` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2025-32906](https://nvd.nist.gov/vuln/detail/CVE-2025-32906) | HIGH | `libsoup2.4-1` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2025-32911](https://nvd.nist.gov/vuln/detail/CVE-2025-32911) | HIGH | `libsoup2.4-1` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2025-32913](https://nvd.nist.gov/vuln/detail/CVE-2025-32913) | HIGH | `libsoup2.4-1` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2025-4948](https://nvd.nist.gov/vuln/detail/CVE-2025-4948) | HIGH | `libsoup2.4-1` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-0719](https://nvd.nist.gov/vuln/detail/CVE-2026-0719) | HIGH | `libsoup2.4-1` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-102555](https://nvd.nist.gov/vuln/detail/CVE-2026-102555) | HIGH | `libsoup2.4-1` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-102556](https://nvd.nist.gov/vuln/detail/CVE-2026-102556) | HIGH | `libsoup2.4-1` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-102557](https://nvd.nist.gov/vuln/detail/CVE-2026-102557) | HIGH | `libsoup2.4-1` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-102558](https://nvd.nist.gov/vuln/detail/CVE-2026-102558) | HIGH | `libsoup2.4-1` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-102559](https://nvd.nist.gov/vuln/detail/CVE-2026-102559) | HIGH | `libsoup2.4-1` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-1761](https://nvd.nist.gov/vuln/detail/CVE-2026-1761) | HIGH | `libsoup2.4-1` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-2436](https://nvd.nist.gov/vuln/detail/CVE-2026-2436) | HIGH | `libsoup2.4-1` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-3099](https://nvd.nist.gov/vuln/detail/CVE-2026-3099) | HIGH | `libsoup2.4-1` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-4271](https://nvd.nist.gov/vuln/detail/CVE-2026-4271) | HIGH | `libsoup2.4-1` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-5119](https://nvd.nist.gov/vuln/detail/CVE-2026-5119) | HIGH | `libsoup2.4-1` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-66338](https://nvd.nist.gov/vuln/detail/CVE-2026-66338) | HIGH | `libsoup2.4-1` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2025-14523](https://nvd.nist.gov/vuln/detail/CVE-2025-14523) | HIGH | `libsoup2.4-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2025-32906](https://nvd.nist.gov/vuln/detail/CVE-2025-32906) | HIGH | `libsoup2.4-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2025-32911](https://nvd.nist.gov/vuln/detail/CVE-2025-32911) | HIGH | `libsoup2.4-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2025-32913](https://nvd.nist.gov/vuln/detail/CVE-2025-32913) | HIGH | `libsoup2.4-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2025-4948](https://nvd.nist.gov/vuln/detail/CVE-2025-4948) | HIGH | `libsoup2.4-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-0719](https://nvd.nist.gov/vuln/detail/CVE-2026-0719) | HIGH | `libsoup2.4-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-102555](https://nvd.nist.gov/vuln/detail/CVE-2026-102555) | HIGH | `libsoup2.4-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-102556](https://nvd.nist.gov/vuln/detail/CVE-2026-102556) | HIGH | `libsoup2.4-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-102557](https://nvd.nist.gov/vuln/detail/CVE-2026-102557) | HIGH | `libsoup2.4-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-102558](https://nvd.nist.gov/vuln/detail/CVE-2026-102558) | HIGH | `libsoup2.4-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-102559](https://nvd.nist.gov/vuln/detail/CVE-2026-102559) | HIGH | `libsoup2.4-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-1761](https://nvd.nist.gov/vuln/detail/CVE-2026-1761) | HIGH | `libsoup2.4-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-2436](https://nvd.nist.gov/vuln/detail/CVE-2026-2436) | HIGH | `libsoup2.4-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-3099](https://nvd.nist.gov/vuln/detail/CVE-2026-3099) | HIGH | `libsoup2.4-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-4271](https://nvd.nist.gov/vuln/detail/CVE-2026-4271) | HIGH | `libsoup2.4-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-5119](https://nvd.nist.gov/vuln/detail/CVE-2026-5119) | HIGH | `libsoup2.4-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-66338](https://nvd.nist.gov/vuln/detail/CVE-2026-66338) | HIGH | `libsoup2.4-common` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-5674](https://nvd.nist.gov/vuln/detail/CVE-2026-5674) | HIGH | `libspa-0.2-modules` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-11822](https://nvd.nist.gov/vuln/detail/CVE-2026-11822) | HIGH | `libsqlite3-0` | unpatched · no fix | 15 images · v3.8, v4.2 |
| [CVE-2026-11824](https://nvd.nist.gov/vuln/detail/CVE-2026-11824) | HIGH | `libsqlite3-0` | unpatched · no fix | 15 images · v3.8, v4.2 |
| [CVE-2026-119373](https://nvd.nist.gov/vuln/detail/CVE-2026-119373) | HIGH | `libsqlite3-0` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-119374](https://nvd.nist.gov/vuln/detail/CVE-2026-119374) | HIGH | `libsqlite3-0` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-119379](https://nvd.nist.gov/vuln/detail/CVE-2026-119379) | HIGH | `libsqlite3-0` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-58049](https://nvd.nist.gov/vuln/detail/CVE-2026-58049) | HIGH | `libswresample5` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64830](https://nvd.nist.gov/vuln/detail/CVE-2026-64830) | HIGH | `libswresample5` | unpatched · no fix | 4 images · v5.2 |
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
| [CVE-2026-75141](https://nvd.nist.gov/vuln/detail/CVE-2026-75141) | HIGH | `libswresample5` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-75142](https://nvd.nist.gov/vuln/detail/CVE-2026-75142) | HIGH | `libswresample5` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-75143](https://nvd.nist.gov/vuln/detail/CVE-2026-75143) | HIGH | `libswresample5` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-75144](https://nvd.nist.gov/vuln/detail/CVE-2026-75144) | HIGH | `libswresample5` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-75146](https://nvd.nist.gov/vuln/detail/CVE-2026-75146) | HIGH | `libswresample5` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-58049](https://nvd.nist.gov/vuln/detail/CVE-2026-58049) | HIGH | `libswscale8` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-64830](https://nvd.nist.gov/vuln/detail/CVE-2026-64830) | HIGH | `libswscale8` | unpatched · no fix | 4 images · v5.2 |
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
| [CVE-2026-75141](https://nvd.nist.gov/vuln/detail/CVE-2026-75141) | HIGH | `libswscale8` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-75142](https://nvd.nist.gov/vuln/detail/CVE-2026-75142) | HIGH | `libswscale8` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-75143](https://nvd.nist.gov/vuln/detail/CVE-2026-75143) | HIGH | `libswscale8` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-75144](https://nvd.nist.gov/vuln/detail/CVE-2026-75144) | HIGH | `libswscale8` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-75146](https://nvd.nist.gov/vuln/detail/CVE-2026-75146) | HIGH | `libswscale8` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-16742](https://nvd.nist.gov/vuln/detail/CVE-2026-16742) | HIGH | `libsystemd-shared` | unpatched · no fix | 7 images · v3.8, v4.2, v5.2 |
| [CVE-2026-16742](https://nvd.nist.gov/vuln/detail/CVE-2026-16742) | HIGH | `libsystemd0` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-73066](https://nvd.nist.gov/vuln/detail/CVE-2026-73066) | HIGH | `libtesseract5` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-88047](https://nvd.nist.gov/vuln/detail/CVE-2026-88047) | HIGH | `libtesseract5` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-88048](https://nvd.nist.gov/vuln/detail/CVE-2026-88048) | HIGH | `libtesseract5` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-88051](https://nvd.nist.gov/vuln/detail/CVE-2026-88051) | HIGH | `libtesseract5` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-88052](https://nvd.nist.gov/vuln/detail/CVE-2026-88052) | HIGH | `libtesseract5` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-88053](https://nvd.nist.gov/vuln/detail/CVE-2026-88053) | HIGH | `libtesseract5` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2023-52355](https://nvd.nist.gov/vuln/detail/CVE-2023-52355) | HIGH | `libtiff6` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-12912](https://nvd.nist.gov/vuln/detail/CVE-2026-12912) | HIGH | `libtiff6` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-36849](https://nvd.nist.gov/vuln/detail/CVE-2026-36849) | HIGH | `libtiff6` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-52490](https://nvd.nist.gov/vuln/detail/CVE-2026-52490) | HIGH | `libtiff6` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2025-69720](https://nvd.nist.gov/vuln/detail/CVE-2025-69720) | HIGH | `libtinfo6` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-16742](https://nvd.nist.gov/vuln/detail/CVE-2026-16742) | HIGH | `libudev1` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-32665](https://nvd.nist.gov/vuln/detail/CVE-2026-32665) | HIGH | `libunbound8` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-40622](https://nvd.nist.gov/vuln/detail/CVE-2026-40622) | HIGH | `libunbound8` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-40691](https://nvd.nist.gov/vuln/detail/CVE-2026-40691) | HIGH | `libunbound8` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-41292](https://nvd.nist.gov/vuln/detail/CVE-2026-41292) | HIGH | `libunbound8` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-42944](https://nvd.nist.gov/vuln/detail/CVE-2026-42944) | HIGH | `libunbound8` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-42959](https://nvd.nist.gov/vuln/detail/CVE-2026-42959) | HIGH | `libunbound8` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-44690](https://nvd.nist.gov/vuln/detail/CVE-2026-44690) | HIGH | `libunbound8` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-55973](https://nvd.nist.gov/vuln/detail/CVE-2026-55973) | HIGH | `libunbound8` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-80225](https://nvd.nist.gov/vuln/detail/CVE-2026-80225) | HIGH | `libunbound8` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-81634](https://nvd.nist.gov/vuln/detail/CVE-2026-81634) | HIGH | `libunbound8` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-85501](https://nvd.nist.gov/vuln/detail/CVE-2026-85501) | HIGH | `libunbound8` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-97206](https://nvd.nist.gov/vuln/detail/CVE-2026-97206) | HIGH | `libunbound8` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-63277](https://nvd.nist.gov/vuln/detail/CVE-2026-63277) | HIGH | `libuno-cppu3` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-63277](https://nvd.nist.gov/vuln/detail/CVE-2026-63277) | HIGH | `libuno-cppuhelpergcc3-3` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-63277](https://nvd.nist.gov/vuln/detail/CVE-2026-63277) | HIGH | `libuno-purpenvhelpergcc3-3` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-63277](https://nvd.nist.gov/vuln/detail/CVE-2026-63277) | HIGH | `libuno-sal3` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-63277](https://nvd.nist.gov/vuln/detail/CVE-2026-63277) | HIGH | `libuno-salhelpergcc3-3` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-63277](https://nvd.nist.gov/vuln/detail/CVE-2026-63277) | HIGH | `libunoloader-java` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-53613](https://nvd.nist.gov/vuln/detail/CVE-2026-53613) | HIGH | `libuuid1` | unpatched · no fix | 15 images · v3.8, v4.2 |
| [CVE-2026-53615](https://nvd.nist.gov/vuln/detail/CVE-2026-53615) | HIGH | `libuuid1` | unpatched · no fix | 15 images · v3.8, v4.2 |
| [CVE-2026-76642](https://nvd.nist.gov/vuln/detail/CVE-2026-76642) | HIGH | `libuuid1` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-78408](https://nvd.nist.gov/vuln/detail/CVE-2026-78408) | HIGH | `libuuid1` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-78409](https://nvd.nist.gov/vuln/detail/CVE-2026-78409) | HIGH | `libuuid1` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-78410](https://nvd.nist.gov/vuln/detail/CVE-2026-78410) | HIGH | `libuuid1` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-58221](https://nvd.nist.gov/vuln/detail/CVE-2026-58221) | HIGH | `libwbclient0` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-58222](https://nvd.nist.gov/vuln/detail/CVE-2026-58222) | HIGH | `libwbclient0` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-6949](https://nvd.nist.gov/vuln/detail/CVE-2026-6949) | HIGH | `libwbclient0` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-88806](https://nvd.nist.gov/vuln/detail/CVE-2026-88806) | HIGH | `libx11-6` | unpatched · no fix | 17 images · v3.8, v4.2, v5.2 |
| [CVE-2026-88806](https://nvd.nist.gov/vuln/detail/CVE-2026-88806) | HIGH | `libx11-data` | unpatched · no fix | 17 images · v3.8, v4.2, v5.2 |
| [CVE-2026-88806](https://nvd.nist.gov/vuln/detail/CVE-2026-88806) | HIGH | `libx11-xcb1` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-109089](https://nvd.nist.gov/vuln/detail/CVE-2026-109089) | HIGH | `libxi6` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-109090](https://nvd.nist.gov/vuln/detail/CVE-2026-109090) | HIGH | `libxi6` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-74860](https://nvd.nist.gov/vuln/detail/CVE-2026-74860) | HIGH | `libxml2` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-86138](https://nvd.nist.gov/vuln/detail/CVE-2026-86138) | HIGH | `libxml2` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-86139](https://nvd.nist.gov/vuln/detail/CVE-2026-86139) | HIGH | `libxml2` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-86140](https://nvd.nist.gov/vuln/detail/CVE-2026-86140) | HIGH | `libxml2` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-86142](https://nvd.nist.gov/vuln/detail/CVE-2026-86142) | HIGH | `libxml2` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-86143](https://nvd.nist.gov/vuln/detail/CVE-2026-86143) | HIGH | `libxml2` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-86144](https://nvd.nist.gov/vuln/detail/CVE-2026-86144) | HIGH | `libxml2` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-88807](https://nvd.nist.gov/vuln/detail/CVE-2026-88807) | HIGH | `libxrender1` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-94286](https://nvd.nist.gov/vuln/detail/CVE-2026-94286) | HIGH | `libxtst6` | unpatched · no fix | 7 images · v3.8, v4.2, v5.2 |
| [CVE-2026-76642](https://nvd.nist.gov/vuln/detail/CVE-2026-76642) | HIGH | `login` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-78408](https://nvd.nist.gov/vuln/detail/CVE-2026-78408) | HIGH | `login` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-78409](https://nvd.nist.gov/vuln/detail/CVE-2026-78409) | HIGH | `login` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-78410](https://nvd.nist.gov/vuln/detail/CVE-2026-78410) | HIGH | `login` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-102523](https://nvd.nist.gov/vuln/detail/CVE-2026-102523) | HIGH | `mariadb-common` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-107815](https://nvd.nist.gov/vuln/detail/CVE-2026-107815) | HIGH | `mariadb-common` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-107818](https://nvd.nist.gov/vuln/detail/CVE-2026-107818) | HIGH | `mariadb-common` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-107823](https://nvd.nist.gov/vuln/detail/CVE-2026-107823) | HIGH | `mariadb-common` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-44168](https://nvd.nist.gov/vuln/detail/CVE-2026-44168) | HIGH | `mariadb-common` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-44171](https://nvd.nist.gov/vuln/detail/CVE-2026-44171) | HIGH | `mariadb-common` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-48163](https://nvd.nist.gov/vuln/detail/CVE-2026-48163) | HIGH | `mariadb-common` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-48165](https://nvd.nist.gov/vuln/detail/CVE-2026-48165) | HIGH | `mariadb-common` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-85746](https://nvd.nist.gov/vuln/detail/CVE-2026-85746) | HIGH | `mariadb-common` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-86047](https://nvd.nist.gov/vuln/detail/CVE-2026-86047) | HIGH | `mariadb-common` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-92262](https://nvd.nist.gov/vuln/detail/CVE-2026-92262) | HIGH | `mariadb-common` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-97380](https://nvd.nist.gov/vuln/detail/CVE-2026-97380) | HIGH | `mariadb-common` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-53613](https://nvd.nist.gov/vuln/detail/CVE-2026-53613) | HIGH | `mount` | unpatched · no fix | 15 images · v3.8, v4.2 |
| [CVE-2026-53615](https://nvd.nist.gov/vuln/detail/CVE-2026-53615) | HIGH | `mount` | unpatched · no fix | 15 images · v3.8, v4.2 |
| [CVE-2026-76642](https://nvd.nist.gov/vuln/detail/CVE-2026-76642) | HIGH | `mount` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-78408](https://nvd.nist.gov/vuln/detail/CVE-2026-78408) | HIGH | `mount` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-78409](https://nvd.nist.gov/vuln/detail/CVE-2026-78409) | HIGH | `mount` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-78410](https://nvd.nist.gov/vuln/detail/CVE-2026-78410) | HIGH | `mount` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2025-69720](https://nvd.nist.gov/vuln/detail/CVE-2025-69720) | HIGH | `ncurses-base` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2025-69720](https://nvd.nist.gov/vuln/detail/CVE-2025-69720) | HIGH | `ncurses-bin` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-120432](https://nvd.nist.gov/vuln/detail/CVE-2026-120432) | HIGH | `netpbm` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-120436](https://nvd.nist.gov/vuln/detail/CVE-2026-120436) | HIGH | `netpbm` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-106553](https://nvd.nist.gov/vuln/detail/CVE-2026-106553) | HIGH | `openssh-client` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-106555](https://nvd.nist.gov/vuln/detail/CVE-2026-106555) | HIGH | `openssh-client` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-106583](https://nvd.nist.gov/vuln/detail/CVE-2026-106583) | HIGH | `openssh-client` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-59999](https://nvd.nist.gov/vuln/detail/CVE-2026-59999) | HIGH | `openssh-client` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-60000](https://nvd.nist.gov/vuln/detail/CVE-2026-60000) | HIGH | `openssh-client` | unpatched · no fix | 16 images · v3.8, v4.2, v5.2 |
| [CVE-2026-9538](https://nvd.nist.gov/vuln/detail/CVE-2026-9538) | HIGH | `perl` | unpatched · no fix | 17 images · v3.8, v4.2, v5.2 |
| [CVE-2026-9538](https://nvd.nist.gov/vuln/detail/CVE-2026-9538) | HIGH | `perl-base` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-9538](https://nvd.nist.gov/vuln/detail/CVE-2026-9538) | HIGH | `perl-modules-5.36` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-9538](https://nvd.nist.gov/vuln/detail/CVE-2026-9538) | HIGH | `perl-modules-5.40` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-23949](https://nvd.nist.gov/vuln/detail/CVE-2026-23949) | HIGH | `python3-pkg-resources` | unpatched · no fix | 1 image · v5.2 |
| [CVE-2026-63277](https://nvd.nist.gov/vuln/detail/CVE-2026-63277) | HIGH | `python3-uno` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-11940](https://nvd.nist.gov/vuln/detail/CVE-2026-11940) | HIGH | `python3.11` | unpatched · no fix | 6 images · v3.8, v4.2 |
| [CVE-2026-7210](https://nvd.nist.gov/vuln/detail/CVE-2026-7210) | HIGH | `python3.11` | unpatched · no fix | 6 images · v3.8, v4.2 |
| [CVE-2026-11940](https://nvd.nist.gov/vuln/detail/CVE-2026-11940) | HIGH | `python3.11-minimal` | unpatched · no fix | 6 images · v3.8, v4.2 |
| [CVE-2026-7210](https://nvd.nist.gov/vuln/detail/CVE-2026-7210) | HIGH | `python3.11-minimal` | unpatched · no fix | 6 images · v3.8, v4.2 |
| [CVE-2026-15308](https://nvd.nist.gov/vuln/detail/CVE-2026-15308) | HIGH | `python3.13` | unpatched · no fix | 2 images · v5.2 |
| [CVE-2026-19445](https://nvd.nist.gov/vuln/detail/CVE-2026-19445) | HIGH | `python3.13` | unpatched · no fix | 2 images · v5.2 |
| [CVE-2026-19553](https://nvd.nist.gov/vuln/detail/CVE-2026-19553) | HIGH | `python3.13` | unpatched · no fix | 2 images · v5.2 |
| [CVE-2026-7210](https://nvd.nist.gov/vuln/detail/CVE-2026-7210) | HIGH | `python3.13` | unpatched · no fix | 2 images · v5.2 |
| [CVE-2026-82049](https://nvd.nist.gov/vuln/detail/CVE-2026-82049) | HIGH | `python3.13` | unpatched · no fix | 2 images · v5.2 |
| [CVE-2026-15308](https://nvd.nist.gov/vuln/detail/CVE-2026-15308) | HIGH | `python3.13-minimal` | unpatched · no fix | 2 images · v5.2 |
| [CVE-2026-19445](https://nvd.nist.gov/vuln/detail/CVE-2026-19445) | HIGH | `python3.13-minimal` | unpatched · no fix | 2 images · v5.2 |
| [CVE-2026-19553](https://nvd.nist.gov/vuln/detail/CVE-2026-19553) | HIGH | `python3.13-minimal` | unpatched · no fix | 2 images · v5.2 |
| [CVE-2026-7210](https://nvd.nist.gov/vuln/detail/CVE-2026-7210) | HIGH | `python3.13-minimal` | unpatched · no fix | 2 images · v5.2 |
| [CVE-2026-82049](https://nvd.nist.gov/vuln/detail/CVE-2026-82049) | HIGH | `python3.13-minimal` | unpatched · no fix | 2 images · v5.2 |
| [CVE-2026-58221](https://nvd.nist.gov/vuln/detail/CVE-2026-58221) | HIGH | `samba-libs` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-58222](https://nvd.nist.gov/vuln/detail/CVE-2026-58222) | HIGH | `samba-libs` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-6949](https://nvd.nist.gov/vuln/detail/CVE-2026-6949) | HIGH | `samba-libs` | unpatched · no fix | 12 images · v3.8, v4.2 |
| [CVE-2026-16742](https://nvd.nist.gov/vuln/detail/CVE-2026-16742) | HIGH | `systemd` | unpatched · no fix | 7 images · v3.8, v4.2, v5.2 |
| [CVE-2026-16742](https://nvd.nist.gov/vuln/detail/CVE-2026-16742) | HIGH | `systemd-cryptsetup` | unpatched · no fix | 4 images · v5.2 |
| [CVE-2026-16742](https://nvd.nist.gov/vuln/detail/CVE-2026-16742) | HIGH | `systemd-sysv` | unpatched · no fix | 7 images · v3.8, v4.2, v5.2 |
| [CVE-2026-16742](https://nvd.nist.gov/vuln/detail/CVE-2026-16742) | HIGH | `systemd-timesyncd` | unpatched · no fix | 7 images · v3.8, v4.2, v5.2 |
| [CVE-2026-63277](https://nvd.nist.gov/vuln/detail/CVE-2026-63277) | HIGH | `uno-libs-private` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-63277](https://nvd.nist.gov/vuln/detail/CVE-2026-63277) | HIGH | `ure` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-63277](https://nvd.nist.gov/vuln/detail/CVE-2026-63277) | HIGH | `ure-java` | unpatched · no fix | 3 images · v3.8, v4.2 |
| [CVE-2026-53613](https://nvd.nist.gov/vuln/detail/CVE-2026-53613) | HIGH | `util-linux` | unpatched · no fix | 15 images · v3.8, v4.2 |
| [CVE-2026-53615](https://nvd.nist.gov/vuln/detail/CVE-2026-53615) | HIGH | `util-linux` | unpatched · no fix | 15 images · v3.8, v4.2 |
| [CVE-2026-76642](https://nvd.nist.gov/vuln/detail/CVE-2026-76642) | HIGH | `util-linux` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-78408](https://nvd.nist.gov/vuln/detail/CVE-2026-78408) | HIGH | `util-linux` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-78409](https://nvd.nist.gov/vuln/detail/CVE-2026-78409) | HIGH | `util-linux` | unpatched · no fix | 5 images · v5.2 |
| [CVE-2026-78410](https://nvd.nist.gov/vuln/detail/CVE-2026-78410) | HIGH | `util-linux` | unpatched · no fix | 20 images · v3.8, v4.2, v5.2 |
| [CVE-2026-53613](https://nvd.nist.gov/vuln/detail/CVE-2026-53613) | HIGH | `util-linux-extra` | unpatched · no fix | 15 images · v3.8, v4.2 |
| [CVE-2026-53615](https://nvd.nist.gov/vuln/detail/CVE-2026-53615) | HIGH | `util-linux-extra` | unpatched · no fix | 15 images · v3.8, v4.2 |
| [CVE-2026-78410](https://nvd.nist.gov/vuln/detail/CVE-2026-78410) | HIGH | `util-linux-extra` | unpatched · no fix | 15 images · v3.8, v4.2 |
| [CVE-2022-4055](https://nvd.nist.gov/vuln/detail/CVE-2022-4055) | HIGH | `xdg-utils` | unpatched · no fix | 4 images · v3.8, v4.2, v5.2 |
| [CVE-2026-76844](https://nvd.nist.gov/vuln/detail/CVE-2026-76844) | HIGH | `zlib1g` | unpatched · no fix | 15 images · v3.8, v4.2 |
| [CVE-2026-85091](https://nvd.nist.gov/vuln/detail/CVE-2026-85091) | HIGH | `zlib1g` | unpatched · no fix | 15 images · v3.8, v4.2 |
| [CVE-2026-76844](https://nvd.nist.gov/vuln/detail/CVE-2026-76844) | HIGH | `zlib1g-dev` | unpatched · no fix | 15 images · v3.8, v4.2 |
| [CVE-2026-85091](https://nvd.nist.gov/vuln/detail/CVE-2026-85091) | HIGH | `zlib1g-dev` | unpatched · no fix | 15 images · v3.8, v4.2 |


Full detail for the remaining severities: [MEDIUM](known-cves-medium.md) · [LOW and UNKNOWN](known-cves-low.md).
