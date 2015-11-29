"use strict";
$(function(){
  addForm();
  previewForm();
});

function addForm() {
  $('li.plus').on('click', function() {
    $('li#hide').attr('id', "show");
    $(this).hide();
  });
};

function previewForm() {
  for(let i = 0; i <= 3; i++){
    $('#prototype_thumbnails_attributes_' + i + '_content').change(function(){
      if(!this.files.length){
        return;
      }else{
        let num = $(this).attr('id').charAt($(this).attr('id').search(/[0-9]/));
        let file = $(this).prop('files')[0];
        const fileReader = new FileReader();
        fileReader.onload = function(){
          $('.image' + num + '_preview' ).attr('src', fileReader.result).css('display', 'inline');
        }
        fileReader.readAsDataURL(file);
      };
    })
  }
}

