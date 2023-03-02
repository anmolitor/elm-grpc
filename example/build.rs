fn main() {
  tonic_build::compile_protos("src/helloworld.proto").unwrap();
}