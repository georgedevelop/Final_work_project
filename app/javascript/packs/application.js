// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

require("bootstrap")
require("jquery")
require("easy-autocomplete")
require("@nathanvda/cocoon")
require("bootstrap-datepicker")
require("moment/locale/ja")
require("tempusdominus-bootstrap-4")
require("flatpickr")
import flatpickr from "flatpickr";
import { Calendar } from '@fullcalendar/core';
import rrulePlugin from '@fullcalendar/rrule'
import interactionPlugin from '@fullcalendar/interaction';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import listPlugin from '@fullcalendar/list';

import "../stylesheets/application";

var ReactRailsUJS = require("react_ujs");
Rails.start()
Turbolinks.start()
ReactRailsUJS.detectEvents();
ActiveStorage.start()

require("packs/parts")
require("packs/vendors")
require("packs/roles")
require("packs/policies")
require("packs/part_orders")
// Add DataTables jQuery plugin
require('datatables.net-bs4')

import $ from 'jquery';
global.$ = jQuery;



document.addEventListener("turbolinks:load", () => {

  $('#table-work-orders').DataTable();

    flatpickr("[class='form-control flatpickr']", {
   	 	enableTime: true,
    	dateFormat: "Y-m-d H:i",
	})


    $('#quantity,#price').keyup(function () {
        var sum = 0;
         $('#total').val($('#quantity').val() * $('#price').val())
        
    })


	var calendarEl = document.getElementById('calendar');

  var calendar = new Calendar(calendarEl, {
    plugins: [ interactionPlugin, dayGridPlugin, timeGridPlugin, listPlugin, rrulePlugin ],
    headerToolbar: {
      left: 'prev,next today',
      center: 'title',
      right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
    },
    events: '/dashboard/work_order/events.json'
  });

  calendar.render();



	

})// Support component names relative to this directory:
var componentRequireContext = require.context("components", true);
var ReactRailsUJS = require("react_ujs");
ReactRailsUJS.useContext(componentRequireContext);
