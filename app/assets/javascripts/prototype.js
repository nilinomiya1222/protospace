$(function(){
  addForm();
  previewMainForm();
  previewNewSubForm();
  previewEditSubForm();
});

function addForm() {
  $('li.plus').on('click', function() {
    $('li.hidden_form').removeClass('hidden_form');
    $(this).addClass('hidden_form');
  });
};

function previewMainForm() {
  $('#prototype_images_attributes_0_main').change(
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

function previewNewSubForm() {
  for(var i = 0; i <= 2; i++){
    $('#prototype_images_attributes_0_sub'+ i).change(function(){
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

function previewEditSubForm() {
  for(var i = 0; i <= 2; i++){
    $('#prototype_images_attributes_'+i+'_sub').change(function(){
      if(!this.files.length){
        return;
      }
      var num = $(this).attr('id').charAt($(this).attr('id').search(/[0-9]/));
      var file = $(this).prop('files')[0];
      var fr = new FileReader();
      fr.onload = function(){
        $('.sub_image' + num + '_preview' ).attr('src', fr.result).css('display', 'inline');
      }
      fr.readAsDataURL(file);
    });
  }
}

