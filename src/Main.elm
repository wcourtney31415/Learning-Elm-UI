module Main exposing (..)

import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Font as Font
import Element.Input as Input


main =
    Browser.sandbox { init = init, update = update, view = view }


type alias Model =
    { labelText : String }


init : Model
init =
    { labelText = " " }


type Msg
    = Display String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Display str ->
            { model | labelText = str }


view model =
    Element.layout
        [ Background.color lightBlue
        , padding 30
        ]
    <|
        Element.column
            [ Background.color lighterBlue
            , Font.color contentFontColor
            , Font.size 32
            , width fill
            , padding 20
            ]
            [ makeHeader
            , makeRow "1"
            , makeRow "2"
            , makeRow "3"
            , makeOutputLabel model.labelText
            ]


lightBlue =
    rgb255 179 218 255


lighterBlue =
    rgb255 204 230 255


lightestBlue =
    rgb255 230 243 255


contentFontColor =
    rgb255 179 179 179


white =
    rgb255 255 255 255


makeHeader =
    Element.el
        [ centerX
        , padding 10
        , Font.color white
        , Font.bold
        ]
    <|
        text "Row||Column"


makeRow : String -> Element Msg
makeRow row =
    Element.row
        [ Background.color lightestBlue
        , centerX
        ]
        [ makeCell row "1"
        , makeCell row "2"
        , makeCell row "3"
        , makeCell row "4"
        , makeCell row "5"
        ]


makeCell : String -> String -> Element Msg
makeCell row column =
    let
        buttonLabel =
            row ++ "||" ++ column
    in
    Input.button
        [ padding 60
        ]
        { label = text buttonLabel
        , onPress = Just (Display buttonLabel)
        }


makeOutputLabel : String -> Element Msg
makeOutputLabel labelText =
    Element.el
        [ centerX
        , padding 20
        ]
        (text labelText)
