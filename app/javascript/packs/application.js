import "bootstrap";
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { fadein } from '../components/fadein';
import "bootstrap-datepicker"
import "bootstrap-datepicker/dist/css/bootstrap-datepicker"
import { datepicker } from "../components/datepicker"
import { previewFile } from "../components/preview"
initUpdateNavbarOnScroll();
fadein();
datepicker();
previewFile();


