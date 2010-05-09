<?php

/**
 * Implementation of hook_views_default_views().
 */
function m1_views_default_views() {
  module_load_include('inc', 'm1', 'm1.features.views');
  $args = func_get_args();
  return call_user_func_array('_m1_views_default_views', $args);
}
