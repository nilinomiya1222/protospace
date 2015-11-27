$(function(){
  addForm();
  previewMainForm();
  previewSubForm();
});

function addForm() {
  $('li.plus').on('click', function() {
    $('li#hidden_form').attr('id', "");
    $(this).attr('id', 'hidden_form');
  });
};

function previewMainForm() {
  "use strict"
  $('#prototype_images_attributes_0_content').change(
    function() {
      if ( !this.files.length ) {
          return;
      }else{
      let file = $(this).prop('files')[0];
      const FILEREADER = new FileReader();
        FILEREADER.onload = function() {
          $('.main_image_preview').attr('src', FILEREADER.result ).css('display','inline');
        }
      FILEREADER.readAsDataURL(file);
      }
    }
  );
};

function previewSubForm() {
  "use strict";
  for(let i = 1; i <= 3; i++){
    $('#prototype_images_attributes_' + i + '_content').change(function(){
      if(!this.files.length){
        return;
      }else{
        let num = $(this).attr('id').charAt($(this).attr('id').search(/[1-9]/));
        let file = $(this).prop('files')[0];
        const FILEREADER = new FileReader();
        FILEREADER.onload = function(){
          $('.sub_image' + num + '_preview' ).attr('src', FILEREADER.result).css('display', 'inline');
        }
        FILEREADER.readAsDataURL(file);
      };
    })
  }
}

