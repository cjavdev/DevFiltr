
function addClass(element_id, classname) {
  //document.getElementById(element_id).className += (" " + classname);
}

function removeClass(element_id, classname) {
  //var elem = document.getElementById(element_id);
  //var classlist = elem.className.replace(classname,'');
  //elem.className = classlist;
}

function moveProgressBar(percentDone) {
  //document.getElementById("rspec-header").style.width = percentDone +"%";
}

function makeRed(element_id) {
  removeClass(element_id, 'passed');
  removeClass(element_id, 'not_implemented');
  addClass(element_id,'failed');
}

function makeYellow(element_id) {
  var elem = document.getElementById(element_id);
  if (elem.className.indexOf("failed") == -1) {  // class doesn't includes failed
    if (elem.className.indexOf("not_implemented") == -1) { // class doesn't include not_implemented
      removeClass(element_id, 'passed');
      addClass(element_id,'not_implemented');
    }
  }
}

function apply_filters() {
  var passed_filter = document.getElementById('passed_checkbox').checked;
  var failed_filter = document.getElementById('failed_checkbox').checked;
  var pending_filter = document.getElementById('pending_checkbox').checked;

  assign_display_style("example passed", passed_filter);
  assign_display_style("example failed", failed_filter);
  assign_display_style("example not_implemented", pending_filter);

  assign_display_style_for_group("example_group passed", passed_filter);
  assign_display_style_for_group("example_group not_implemented", pending_filter, pending_filter || passed_filter);
  assign_display_style_for_group("example_group failed", failed_filter, failed_filter || pending_filter || passed_filter);
}

function get_display_style(display_flag) {
  var style_mode = 'none';
  if (display_flag == true) {
    style_mode = 'block';
  }
  return style_mode;
}

function assign_display_style(classname, display_flag) {
  var style_mode = get_display_style(display_flag);
  var elems = document.getElementsByClassName(classname)
  for (var i=0; i<elems.length;i++) {
    elems[i].style.display = style_mode;
  }
}

function assign_display_style_for_group(classname, display_flag, subgroup_flag) {
  var display_style_mode = get_display_style(display_flag);
  var subgroup_style_mode = get_display_style(subgroup_flag);
  var elems = document.getElementsByClassName(classname)
  for (var i=0; i<elems.length;i++) {
    var style_mode = display_style_mode;
    if ((display_flag != subgroup_flag) && (elems[i].getElementsByTagName('dt')[0].innerHTML.indexOf(", ") != -1)) {
      elems[i].style.display = subgroup_style_mode;
    } else {
      elems[i].style.display = display_style_mode;
    }
  }
}