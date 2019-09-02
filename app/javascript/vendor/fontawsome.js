import { library, dom } from "@fortawesome/fontawesome-svg-core";
import { faThumbsUp, faThumbsDown } from "@fortawesome/free-regular-svg-icons";

// import { faFontAwesome } from "@fortawesome/free-brands-svg-icons";

// import { faStar as fasFaStar } from "@fortawesome/free-solid-svg-icons";

library.add(faThumbsUp, faThumbsDown);

dom.watch({ observeMutationsRoot: document });
