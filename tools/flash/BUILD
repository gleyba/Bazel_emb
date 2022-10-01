# Provides the tool.
genrule(
  name = "app",
  srcs = ["//examples/application"],
  outs = ["app.hex"],
  cmd = "objcopy -O ihex $(location //examples/application) $(location :app.hex)" ,
  visibility = ["//visibility:public"],
)

py_binary(
  name = "flash",
  srcs = glob(["*.py"]),
  main = "main.py", 
  # args = ["$(location //examples/application:application)",],
  # data = [":app"],
  visibility = ["//visibility:public"],
)

