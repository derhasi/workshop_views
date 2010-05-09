<?php

/**
 * Implementation of hook_views_default_views().
 */
function a1_views_default_views() {
  module_load_include('inc', 'a1', 'a1.features.views');
  $args = func_get_args();
  return call_user_func_array('_a1_views_default_views', $args);
}
