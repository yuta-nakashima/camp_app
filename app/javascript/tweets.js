if (document.URL.match( /new/ ) || document.URL.match( /edit/ )){

  /* メンバー写真 */
  document.addEventListener("DOMContentLoaded",function(){
    const ImageList = document.getElementById("image-list");
    document.getElementById("image").addEventListener("change",function(e){
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      const imageElement = document.createElement("div")
      const blobImage = document.createElement("img");
      blobImage.setAttribute("src", blob);
      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
    });
  });

  /* アイテム写真 */

  document.addEventListener("DOMContentLoaded",function(){
    const ImageItem = document.getElementById("image-item");
    document.getElementById("item-photo").addEventListener("change",function(e){
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      const imageElement = document.createElement("div");
      const blobImage = document.createElement("img");
      blobImage.setAttribute("src",blob);
      imageElement.appendChild(blobImage);
      ImageItem.appendChild(imageElement);
    });
  });

  /** 思い出写真 */
  //**document.addEventListener("DOMContentLoad",function(){
    //**const ImageBox = document.getElementById("image-box");
    //**document.getElementById("image-box").addEventListener("change",function(e){
      //**const file = e.target.files[0];
      //**const blob = window.URL.createObjectURL(file);
      //**const imageElement = document.createElement("div");
      //**const blobImage = document.createElement("img");
      //**blobImage.setAttribute("src",blob);
      //**imageElement.appendChild(blobImage);
      //**ImageBox.appendChild(imageElement);
    //**});
  //**});


}