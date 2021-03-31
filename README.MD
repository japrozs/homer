# Homer
<img src="/assets/Homer.png">
Homer is a general-use, imperative scripting language which is focused on simplicity and ease of usability.

# Install

## Linux/MacOS/Unix:

```
curl -fsSl https://raw.githubusercontent.com/japrozs/homer/master/install.sh | sh
```

## Windows

Paste in the following command in the powershell

```shell
iwr https://raw.githubusercontent.com/japrozs/homer/master/install.ps1 -useb | iex
```

# Getting Started

Homer files end with a `.hm` extension. To get started, create a new file called `hello.hm` extension and type the following peice of code inside the file :

```python
print "Hello World";
```

Then, go to your terminal, navigate to the directory where you stored the file and type in the following command:

```bash
$ homer hello.hm
```

If you see the following code output, then congratulations on writing your first peice of Homer code.

```bash
Hello World
```

# Syntax

Here is how to define the following semantics in `Homer`

## Classes

Classes can be initialised with the `init` function in `Homer`.

```javascript
class MyClass{
    init(name){
        this.name = name;
    }

    printClass(){
        print "The class is : " + this.name;
    }
}

var klass = MyClass("Class name");
print klass.printClass(); // The class is : Class name
```

## Functions

Functions in Homer cannot take more than 256 arguments.

```javascript
def sayHi(name){
    print "Hi " + name + " !";
}

sayHi("Japroz"); // Hi Japroz !
```

## For loops

```javascript
for(var i = 0;i < 10;i = i + 1){
    print "The number is currently " + i;
}
```

## While loops

```javascript
while(true){
    print "This loop will never end!!!";
}
```

# If else statements

```javascript
var name = "homer";
if(name == "homer"){
    print "The name is homer";
}else{
    print "The name is not homer";
}
```

## Expressions

```javascript
var i = 10 + (100/2);
var g = true or false;
var j = true and false;
```

## Inheritance

Classes inherit in the following way in `Homer`

```javascript

class Foo {
  inFoo() {
    print "in foo";
  }
}

class Bar < Foo {
  inBar() {
    print "in bar";
  }
}

class Baz < Bar {
  inBaz() {
    print "in baz";
  }
}

var baz = Baz();
baz.inFoo(); // expect: in foo
baz.inBar(); // expect: in bar
baz.inBaz(); // expect: in baz
```

# Standard Library

We would love it if people made libraries and pull requests. The way to create new functions is by using the `defineNative` functions inside of `src/vm.c` file. The functions are easy to implement.

# Contributing

For contributing guidelines, check our `CONTRITBUTING.MD` file.
