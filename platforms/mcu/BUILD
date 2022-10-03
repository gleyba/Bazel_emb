load("mcu.bzl", "mcu_toolchain")

# Package overview.
# How are MCUs intended to be used and extended? Explain how they are shared
# between compilers and platforms.
package(default_visibility = ["//visibility:public"])

toolchain_type(name = "mcu_toolchain_type")
constraint_setting(name = "mcu_type")

constraint_value(
    name = "stm43f407xx",
    constraint_setting = ":mcu_type",
)

mcu_toolchain(
    name = "stm43f407xx_toolchain_impl",
    device_type = "stm43f407xx",
    linker = "//third_party:dummy_binary",
)

toolchain(
    name = "stm43f407xx_toolchain",
    target_compatible_with = [
        ":stm43f407xx",
    ],
    toolchain = ":stm43f407xx_toolchain_impl",
    toolchain_type = ":mcu_toolchain_type",
)

# Support library overview
# Includes startup code and the peripherals dependencies, for any supported
# platform, including desktop.

# select() is the helper function that makes a rule attribute configurable. 
# It can replace the right-hand side of almost any attribute assignment so its value depends on command-line Bazel flags. 
cc_library(
    name = "support_lib",
    deps = select({
        ":stm43f407xx" : [ "//third_party:dummy_lib"],
    }),
    visibility = ["//visibility:public"],
)
