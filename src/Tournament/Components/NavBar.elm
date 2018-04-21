module Tournament.Components.NavBar exposing (..)

import Html exposing (Html, a, div, nav, span, text)
import Html.Attributes exposing (class, href)
import Msgs exposing (Msg)


tournamentNavBar : String -> Html Msg
tournamentNavBar title =
    nav [ class "navbar" ]
        [ div [ class "navbar-brand" ]
            [ a [ class "navbar-item" ] [ text title ]
            , a [ class "navbar-burger" ]
                [ span [] []
                , span [] []
                , span [] []
                ]
            ]
        , div [ class "navbar-menu" ]
            [ div [ class "navbar-item has-dropdown is-hoverable" ]
                [ a [ class "navbar-link" ] [ text "Home " ]
                , div [ class "navbar-dropdown" ]
                    [ a [ class "navbar-item", href "schedule" ] [ text "Schedule" ]
                    ]
                ]
            ]
        ]
