$(function(){

  $('#ajax_btn').on('click', function(){
    $.ajax('/refresh', {
      success: function(data){
        console.log('Success');
        console.log('Data: ' + data.data);
      },
      error: function(data, err){
        console.log('Error: ' + err);
      },
      dataType: 'json',
      data: { 'post_id' : $('#refresh_post').val() }
    });
  });

  $('#seekers_ajax_btn').on('click', function(){
    $.ajax('/refresh_seekers', {
      success: function(data){
        console.log('Success');
        console.log('Data: ' + data.data);
      },
      error: function(data, err){
        console.log('Error: ' + err);
      },
      dataType: 'json',
      data: { 'post_id' : $('#refresh_post').val() }
    });
  });

});
