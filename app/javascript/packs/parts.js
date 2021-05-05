document.addEventListener("turbolinks:load", function() {
  var mfr_options = {
  	url: function(phrase) {
      console.log('test test')
      return "/dashboard/part/search.json?mfr_number=" + phrase;
    },
    getValue: "mfr_number"
  };

  var barcode_options = {
  	url: function(phrase) {
      return "/dashboard/part/search.json?q=" + phrase;
    },
    getValue: "barcode"
  };

  var machine_options = {
  	url: function(phrase) {
      return "/dashboard/part/search.json?machine=" + phrase;
    },
    getValue: "machine"
  };

  var location_options = {
  	url: function(phrase) {
      return "/dashboard/part/search.json?location=" + phrase;
    },
    getValue: "location"
  };

  $('*[data-behavior="autocomplete"]').easyAutocomplete(mfr_options);
  $('*[data-behavior="autocomplete-barcode"]').easyAutocomplete(barcode_options);
  $('*[data-behavior="autocomplete-machine"]').easyAutocomplete(machine_options);
  $('*[data-behavior="autocomplete-location"]').easyAutocomplete(location_options);
});