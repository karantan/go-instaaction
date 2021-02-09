# go-instaaction ![gha build](https://github.com/karantan/go-instaaction/workflows/Go/badge.svg)
Minimalistic example of a CLI golang app building &amp; releasing with GHA

Whenever you create a new Tag the `GoReleaser` GitHub Action will trigger which will
build this program and upload the executable binarys (for darwin and linux) under Assets.

It will also add a release description with the "Changelog".
