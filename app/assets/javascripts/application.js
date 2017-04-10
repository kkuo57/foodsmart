// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).on('ready', function() {
  console.log('1')
  getFood();

  function getFood(){
    console.log('2')
    $.ajax({
      method: "POST",
      url: "https://api.foodfacts.com/ci/api/foodfacts/food_products_per_search_term/",
      data: {login: 'bbobberson12@gmail.com',
        password: '$5074Foo',
        search_term: 'broccoli',
        per_page: 1,
        page: 1,
        sort_by: '_score:desc'
        },
      success: onSuccess,
      error: onError
    });
  }

  function onSuccess(json) {
    console.log('3')
    console.log(json);
    $(".results").append()
  }

  function onError(xhr, status, errorThrown) {
    console.log('4')
    console.log("Error: " + errorThrown);
    console.log("Status: " + status);
    console.dir(xhr);
  }
});
