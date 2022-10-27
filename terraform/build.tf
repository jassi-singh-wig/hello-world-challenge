resource "docker_image" "zoo" {
  name = "zoo"
  build {
    path = "../hello-world"
    target = "prod"
    dockerfile = "dockerfile"
    tag  = ["zoo:develop"]
    build_arg = {
      foo : "zoo"
    }
    }
  #triggers = {
   # dir_sha1 = sha1(join("", [for f in fileset(path.module, "../hello-world/app/src/*") : filesha1(f)]))
  #}
}


