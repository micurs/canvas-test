import { Elm } from "./elm/Main.elm";
import * as ElmCanvas from "elm-canvas";

const app = Elm.Main.init({
  node: document.getElementById("elm-main")
});

// Enable hot reloading :)
if (module.hot) {
  module.hot.accept();
}
