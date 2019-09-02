require("loadcss");
require("@rails/ujs").start();
require("local-time").start();
require("turbolinks").start();

window.Rails = Rails;

// import CSS
import "stylesheets/application.scss";

// import Stimulus controllers
import "controllers/index";

// import vendor JS
import "bootstrap";

// import images
const importAll = r => r.keys().map(r);
importAll(require.context("../images", false, /\.(png|jpe?g|svg)$/));
