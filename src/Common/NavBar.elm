module Common.NavBar exposing (..)

import Html exposing (Html, a, div, nav, span, text)
import Html.Attributes exposing (class)
import Msgs exposing (Msg)


navBar : Html Msg
navBar =
    nav [ class "navbar" ]
        [ div [ class "navbar-brand" ]
            [ span [] [ text "My Tournaments" ]
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
