
//= require jquery
  //= require bootstrap-sprockets
  //= require jquery_ujs
  //= require turbolinks
  //= require_tree .
'use strict'


jQuery('.close').click(closeForm);
function closeForm(e) {
  const targ = e.target;
const parent = targ.parent();
parent.css('display', 'none');
}

jQuery('.dish>button').click(openForm)
function openForm(e) {
  const form = jQuery('formForCountPerson');
form.css('display', 'block');
}