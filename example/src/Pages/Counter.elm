module Pages.Counter exposing
    ( Model
    , Msg
    , Params
    , page
    )

import Application
import Html exposing (..)
import Html.Attributes exposing (href)
import Html.Events as Events


type alias Model =
    { counter : Int
    }


type Msg
    = Increment
    | Decrement


type alias Params =
    ()


page : Application.Page Params Model Msg model msg
page =
    Application.sandbox
        { init = always init
        , update = update
        , view = view
        }


init : Model
init =
    { counter = 0
    }


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | counter = model.counter + 1 }

        Decrement ->
            { model | counter = model.counter - 1 }


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Counter" ]
        , div []
            [ button [ Events.onClick Decrement ] [ text "-" ]
            , p [] [ text (String.fromInt model.counter) ]
            , button [ Events.onClick Increment ] [ text "+" ]
            ]
        , a [ href "/#section" ] [ text "Bottom of homepage" ]
        ]