// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require jquery.turbolinks
//= require bootstrap-sprockets
//= require fancybox
//= require owl.carousel
//= require_tree .




$(document).ready(function() {

    var window_width = $( window ).resize(function() {
                          
                        });
 
	 $(".owl-carousel").owlCarousel({
	      singleItem:true,
	      autoPlay:true,
	      pagination:false,
          autoHeight: true
	 });

     $('.fancybox-thumbs').fancybox({
        prevEffect : 'none',
        nextEffect : 'none',

        closeBtn  : false,
        arrows    : false,
        nextClick : true,

        helpers : {
            thumbs : {
                width  : 50,
                height : 50
            }
        }
    });

});



// http://masonry.desandro.com/masonry.pkgd.js added as external resource
// https://rawgithub.com/desandro/classie/master/classie.js added


