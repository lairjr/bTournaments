module Tournament.Components.Layout exposing (..)

import Html exposing (Html, a, div, nav, p, span, strong, text)
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
                [ a [ class "navbar-link" ] [ text "Menu" ]
                , div [ class "navbar-dropdown" ]
                    [ a [ class "navbar-item", href "http://localhost:8000/#tournament/copa-eduardo-lawson/home" ] [ text "Home" ]
                    , a [ class "navbar-item", href "http://localhost:8000/#tournament/copa-eduardo-lawson/schedule" ] [ text "Schedule" ]
                    ]
                ]
            ]
        ]


tournamentSectionTitle : String -> Html Msg
tournamentSectionTitle title =
    nav [ class "level" ]
        [ div [ class "level-left" ]
            [ p [ class "subtitle is-5" ] [ strong [] [ text title ] ]
            ]
        ]
