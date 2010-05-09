<?php

/**
 * Implementation of hook_views_default_views().
 */
function m2_views_default_views() {
  module_load_include('inc', 'm2', 'm2.features.views');
  $args = func_get_args();
  return call_user_func_array('_m2_views_default_views', $args);
}
