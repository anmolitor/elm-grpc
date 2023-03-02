module Grpc.Internal exposing (Rpc(..))

{-| Internals that are intended to be used from code generators.


# Rpc representation

@docs Rpc

-}

import Protobuf.Decode exposing (Decoder)
import Protobuf.Encode exposing (Encoder)


{-| Given the following proto file

    """
    syntax = "proto3";

    package helloworld;

    service Greeter {
      rpc SayHello (HelloRequest) returns (HelloReply) {}
    }

    message HelloRequest {
      string name = 1;
    }

    message HelloReply {
      string message = 1;
    }
    """

the corresponding Rpc instance would be

    Rpc
        { service = "Greeter"
        , package = "helloworld"
        , rpcName = "SayHello"
        , encoder = helloRequestEncoder
        , decoder = helloReplyDecoder
        }

where `helloRequestEncoder` and `helloReplyDecoder` are Encoders/Decoders built with `elm-protocol-buffers`.

-}
type Rpc req res
    = Rpc
        { service : String
        , package : String
        , rpcName : String
        , encoder : req -> Encoder
        , decoder : Decoder res
        }
