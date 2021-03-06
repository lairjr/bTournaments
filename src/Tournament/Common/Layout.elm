module Tournament.Common.Layout exposing (..)

import Html exposing (Html, a, div, nav, p, span, strong, text)
import Html.Attributes exposing (class, href, style)
import Msgs exposing (Msg)
import String exposing (toUpper)


tournamentNavBar : String -> Html Msg
tournamentNavBar title =
    nav [ class "navbar has-background-dark" ]
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
                    [ a [ class "navbar-item", href "http://localhost:8000/#tournament/copa-eduardo-lawson/schedule" ] [ text "Schedule" ]
                    , a [ class "navbar-item", href "http://localhost:8000/#tournament/copa-eduardo-lawson/standings" ] [ text "Standings" ]
                    ]
                ]
            ]
        ]


tournamentSectionTitle : String -> Html Msg
tournamentSectionTitle title =
    nav [ class "level", style [ ( "margin", "1rem" ) ] ]
        [ p [ class "level-item has-text-centered" ]
            [ p [ class "subtitle is-5" ] [ strong [] [ text (toUpper title) ] ]
            ]
        ]
