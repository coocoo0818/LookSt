/*! Tablesaw - v3.1.1 - 2019-03-15
* https://github.com/filamentgroup/tablesaw
* Copyright (c) 2019 Filament Group; Licensed MIT */
/*! Shoestring - v2.0.0 - 2017-02-14
* http://github.com/filamentgroup/shoestring/
* Copyright (c) 2017 Scott Jehl, Filament Group, Inc; Licensed MIT & GPLv2 */ 
$(window).on('load resize', function () {
  if ($(this).width() < 640) {
    $('table tfoot').hide();
  } else {
    $('table tfoot').show();
  }  
});

// See:
// http://www.sitepoint.com/responsive-data-tables-comprehensive-list-solutions