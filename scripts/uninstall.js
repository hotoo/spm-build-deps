#!/usr/bin/env node

try {
  require('spm').plugin.uninstall('gettext');
} catch(e) {}
