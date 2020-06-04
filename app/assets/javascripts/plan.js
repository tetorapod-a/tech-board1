$(function () {
  $(document).on('turbolinks:load', function () {
    if ($('#calendar').length) {
      function eventCalendar() {
        return $('#calendar').fullCalendar({});
      };
      function clearCalendar() {
        $('#calendar').html('');
      };
      $(document).on('turbolinks:load', function () {
        eventCalendar();
      });
      $(document).on('turbolinks:before-cache', clearCalendar);

      // ここからコピペ（なくても動く）
      $('#external-events .fc-event').each(function() {

        // store data so the calendar knows to render an event upon drop
        $(this).data('event', {
            title: $.trim($(this).text()), // use the element's text as the event title
            stick: true // maintain when user navigates (see docs on the renderEvent method)
        });

        // make the event draggable using jQuery UI
        $(this).draggable({
            zIndex: 999,
            revert: true,      // will cause the event to go back to its
            revertDuration: 0  //  original position after the drag
        });

    });
    // ここまでコピペ



      $('#calendar').fullCalendar({
        // ここにオプションを書いていく
        height: 700,
        
        firstDay : 1,
        events: '/plans.json',
        header: {
          left: 'prev,next today',
          center: 'title',
          right: 'month'
        },
        titleFormat: 'YYYY年の M月だよ',
        dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
        editable: true,
        selectable: true,
        selectHelper: true,
        eventsLimit: true,
        droppable: true,
        dragRevertDuration: 0,
        backgroundColor: '#E1E3E4',
        

        
      });
    }
  });
});


