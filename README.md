# Lua Morse
Lua Script to Translate to and from Morse Code.

## Usage

-e for encoding to morse<br>
-d for decoding from morse
-o for output to file (filename: output.wav)

```
usage: ./morse.lua <-e | -d> message [-o]
```

## Examples

```
$ ./morse.lua -e "Hello, world!"
.... . .-.. .-.. --- /.-- --- .-. .-.. -..

$ ./morse.lua -d ".... . .-.. .-.. --- /.-- --- .-. .-.. -.."
hello world
```

**Note**: Non-alphanumeric characters will be lost when encoding.

## Requirements

* Lua v5.3.3 or greater
* SoX v14.4.2 or greater
