# TableGPT Ipython Kernel

Docker image used to spawn code execution environments for the TableGPT project. It is based on the `elyra/kernel-py` image, with additional data-analyze packages and Chinese font support installed.

## Quick Start

```bash
docker pull tablegpt/ipy-kernel:latest
```

## Startup Scripts

It's recommended to put some helper functions or configurations in the startup scripts. Place your startup scripts to `~/.ipython/profile_default/startup/` directory to take effect.

Note: The `~/.ipython` directory must be writable for the process launching the kernel, otherwise there will be a warning message: `UserWarning: IPython dir '/home/jovyan/.ipython' is not a writable location, using a temp directory.` and the startup scripts won't take effects.

Official document at `~/.ipython/profile_default/startup/README`:

> This is the IPython startup directory
>
> .py and .ipy files in this directory will be run *prior* to any code or files specified
> via the exec_lines or exec_files configurables whenever you load this profile.
>
> Files will be run in lexicographical order, so you can control the execution order of files
> with a prefix, e.g.::
>
>     00-first.py
>     50-middle.py
>     99-last.ipy
