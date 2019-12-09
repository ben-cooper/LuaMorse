# Lua Morse
Lua Script to Translate to and from Morse Code

## Usage

-e for encoding to morse<br>
-d for decoding from morse

```
usage: ./morse.lua <-e | -d> message
```

## Examples

```
$ ./morse.lua -e "Hello, world!"
.... . .-.. .-.. --- /.-- --- .-. .-.. -..

$ ./morse.lua -d ".... . .-.. .-.. --- /.-- --- .-. .-.. -.."
hello world
```

<b>Note</b>: Non-alphanumeric characters will be lost when encoding.
