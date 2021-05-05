document.addEventListener("turbolinks:load", function() {

  var options = {
  	url: function(phrase) {
      return "/dashboard/vendor/search.json?q=" + phrase;
    },
    getValue: "name"
  };

  var options = {
  	url: function(phrase) {
      return "/dashboard/part_order/search_vendor.json?q=" + phrase;
    },
    getValue: function(element) {
        return element.code;
    },
    list: {
        onSelectItemEvent: function() {
        	var name = $("#vendor_code").getSelectedItemData().name;
        	var contact_person = $("#vendor_code").getSelectedItemData().contact_person;
        	var address = $("#vendor_code").getSelectedItemData().address;
          var phone_number = $("#vendor_code").getSelectedItemData().phone_number;
          var email_address = $("#vendor_code").getSelectedItemData().email_address;
            $("#vendor_contact_person").val(contact_person);
            $("#vendor_address").val(address);
            $('#vendor_phone_number').val(phone_number);
            $("#vendor_email_address").val(email_address);
            $("#vendor_name").val(name);
        }
    }
  };

  $('*[data-behavior="autocomplete-vendors"]').easyAutocomplete(options);
});