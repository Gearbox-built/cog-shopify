#!/bin/bash
#
# Shopify Requirements Module
# Author: Troy McGinnis
# Company: Gearbox
# Updated: March 20, 2018
#

shopify::requirements() {
  local requirements; requirements=(theme)

  for i in "${requirements[@]}"; do
    cog::check_requirement "${i}"
  done
}