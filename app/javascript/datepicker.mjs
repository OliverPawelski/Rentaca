$(document).ready(function () {
  $('.datepicker').datepicker({
    dateFormat: 'dd-mm-yy',
    onSelect: function (dateText, inst) {
      updateTotal();
    }
  });
});
