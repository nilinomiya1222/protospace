$(function(){
  addForm();
  previewMainForm();
  previewSubForm();
});

function addForm() {
  $('li.plus').on('click', function() {
    $('li.hidden_form').removeClass('hidden_form');
    $(this).addClass('hidden_form');
  });
};

function previewMainForm() {
  $('#prototype_images_attributes_0_content').change(
      function() {
          if ( !this.files.length ) {
              return;
          }
          var file = $(this).prop('files')[0];
          var fr = new FileReader();
          fr.onload = function() {
              $('.main_image_preview').attr('src', fr.result ).css('display','inline');
          }
          fr.readAsDataURL(file);
      }
  );
};

function previewSubForm() {
  for(var i = 1; i <= 3; i++){
    $('#prototype_images_attributes_' + i + '_content').change(function(){
      if(!this.files.length){
        return;
      }
      var num = $(this).attr('id').charAt($(this).attr('id').search(/[1-9]/));
      var file = $(this).prop('files')[0];
      var fr = new FileReader();
      fr.onload = function(){
        $('.sub_image' + num + '_preview' ).attr('src', fr.result).css('display', 'inline');
      }
      fr.readAsDataURL(file);
    });
  }
}

