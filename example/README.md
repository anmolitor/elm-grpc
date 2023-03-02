# Example

An example project showcasing elm-grpc.
The backend is written in rust using the tonic framework, since it provides a way to convert grpc-web to grpc automatically.

Start the server with `cargo run` and the frontend with `npm install && npm start`, then go to `http://localhost:5173`.
You should see the helloworld request complete successfully.

## Why can't we just use elm reactor?

Running the frontend seperate from the backend on a different port introduces CORS issues.
Vitejs has a very convenient way of proxying requests on the dev server to avoid these.
As far as I am aware, elm reactor does not have this functionality.
