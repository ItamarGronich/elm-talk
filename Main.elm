module Main exposing (..)

import App.App exposing (initialModel, update, view, Model, Msg)
import Html exposing (Html)


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }
