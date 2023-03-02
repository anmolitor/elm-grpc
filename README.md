# Elm-gRPC

gRPC-Web Implementation for the Elm programming language.

Designed for [protoc-gen-elm](https://github.com/andreasewering/protoc-gen-elm) code generation.

Important note: Thanks to Martin Rosenberg for his [elm-grpc](https://package.elm-lang.org/packages/rosenbergm/elm-grpc/latest/) package which this package builds upon. I felt like I wanted a different API for protoc-gen-elm than what he currently has and wanted freedom to iterate quickly and show my API to other developers.
We can merge the packages later!

## Limitations

Currently, only unary requests are supported.
If you have ideas how to implement server-side streaming, I'm open for pull requests/issues.
As far as I am aware, grpc-web as a whole is blocked on client-side streaming/bidirectional streaming due to missing browser support.

## Shoutouts

- Thanks to Erik Timmers for the incredible [elm-protocol-buffers](https://package.elm-lang.org/packages/eriktim/elm-protocol-buffers/latest/) package. 

## Resources

- gRPC: https://grpc.io/
- gRPC-Web: https://github.com/grpc/grpc-web