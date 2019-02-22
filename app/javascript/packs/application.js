import "bootstrap";
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { fadein } from '../components/fadein';
import "bootstrap-datepicker"
import "bootstrap-datepicker/dist/css/bootstrap-datepicker"
import { datepicker } from "../components/datepicker"
import { previewFile } from "../components/preview"
import { modal } from "../components/modal.js.erb"
import { scrollIndex } from "../components/scrollindex.js.erb"
initUpdateNavbarOnScroll();
fadein();
datepicker();
previewFile();
modal();
scrollIndex();
