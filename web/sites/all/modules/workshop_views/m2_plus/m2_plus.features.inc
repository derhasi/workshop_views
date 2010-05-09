<?php

/**
 * Implementation of hook_views_default_views().
 */
function m2_plus_views_default_views() {
  module_load_include('inc', 'm2_plus', 'm2_plus.features.views');
  $args = func_get_args();
  return call_user_func_array('_m2_plus_views_default_views', $args);
}
