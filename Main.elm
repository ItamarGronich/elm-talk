module Main exposing (..)

import Html exposing (h1, text, pre, div)


model =
    { foo = "foo"
    , bar = "baz"
    , num = 9
    }


headerText =
    (++) "Hello" " World"


headerTextModified : String
headerTextModified =
    let
        delimiter : String
        delimiter =
            "! "
    in
        delimiter
            |> String.append headerText
            |> String.repeat 3
            |> String.toUpper


view model =
    div []
        [ text headerTextModified
        , pre [] [ text (toString model) ]
        ]


main : Html.Html msg
main =
    view model
