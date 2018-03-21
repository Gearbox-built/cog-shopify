#!/bin/bash
#
# Cog Shopify Module
# Author: Troy McGinnis
# Company: Gearbox
# Updated: March 20, 2018
#
#
# HISTORY:
#
# * 2018-03-20 - v0.0.1 - First Creation
#
# ##################################################
#
if [[ ! "${#BASH_SOURCE[@]}" -gt 0 ]] || [[ "${BASH_SOURCE[${#BASH_SOURCE[@]}-1]##*/}" != 'cog.sh' ]]; then
  echo 'Module must be executed through cog.'
  return || exit
fi
#
cog::source_lib
#

shopify::setup_dev()
{
  # [$dir],[$theme-id],[$store],[$password]
  cog::params "$@" --optional="dir theme-id store password"
  shopify::config::find_or_create "$@"
}


#
# Module main
# --------------------------------------------------

shopify::main() {
  shopify::requirements
  local module; module=$( basename "$( dirname "${BASH_SOURCE[0]}")")

  case "$1" in
    setup-dev)
      shopify::setup_dev "${@:2}"
      ;;
    config)
      shopify::config::create "${@:2}"
      ;;
    *)
      usage "cog shopify" "install,clone"
      cog::exit
      ;;
  esac
}