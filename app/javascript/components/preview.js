function previewFile() {
  const fileUploadInput = document.querySelector("#animal_photo");

  if (fileUploadInput != null) {
    fileUploadInput.addEventListener("change", () => {
      var preview = document.querySelector('#img-preview');
      var file    = fileUploadInput.files[0];
      var reader  = new FileReader();

      // debugger;

      reader.addEventListener("load", function () {
        preview.src = reader.result;
      }, false);

      if (file) {
        reader.readAsDataURL(file);
      }
    });
  }

}

export { previewFile };
