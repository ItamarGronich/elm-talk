module Main exposing (..)

import Html exposing (footer, h1, li, section, text, ul)
import Html.Attributes exposing (classList, style)


-- Model


tasks =
    [ ( "Buy milk", False )
    , ( "Write Some Elm", False )
    , ( "Crush somne code", False )
    ]


activeItemList : List ( a, Bool ) -> Maybe ( a, a2 ) -> List ( a, Bool )
activeItemList list item =
    let
        activateItem item task =
            if (Tuple.first task) == (Tuple.first item) then
                ( (Tuple.first task), True )
            else
                task
    in
        case item of
            Just item ->
                List.map (activateItem item) list

            Nothing ->
                list


taskView : ( String, Bool ) -> Html.Html msg
taskView task =
    let
        baseStyles =
            [ ( "box-shadow", "2px 2px 3px 0 rgba(0,0,0,0.6)" )
            , ( "width", "200px" )
            , ( "padding", "1em" )
            , ( "margin", "10px" )
            , ( "list-style", "none" )
            ]

        stylesNonActive =
            ( "background", "#dbdbdb" ) :: baseStyles

        stylesActive =
            ( "background", "grey" ) :: baseStyles

        styles =
            (if (Tuple.second task) then
                stylesActive
             else
                stylesNonActive
            )
    in
        li
            [ style styles ]
            [ text (Tuple.first task) ]


view : List ( String, Bool ) -> Html.Html msg
view tasksList =
    let
        tasksActive =
            activeItemList tasksList (List.head tasks)
    in
        section []
            [ h1 [] [ text "TODO MUV" ]
            , ul [] (List.map (\todo -> taskView todo) tasksActive)
            ]


main : Html.Html msg
main =
    view tasks
