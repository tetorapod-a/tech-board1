$(function(){
  function buildHTML(comment){
    if ( comment.image ){
      var html =`<div class="side__form__comments__comment">
                    <div class="info">
                      <div class="info__name">
                        ${comment.user_name}
                      </div>
                      <div class="info__date">
                        ${comment.time}
                      </div>
                    </div>              
                    <div class="body">
                      <div class="body__text">
                        ${comment.text}
                      </div>
                      <div class="body__image">
                        <a data-lightbox="a" href="${comment.image}">a</a>
                        <img class="content__image" src="${comment.image}" width="150" height="150">                        
                      </div>
                    </div>
                  </div>`
      return html;
    } else {
      var html =`<div class="side__form__comments__comment">
                  <div class="info">
                    <div class="info__name">
                      ${comment.user_name}
                    </div>
                    <div class="info__date">
                      ${comment.time}
                    </div>
                  </div>            
                  <div class="body">
                    <div class="body__text">
                      ${comment.text}
                    </div>
                    <div class="body__image">
                    </div>
                  </div>
                </div>`
      return html;
    };
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.side__form__comments').append(html);
      $('.form__text').val('');
      $('.follow-btn').prop('disabled', false);
      $('.side__form__comments').animate({ scrollTop: $('.side__form__comments')[0].scrollHeight});
    })
    .fail(function(){
      alert('error');
    })
  })
});