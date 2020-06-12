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


    


      // ここにオプションを書いていく
      $('#calendar').fullCalendar({
        

        eventMouseover: function(plan, jsEvent, view) { 
          if (view.name !== 'agendaDay') { 
          $(jsEvent.target).attr('title', plan.title); 
          } 
          // alert(plan.body1)
         }, 

        // イベントを落としたら
        eventDrop: function(plan, delta, revertFunc, jsEvent, ui, view) {
          // ドラッグ後の日付にデータ更新する
          moveSchedule(plan.id, plan.start.format('YYYY-MM-DD'), plan.end.format('YYYY-MM-DD'));
      },
      

      
        eventClick: function(Event, jsEvent, view) {
          // confirm キャンセルを表示
        var res = confirm('イベント名: ' + Event.name + '\n内容1: ' + Event.body1); 
        if (res == true){}
        else {
        
        }
        // change the border color just for fun
        $(this).css('border-color', 'red');
    },

        
        // クリック時に新規の予定を作成できるモーダル
        select: function(start, end) {
          var title = prompt("予定タイトル:");
          var eventData;
          if (title) {
              eventData = {
                      title: title,
                      start: start,
                      end: end
              };
              $('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
          }
          $('#calendar').fullCalendar('unselect');
      },
        // ダブルクリックで予定を消す。selectで作成したものに限る
        eventRender: function(calEvent, jsEvent, view) {
          (jsEvent).bind('dblclick', function() {
          if(!confirm('本当に削除しますか？')){
          return false;
          }else{
          $('#calendar').fullCalendar("removeEvents", calEvent._id);
          }
          });
          },


        height: 700,
        
        firstDay : 1,
        
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
        events: '/plans.json',
        
        
        
      });
    }
  });
});


