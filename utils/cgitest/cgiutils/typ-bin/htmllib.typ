#let webpage(
	title: none,
	doc,
) = context {
  set quote(block: true)
  show link: set text(fill: blue)
  //TODO: install fonts manually if system does not report them
  //show math.equation: set text(size: 12pt, font: "DejaVu Math TeX Gyre")
  show math.equation: set text(size: 12pt, font: "New Computer Modern Math")
  //set text(fill: white, font: "DejaVu Sans",  size: 10pt)
  set text(fill: white, font: "Verdana",  size: 10pt)
  if target() == "html"{
    show math.equation: html.frame
    show raw: html.code
    html.elem("link", attrs: (rel: "stylesheet", href: "utils/assets/pure-min.css"))
    html.elem("meta", attrs: (name: "viewport", content: "width=device-width, initial-scale=1"))
    //TODO: restyle with PureCSS
    //html.elem("div", attrs: (class: "flex-grow mx-10 md:mx-25 lg:mx-40 min-h-screen justify-center items-center"))[
      //#html.elem("h2", attrs: (class: "text-3xl font-bold underline text-blue-600 pt-6"))[
        //#title
      //]
      //#link("../index.html")[#arrow]
      //#doc
    //]
    html.elem("div")[
      #html.elem("h2")[
        #title
      ]
      #doc
    ]
  } else {
    [Are you sure you should export this as pdf]
    doc
  }
}

#let webheading(headingtext) = context {
  if target() == "html" {
    //TODO: redo with PureCSS
    html.elem("h4", attrs: (class: "text-2xl font-bold text-blue-600 !my-4"))[
      #headingtext
    ]

  } else {
    [ === #headingtext ] 
  }
}

#let loginform() = context {
  if target() == "html" {
    //TODO: write out the elems
    html.elem("form", attrs: (action: "cgi-bin/login.sh", method: "post"))[
        #html.elem("input", attrs: (type: "text", name: "username"))
        #html.elem("input", attrs: (type: "text", name: "password"))
        #html.elem("input", attrs: (type: "submit", name: "Submit"))
    ]
  } else {
    [Login Forms should not work in PDF]
  }
}

#let pureloginform() = context {
  if target() == "html" {
    html.elem("form", attrs: (class: "pure-form pure-form-aligned", action: "cgi-bin/login.sh", method: "post"))[
      #html.elem("fieldset")[
        #html.elem("div", attrs: (class: "pure-control-group"))[
          //using for like that will not work
          //#html.elem("label", attrs: ('for': "aligned-name"))[Username]
          #html.elem("label")[Username]
          #html.elem("input", attrs: (id: "aligned-name", type: "text", placeholder: "Username", name: "username"))
        ]
        #html.elem("div", attrs: (class: "pure-control-group"))[
          //using for like that will not work
          //#html.elem("label", attrs: ('for': "aligned-password"))[Password]
          #html.elem("label")[Password]
          #html.elem("input", attrs: (id: "aligned-password", type: "password", placeholder: "Passsword", name: "password"))
        ]
        #html.elem("div", attrs: (class: "pure-controls"))[
          #html.elem("button", attrs: (type: "submit", class: "pure-button pure-button-primary"))[Submit]
        ]
      ]
    ]

  } else {
    [Login Forms should not work in PDF]
  }
}
