// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require fancybox

$(document).ready(function() {
	$('a[title]').qtip({
					position: {
						my: 'top-left',
						at: 'center'
					},
					style: {
						classes: 'ui-tooltip-shadow ui-tooltip-light'
					}
				});
				
	$("a.group").fancybox({
					'transitionIn'		: 'none',
					'transitionOut'		: 'none',
					'titlePosition' 	: 'outside',
					'titleFormat'		: function(title, currentArray, currentIndex, currentOpts) {
						return '<span id="fancybox-title-over">' + title + '</span>';
					}
				});
	$("#new_collection").formToWizard();
				
});

