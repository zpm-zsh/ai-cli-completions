#!/usr/bin/env zsh

# Standarized ZSH polyfills, following:
# https://z-shell.github.io/zsh-plugin-assessor/Zsh-Plugin-Standard
0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

if [[ $PMSPEC != *f* ]] {
  fpath+=( "${0:h}/functions" )
}

if [[ $PMSPEC != *b* ]] {
  PATH=$PATH:"${0:h}/bin"
}
