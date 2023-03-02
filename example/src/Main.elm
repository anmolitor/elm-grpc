module Main exposing (main)

import Browser
import Grpc
import Helloworld
import Html


type Msg
    = GotReply (Result Grpc.Error Helloworld.HelloReply)


type Model
    = Loading
    | Error
    | Success { reply : String }


main : Program {} Model Msg
main =
    Browser.document
        { init =
            \_ ->
                ( Loading
                , Grpc.new Helloworld.sayHello { name = "Evan" }
                    |> Grpc.toCmd GotReply
                )
        , view =
            \model ->
                { title = "gRPC example"
                , body =
                    case model of
                        Loading ->
                            [ Html.text "Waiting for reply..." ]

                        Error ->
                            [ Html.text "Something went wrong!" ]

                        Success { reply } ->
                            [ Html.text reply ]
                }
        , update =
            \msg _ ->
                case msg of
                    GotReply (Err err) ->
                        let
                            _ =
                                Debug.log "err" err
                        in
                        ( Error, Cmd.none )

                    GotReply (Ok reply) ->
                        ( Success { reply = reply.message }, Cmd.none )
        , subscriptions = \_ -> Sub.none
        }
