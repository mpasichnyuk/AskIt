// Entry point for the build script in your package.json

//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require popper
//= require turbolinks
//= require bootstrap-sprockets
//= require bootstrap
//= require_tree .

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import "bootstrap"
import * as ActiveStorage from "@rails/activestorage";
import "./channels";

// import 'bootstrap/js/dist/dropdown'
// import '@popperjs/core'

Rails.start();
Turbolinks.start();
ActiveStorage.start();
