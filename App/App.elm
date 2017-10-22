module App.App exposing (..)

import Html exposing (div, text, Html, ul, li, h1)
import Html.Attributes exposing (classList)


type alias Todo =
    { name : String
    , done : Bool
    }


type alias Model =
    List Todo


type Msg
    = MarkDone


initialModel : List Todo
initialModel =
    [ Todo "Get milk" False ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        MarkDone ->
            model


view : Model -> Html msg
view model =
    div []
        [ h1 [] [ text "Todo MUV" ]
        , ul [] (List.map viewTodo model)
        ]


viewTodo : Todo -> Html msg
viewTodo todo =
    li [ (classList [ ( "active", todo.done ) ]) ] [ text todo.name ]
