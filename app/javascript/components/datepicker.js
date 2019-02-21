const datepicker = () => {
  $('#booking_start_date').datepicker({
    format: 'dd/mm/yyyy',
      startDate: '-3d'
      });
  $('#booking_end_date').datepicker({
    format: 'dd/mm/yyyy',
      startDate: '-3d'
      });
};
export {datepicker}
