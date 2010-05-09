<?php

/**
 * Implementation of hook_views_default_views().
 */
function s1_views_default_views() {
  module_load_include('inc', 's1', 's1.features.views');
  $args = func_get_args();
  return call_user_func_array('_s1_views_default_views', $args);
}
