## compile_commands.json

## compile_flags.txt

> [!example]
> For simple projects, Clang tools also recognize a `compile_flags.txt` file. This should contain one argument per line. The same flags will be used to compile any file.
> ```
> -xc++
> -I
> libwidget/include/
> ```

## References

[JSON Compilation Database Format Specification — Clang 17.0.0git documentation (llvm.org)](https://clang.llvm.org/docs/JSONCompilationDatabase.html)
