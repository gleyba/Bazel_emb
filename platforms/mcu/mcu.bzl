McuInfo = provider(
    doc = "Information about mcu",
    # In the real world, compiler_path and system_lib might hold File objects,
    # but for simplicity they are strings for this example. arch_flags is a list
    # of strings.
    fields = ["device_type", "linker"],
)

def _mcu_toolchain_impl(ctx):
    toolchain_info = platform_common.ToolchainInfo(
        mcu_info = McuInfo(
            device_type = ctx.attr.device_type,
            linker = ctx.executable.linker.path,
        ),
    )
    return [toolchain_info]

mcu_toolchain = rule(
    implementation = _mcu_toolchain_impl,
    attrs = {
        "device_type": attr.string(mandatory = True),
        "linker": attr.label(
            mandatory = True, 
            executable=True, 
            cfg = "exec",
        )
    }
)