<?php

/**
 * Implementation of hook_views_default_views().
 */
function a3_views_default_views() {
  module_load_include('inc', 'a3', 'a3.features.views');
  $args = func_get_args();
  return call_user_func_array('_a3_views_default_views', $args);
}
