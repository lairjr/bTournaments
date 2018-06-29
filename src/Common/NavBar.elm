module Common.NavBar exposing (..)

import Html exposing (Html, a, div, img, nav, span, text)
import Html.Attributes exposing (class, src)
import Msgs exposing (Msg)


navBar : Html Msg
navBar =
    nav [ class "navbar has-shadow has-background-light" ]
        [ div [ class "navbar-brand" ]
            [ a [ class "navbar-item" ]
                [ img [ src "static/logo.png" ] []
                ]
            ]
        ]



{-
   <nav class="navbar" role="navigation" aria-label="main navigation">
     <div class="navbar-brand">
       <a class="navbar-item" href="https://bulma.io">
         <img src="https://bulma.io/images/bulma-logo.png" alt="Bulma: a modern CSS framework based on Flexbox" width="112" height="28">
       </a>

       <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false">
         <span aria-hidden="true"></span>
         <span aria-hidden="true"></span>
         <span aria-hidden="true"></span>
       </a>
     </div>
   </nav>
-}
