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
          let file = $(this).prop('files')[0];
          const FileReader = new FileReader();
          FileReader.onload = function() {
              $('.main_image_preview').attr('src', FileReader.result ).css('display','inline');
          }
          FileReader.readAsDataURL(file);
      }
  );
};

function previewSubForm() {
  for(let i = 1; i <= 3; i++){
    $('#prototype_images_attributes_' + i + '_content').change(function(){
      if(!this.files.length){
        return;
      }
      let num = $(this).attr('id').charAt($(this).attr('id').search(/[1-9]/));
      let file = $(this).prop('files')[0];
      const FileReader = new FileReader();
      FileReader.onload = function(){
        $('.sub_image' + num + '_preview' ).attr('src', FileReader.result).css('display', 'inline');
      }
      FileReader.readAsDataURL(file);
    });
  }
}

