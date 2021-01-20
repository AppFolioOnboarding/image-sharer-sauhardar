var deleteButtons = document.getElementsByClassName('button_to');
Array.from(deleteButtons).forEach(function(elem) {
  elem.addEventListener('submit', function(evt){
    evt.preventDefault();
    var deleteImage = confirm('Are you sure you want to delete this image?');
    if (deleteImage) {
      elem.submit();
    } 
  })
})
