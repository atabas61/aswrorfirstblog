$(".ckeditor").each(function(){
    var itemID = $(this).attr('id');
    CKEDITOR.replace( itemID );
}); 