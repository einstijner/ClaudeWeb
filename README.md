# ClaudeWeb

Leeward's website build playbook as a Claude skill. Once installed, Claude follows it whenever it builds
or reviews a website: the default stack, the four feels (premium, playful, simple, in-depth), the
hard rules, the anti-slop list, the reference sites and the ship checklist.

The skill itself is in [`skills/leeward-web/`](skills/leeward-web/SKILL.md).

## Install

**Claude Code** (once per computer; works in every project):

```
/plugin marketplace add einstijner/ClaudeWeb
/plugin install leeward-web@leeward
```

To pick up changes later: `/plugin marketplace update leeward`.

**claude.ai**: download `dist/leeward-web.zip` and upload it under Settings → Capabilities → Skills.
After changing the skill, run `./scripts/build-zip.sh` and upload the new zip.

## Files

| File | What it holds |
| --- | --- |
| `SKILL.md` | The build workflow Claude follows |
| `references/anti-slop.md` | Hard rules and what never ships |
| `references/taste.md` | The constants, the four feels, and notes on each reference site |
| `references/stack.md` | Default stack and project structure |
| `references/ship-checklist.md` | Checks before anything is called finished |
| `references/feedback-log.md` | Corrections from Leeward, newest first; these override everything else |

## Improving it

When Claude gets something wrong, say what and why. The correction goes into `feedback-log.md` as a rule
(and into the relevant file), so it doesn't need saying twice.

This repo has no Vercel project, so changes here never trigger a deployment.
