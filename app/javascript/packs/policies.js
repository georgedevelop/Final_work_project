document.addEventListener("turbolinks:load", function() {
  var options = {
  	url: function(phrase) {
      return "/dashboard/policy/search.json?q=" + phrase;
    },
    getValue: "name"
  };

  $('*[data-behavior="autocomplete-policies"]').easyAutocomplete(options);
});