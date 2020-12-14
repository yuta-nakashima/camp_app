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

  document.addEventListener("DOMContentLoaded",function(){
    const ImageBox = document.getElementById("image-box");
    
    const createImageHTML = (blob) =>{
      const imageElement = document.createElement("div")
      imageElement.setAttribute("class","image-element")
      let imageElementNum = document.querySelectorAll(".image-element").length
      const blobImage = document.createElement("img")
      blobImage.setAttribute("src",blob)
      const inputHTML = document.createElement("input")
      inputHTML.setAttribute("id", "tweet_image_${imageElementNum}")
      inputHTML.setAttribute("name", "tweet[memory_image][]")
      inputHTML.setAttribute("type", "file")

      imageElement.appendChild(blobImage)
      imageElement.appendChild(inputHTML)
      ImageBox.appendChild(imageElement)

      inputHTML.addEventListener("change", (e) => {
        file = e.target.files[0];
        blob = window.URL.createObjectURL(file);

        createImageHTML(blob)
      })
    }

    document.getElementById("tweet_image").addEventListener("change", (e) =>{
      let file = e.target.files[0];
      let blob = window.URL.createObjectURL(file);

      createImageHTML(blob)
    })
  })

}