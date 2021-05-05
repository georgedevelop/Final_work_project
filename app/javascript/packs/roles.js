document.addEventListener("turbolinks:load", function() {

  var options = {
  	url: function(phrase) {
      return "/dashboard/role/search.json?q=" + phrase;
    },
    getValue: "name"
  };

  $('*[data-behavior="autocomplete-roles"]').easyAutocomplete(options);
});