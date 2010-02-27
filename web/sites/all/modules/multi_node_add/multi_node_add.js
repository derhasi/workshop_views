// $Id: multi_node_add.js,v 1.1 2009/12/18 16:57:20 aronnovak Exp $

function multi_node_add_fields() {
  var fields = new Array();
  $("input.multi-node-add").each(function (i) {
    if ($(this).attr('checked')) {
      fields.push($(this).attr('value'));
    }
  });
  return fields.join(',');
}

var multi_node_add_NumNode = 0;

function multi_node_add_show_forms(numForms) {
    for (var i = 0; i < numForms; i++) {
        $("#multi_node_add_frames").append('<div><iframe class="autoHeight" width="100%" name="node_'+ (multi_node_add_NumNode++) +'" src="'+Drupal.settings.multi_node_add.callback+ '/'+multi_node_add_fields()+'"></iframe></div>');
    }
    multi_node_add_doIframe();
}


Drupal.behaviors.multi_node_add = function () {

  $('#edit-create').hide(0);
  $('#edit-addmore').hide(0);

  $('#edit-show').click(function () {
    multi_node_add_show_forms($("#edit-number").val());
    $(this).hide(0);
    $('#edit-create').show(0);
    $('#edit-addmore').show(0);
    return false;
  });

  $('#edit-addmore').click(function () {
    multi_node_add_show_forms(2);
    return false;
  });

  $('#edit-create').click(function () {
    for (var i = 0; i < multi_node_add_NumNode; i++) {
      try {
        window.frames['node_'+i].document.forms['nodeform'].submit();
      } catch (err) {} // not an error, maybe submitted w/ the single Create button
    }
    $(this).hide(0);
    $('#edit-addmore').hide(0);
    return false;
  });


}

/* From jquery plugin: autoHeight */

function multi_node_add_addEvent(obj, evType, fn){
  if (obj.addEventListener) {
    obj.addEventListener(evType, fn,false);
    return true;
  } else if (obj.attachEvent){
     var r = obj.attachEvent("on"+evType, fn);
     return r;
  } else {
    return false;
  }
}

function multi_node_add_doIframe(){
  o = document.getElementsByTagName('iframe');
  for (i=0;i<o.length;i++){
    if (/\bautoHeight\b/.test(o[i].className)){
      multi_node_add_setHeight(o[i]);
      multi_node_add_addEvent(o[i],'load', multi_node_add_doIframe);
    }
  }
}

function multi_node_add_setHeight(e){
  if (e.contentDocument){
    e.height = e.contentDocument.body.offsetHeight + 35;
  } else {
    e.height = e.contentWindow.document.body.scrollHeight;
  }
}
