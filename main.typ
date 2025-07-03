#let docname = "Open Letter"

#set page(
    paper: "a4", margin: (
        top:5.5cm,
        bottom:1.1cm,
        left:1.1cm,
        right:1cm
    ),
)



#set page(background:  context {
      // clip to 3 since we only have 3 pages for now
      let background_idx = calc.min(3, counter(page).get().first())
      image("assets/background-" + str(background_idx) + ".svg", fit: "contain")        
})

#set page(footer:  [
    #h(1fr)
    #set text(font: "Atkinson Hyperlegible", size: 7pt, fill: rgb(0%,0%,0%,5%))
    sha:#sys.inputs.commit
])



#set page(header: context {
    if counter(page).get().first() > 1 {[
        TU Delft for Integrity | *#docname*
        #h(1fr)
        #counter(page).display(
            "1/1",
            both: true,
        )]  
    } else {[
            #h(1fr)
            #counter(page).display(
                "1/1",
                both: true,
            )

            #place(
                top + left,
                dx: 45mm,
                dy: 17mm,
                [
                    #set text(font: "Cal Sans", size: 24pt)
                    TU Delft for Integrity
                ],
            )
            
            #place(
                top + left,
                dx: 45mm, 
                dy: 26mm,
                [
                    #set text(font: "Atkinson Hyperlegible", size: 24pt)
                    #docname
                ],
            )
        ]
    } 
    
    [
  
]}, header-ascent: 3.3cm)

#set text(font: "Atkinson Hyperlegible", size: 11pt)

#show link: underline

// add the body contents 
#include "content.typ"  

