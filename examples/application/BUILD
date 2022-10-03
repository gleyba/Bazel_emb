# load("","stlink_binary1", "reset")
load('//tools/flash:rules.bzl', 'flash_tool')
# Target overview
cc_binary(
  name = "application",
  srcs = glob(["*.c"]),
  deps = [
    "//examples/algorithm",
    # "//platforms/mcu:support_lib",
  ],
  visibility = ["//visibility:public"],
)