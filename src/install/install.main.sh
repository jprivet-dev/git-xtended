#!/usr/bin/env bash

function gx_install() {
  gx_install_activation
  gx_install_activation_show_status
  gx_install_commands_completion # TODO: maybe use "init" name instead
}
