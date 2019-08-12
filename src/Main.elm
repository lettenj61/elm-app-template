module Main exposing (main)

import Browser
import Html exposing (Html)
import Html.Attributes.Classname exposing (classMixinWith)
import Mixin exposing (Mixin)
import Mixin.Html as Mixin



-- App


main : Program () Model Msg
main =
    Browser.element
        { init = \_ -> init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    ()


init : ( Model, Cmd Msg )
init =
    ( ()
    , Cmd.none
    )


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model
            , Cmd.none
            )


view : Model -> Html Msg
view _ =
    Mixin.div
        [ class "wrapper"
        ]
        [ Html.text "test"
        ]


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- Helper functions


{-| A specialized version of `class` for this module.
It converts given class names into ones generated by CSS modules.
-}
class : String -> Mixin msg
class =
    classMixinWith <| \name -> "app__" ++ name
