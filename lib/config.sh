#!/bin/bash
#
# Shopify Config Lib
# Author: Troy McGinnis
# Company: Gearbox
# Updated: March 20, 2018
#

shopify::config::create()
{
  # $theme-id,$store,$password
  cog::params "$@" --required="theme-id store password"

  # Theme configure
  theme configure --themeid="$theme_id" --store="$store" --password="$password"

  if [[ ! $? -eq 0 ]]; then
    error "Failed to configure your Shopify store."
  fi
}

shopify::config::find_or_create()
{
  # [$dir]
  cog::params "$@" --optional="dir"
  local dir; dir=${dir:-$( pwd )}

  # Check for existing config.yml
  if [[ ! -f "${dir}/config.yml" ]]; then
    message "Creating new ${YELLOW}config.yml ${BLUE}file"
    cog::params_require "theme-id store password" "dir"
    shopify::config::create "$@"
  else
    message "Using existing ${YELLOW}config.yml ${BLUE}file"
  fi
}