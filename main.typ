// get the meta information provided by the top-level content folder
#let doc_info = toml("../document-info.toml")
#let text_blue = rgb("#060080")
#let displ_date = datetime(
    year: int(doc_info.date.year),
    month:int(doc_info.date.month),
    day:int(doc_info.date.day)
)


// configure metadata
#set document(
    title: doc_info.title + " | TU Delft for Integrity",
    author: doc_info.authors,
    date: displ_date
)

// define page limits
#set page("a4", 
            margin: (
            top:4.2cm,
            bottom:1.5cm,
            left:1.5cm,
            right:1.5cm
        ) 
)


// #set page(background:  context {
//       // clip to 3 since we only have 3 pages for now
//       let background_idx = calc.min(3, counter(page).get().first())
//       image("assets/background-" + str(background_idx) + ".svg", fit: "contain")        
// })

#set page(footer:  [
    #set par(leading: 0.4em)
    #set text(font: "Atkinson Hyperlegible", size: 8pt, fill: rgb(0%,0%,0%,20%))
    TU Delft for Integrity is a grassroots initiative composed of academic staff, researchers \
    and students. It is not organised, run by, or formally represent the TU Delft.
    #h(1fr)
    #set text(fill: rgb(0%,0%,0%,10%))
    sha:#sys.inputs.commit

    #place(
            bottom + right,
            dx: 0mm, 
            dy: -9mm,
            [   
                #set text(fill: rgb(6, 0, 128, 160))  // text_blue but with transparency
                #link("https://tudelft.forintegrity.nl/")[tudelft.forintegrity.nl]
            ]
    )
])



#set page(header: context {
    set text(font: "Atkinson Hyperlegible", size: 12pt, fill: text_blue)
    if counter(page).get().first() > 1 {[
        #place(
            top + left,
            dx: 0mm, 
            dy: 14.8mm,
            [   
                #align(left)[
                #block(
                    width: 16cm,
                    //fill: luma(240),
                    [
                        #set text(font: "Cal Sans", size: 8pt, fill: luma(200))
                        #displ_date.display(
                            "[month repr:long] [year repr:full]"
                            )\
                        #set text(font: "Atkinson Hyperlegible", size: 12pt, fill: text_blue)
                        TU Delft for Integrity | *#doc_info.title*
                    ]
                )]
            ]
        )

        #place(
            top + right,
            dx: 0mm, 
            dy: 18mm,
            [   
                #counter(page).display(
                "1/1",
                both: true,
                )
            ]
        )

        #place(
            top + right,
            dx: 36mm, 
            dy: 32mm,
            [
            #line(
                length: 120%,
                stroke: 2pt + text_blue,
            )
            ]
        )   
        ]  
    } 
    else {[ //we are on the first page
        
            
            #set text(fill: text_blue)
            #place(
                top + right,
                dx: 0mm, 
                dy: 17mm,
                [   
                    #set par(leading: 0.2em)
                    #set align(horizon)
                    #set text(font: "Cal Sans", size: 20pt)
                    #block(
                    width: 11cm,
                    height: 2.4cm,
                    //fill: luma(240),
                    doc_info.title
                    )
                ],
            )

            #place(
                top + right,
                dx: 36mm, 
                dy: 36mm,
                [
                #line(
                    length: 120%,
                    stroke: 2pt + text_blue,
                )
            ]
            )

            #place(
            top + left,
            dx: 0mm, 
            dy: 9mm,
            [   
                #align(left)[
                #block(
                    width: 16cm,
                    //fill: luma(240),
                    [
                        #set text(font: "Cal Sans", size: 8pt, fill: luma(200))
                        #displ_date.display(
                            "[month repr:long] [year repr:full]"
                            )
                    ]
                )]
            ]
            )
        ]
    } 
    
    [
  
]}, header-ascent: 3.3cm)

#place(
    top + left,
    dx: -2mm, 
    dy: -31mm,
    [
        #image("assets/logo.png", width: 40%) 
    ],
)

#set text(font: "Atkinson Hyperlegible", size: 11pt, fill: text_blue)

#show link: underline

// add the body contents 
#include "../content.typ"  

