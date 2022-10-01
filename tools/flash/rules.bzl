def _stuff_rule_impl(ctx):
    ctx.actions.run(
        inputs = [],
        outputs = [ctx.outputs.outfile],
        executable = ctx.executable._tool,
        arguments = [ctx.outputs.out.path],
    )

flash_tool = rule(
    implementation = _stuff_rule_impl,
    attrs = {
        # cfg param is required, but doesn't matter whether it's "host" or "target"
        "_tool": attr.label(
            executable=True, 
            default="//tools/flash:flash", 
            cfg="exec"
        ),
        "outfile": attr.output(),
    },
    executable = True
)
