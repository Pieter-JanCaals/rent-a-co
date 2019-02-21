import "bootstrap";
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { fadein } from '../components/fadein';
import "bootstrap-datepicker"
import "bootstrap-datepicker/dist/css/bootstrap-datepicker"
initUpdateNavbarOnScroll();
fadein();
$('#booking_start_date').datepicker({
  format: 'dd/mm/yyyy',
    startDate: '-3d'
    });
$('#booking_end_date').datepicker({
  format: 'dd/mm/yyyy',
    startDate: '-3d'
    });

