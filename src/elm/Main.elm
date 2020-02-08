module Main exposing (main)

import Canvas exposing (..)
import Canvas.Settings exposing (..)
import Canvas.Settings.Advanced exposing (..)
import Canvas.Settings.Line exposing (lineWidth)
import Color
import Html exposing (..)
import Html.Attributes exposing (..)


type alias Model =
    { w : Int
    , h : Int
    , shapes : List Shape
    }


initialModel : Model
initialModel =
    { w = 600
    , h = 500
    , shapes =
        [ circle ( 280, 150 ) 110
        , rect ( 50, 350 ) 150 120
        , path ( 20, 20 )
            [ lineTo ( 20, 300 )
            , lineTo ( 330, 430 )
            , lineTo ( 440, 340 )
            , lineTo ( 20, 20 )
            ]
        ]
    }


view : Model -> Html msg
view model =
    div []
        [ h2 []
            [ Html.text "This is Elm and Canvas 2D" ]
        , Canvas.toHtml ( model.w, model.h )
            []
            [ background model.w model.h, renderShapes model.shapes ]
        ]


background : Int -> Int -> Renderable
background w h =
    shapes
        [ fill Color.darkBlue ]
        [ rect ( 0, 0 ) (toFloat w) (toFloat h) ]


renderShapes : List Shape -> Renderable
renderShapes slist =
    shapes
        [ fill (Color.rgba 0 1 0 1)
        , stroke Color.yellow
        , lineWidth 3
        , shadow { blur = 3, color = Color.black, offset = ( 1, 1 ) }
        ]
        slist


main : Html msg
main =
    view initialModel
