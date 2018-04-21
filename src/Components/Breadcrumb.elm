module Components.Breadcrumb exposing (..)

import Html exposing (Html, a, li, nav, text, ul)
import Html.Attributes exposing (class)
import Msgs exposing (Msg)


breadcrumb : String -> Html Msg
breadcrumb title =
    nav [ class "breadcrumb" ]
        [ ul []
            [ li [] [ a [] [ text title ] ]
            ]
        ]
