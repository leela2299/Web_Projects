DATA = "./data.json";
async function fetchData() {
       const response = await fetch(DATA

      );

      let gd = await response.text();
       return gd;
      }

       fetchData().then(d=>processData(d));

        function processData(d) {
          var g = JSON.parse(d);

          createSection1(g);
          createSection2(g);
          createSection3(g);
          createSection4(g);



     }

     //....................section1................................................//


     function createSection1(g)
     {
       var myImage = document.createElement('img');
        myImage.src = "rodeo-drive.jpg";
        myImage.classList.add("section1-img");
       document.querySelector("#section1").appendChild(myImage);
     }



//// -------- Section 2 -----------------------------------------------------------------------
     function createSection2(g)
     {
           for(let i=0;i<g["section2"].length;i++) //creating image blocks
           {
              var onediv = document.createElement('div');
              onediv.className = "section2_img_block";
              document.getElementById("section2").appendChild(onediv);


            }

            for(let i=0;i<g["section2"].length;i++) //creating text blocks
            {
               var onediv = document.createElement('div');
               onediv.className = "section2_text_block";
               document.getElementById("section2").appendChild(onediv);


             }

             for(let i=0;i<g["section2"].length;i++)
            {


               var myImage = document.createElement('img');
                myImage.src = g["section2"][i]["image"];
                myImage.classList.add("section2-img");
               document.querySelectorAll(".section2_img_block")[i].appendChild(myImage);

               var h3 = document.createElement("h3");
               h3.className = "section2-text";
               var heading = g["section2"][i]["heading"];
               var h3_node = document.createTextNode(heading);
               h3.appendChild(h3_node);
               document.querySelectorAll(".section2_text_block")[i].appendChild(h3);

               var para = document.createElement("p");
               para.className = "section2-text";
               var myText = g["section2"][i]["text"];
               var node = document.createTextNode (myText);
               para.appendChild(node);
               document.querySelectorAll(".section2_text_block")[i].appendChild(para);

              // console.log(myText);

               // var element = document.getElementById('element');
               // element.classList.add('class-1');
               // element.classList.add('class-2', 'class-3');
               // element.classList.remove('class-3');

         }
 }

//-------------------------------------Section 3 -----------------------------------------------------



                   function createSection3(g)
                   {
                       var onediv = document.createElement('div');
                       onediv.className = "section3_text_block";
                       document.getElementById("section3").appendChild(onediv);



                         for(let i=0;i<g["section3"]["text"].length;i++)
                        {
                            var para = document.createElement("p");
                            para.className = "section3-text";
                            var myText = g["section3"]["text"][i];
                            var node = document.createTextNode (myText);
                            para.appendChild(node);
                            document.querySelector(".section3_text_block").appendChild(para);
                            console.log(g["section3"]["text"][i]);

                        }

                          var onediv = document.createElement('div');
                          onediv.className = "section3_img_block";
                          document.getElementById("section3").appendChild(onediv);

                        var myImage = document.createElement('img');
                         myImage.src = "lasky.png";
                         myImage.classList.add("section3-img");
                        document.querySelector(".section3_img_block").appendChild(myImage);



                   }





 //-------------------------------Section 4 ------------------------------------------

          function createSection4(g)
          {

              for(let i=0;i<g["section4"].length;i++) //created subdivisons of blocks
              {


                    if(i%2==0)  // even
                    {
                      //create image block
                      var onediv = document.createElement('div');
                      onediv.className = "section4_img_block";
                      document.getElementById("section4").appendChild(onediv);
                    //  console.log("leela");


                      var onediv = document.createElement('div');
                      onediv.className = "section4_text_block";
                      document.getElementById("section4").appendChild(onediv);
                    }

                    else //odd images
                    {
                      var onediv = document.createElement('div');
                      onediv.className = "section4_text_block";
                      document.getElementById("section4").appendChild(onediv);

                      var onediv = document.createElement('div');
                      onediv.className = "section4_img_block";
                      document.getElementById("section4").appendChild(onediv);
                      //console.log("leela");


                    }


                }


                for(let i=0;i<g["section4"].length;i++)
               {

                  if(i%2==0)
                  {
                      var myImage = document.createElement('img');
                       myImage.src = g["section4"][i]["image"];
                       myImage.classList.add("section4-img");
                      document.querySelectorAll(".section4_img_block")[i].appendChild(myImage);

                      var h3 = document.createElement("h2");
                      h3.className = "section4-text";
                      var heading = g["section4"][i]["heading"];
                      //  heading.classList.add("text-left");
                      var h3_node = document.createTextNode(heading);
                      h3.appendChild(h3_node);
                      document.querySelectorAll(".section4_text_block")[i].appendChild(h3);

                      var para = document.createElement("p");
                      para.className = "section4-text";
                      var myText = g["section4"][i]["text"];
                      var node = document.createTextNode (myText);
                      para.appendChild(node);
                      document.querySelectorAll(".section4_text_block")[i].appendChild(para);

                      //console.log(myText);

                  }

                  else{

                    var h3 = document.createElement("h2");
                    h3.className = "section4-text";
                    h3.classList.add("text-right");
                    var heading = g["section4"][i]["heading"];

                    var h3_node = document.createTextNode(heading);

                    h3.appendChild(h3_node);
                    document.querySelectorAll(".section4_text_block")[i].appendChild(h3);

                    var para = document.createElement("p");
                    para.className = "section4-text";
                    var myText = g["section4"][i]["text"];
                    var node = document.createTextNode (myText);
                    para.appendChild(node);
                    document.querySelectorAll(".section4_text_block")[i].appendChild(para);

                    var myImage = document.createElement('img');
                     myImage.src = g["section4"][i]["image"];
                     myImage.classList.add("section4-img");
                    document.querySelectorAll(".section4_img_block")[i].appendChild(myImage);

                    //console.log(myText);
                  }





            }




          }
