/**
 * Theme: Frogetor - Responsive Bootstrap 4 Admin Dashboard
 * Author: Mannatthemes
 * Datatables Js
 */


$(document).ready(function() {
  $('#datatable').DataTable({
    oLanguage: {
        oPaginate: {
            sFirst: "<i class='material-icons'>first_page</i>",
            sLast: "<i class='material-icons'>last_page</i>",
            sNext: "<i class='material-icons'>navigate_next</i>",
            sPrevious: "<i class='material-icons'>navigate_before</i>"
        }
    }
  });

  $(document).ready(function() {
      $('#datatable2').DataTable({
        oLanguage: {
            oPaginate: {
                sFirst: "<i class='material-icons'>first_page</i>",
                sLast: "<i class='material-icons'>last_page</i>",
                sNext: "<i class='material-icons'>navigate_next</i>",
                sPrevious: "<i class='material-icons'>navigate_before</i>"
            }
        }
      });
  } );

  //Buttons examples
  var table = $('#datatable-buttons').DataTable({
      lengthChange: false,
      oLanguage: {
        oPaginate: {
            sFirst: "<i class='material-icons'>first_page</i>",
            sLast: "<i class='material-icons'>last_page</i>",
            sNext: "<i class='material-icons'>navigate_next</i>",
            sPrevious: "<i class='material-icons'>navigate_before</i>"
        }
    },

      buttons: [
        {
            extend: 'copy',
            className: 'btn-sm btn-warning',
            exportOptions: {
                columns: [  ':visible' ]
            }
        },
        {
            extend: 'excel',
            className: 'btn-sm btn-warning',
            exportOptions: {
                columns: [  ':visible' ]
            }
        },
        {
            extend: 'pdf',
            className: 'btn-sm btn-warning',
            exportOptions: {
                columns: [  ':visible' ]
            }
        },
        {
            extend: 'colvis',
            className: 'btn-sm btn-warning',
            exportOptions: {
                columns: [  ':visible' ]
            }
        }]
  });
  $('.dataTables_filter input').addClass('border border-warning rounded-3');

  table.buttons().container()
      .appendTo('#datatable-buttons_wrapper .col-md-6:eq(0)');
} );
