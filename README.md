# cis194

Homework solutions for UPenn's CIS 194:

https://keathley.github.io/cis194/lectures.html

## Installation

On a mac:

    asdf install haskell 8.0.2
    cd cis194
    stack setup
    stack build

Or through nix:

    Install nix following https://nixos.org/nix/download.html
    nix-shell
    stack setup
    stack build

## GHCI

Through most of this course ghci is going to be your best friend. You can start
ghci by simply running: `ghci` in the root directory of the project. When you want to run load modules
you can use the `:load` command like so:

```
λ> :cd src/Cis194
λ> :l Week1
[1 of 1] Compiling Cis194.Week1     ( Week1.hs, interpreted )
Ok, modules loaded: Cis194.Week1.
λ>
```

You will only have to run the `:cd` command if you opened ghci in the root of the project. If you open ghci in the 'src/Cis194' directory then you can skip that step.

Occasionally you'll need to load multiple modules. These modules need to be
specified in the proper order. For instance `Calc.hs` depends on `ExprT.hs`.
You can load those modules in ghci like so:

```
λ> :load ExprT Calc
[1 of 2] Compiling Cis194.ExprT     ( ExprT.hs, interpreted )
[2 of 2] Compiling Cis194.Calc      ( Calc.hs, interpreted )
Ok, modules loaded: Cis194.ExprT, Cis194.Calc.
λ>
```

###

Its also possible to check types, kinds an other information about expressions
in ghci:

```
λ> :t 1 + 2
1 + 2 :: Num a => a
λ> :info map
map :: (a -> b) -> [a] -> [b]     -- Defined in ‘GHC.Base’
λ> :kind Int
Int :: *
```

## How to run tests

If you want to run the entire test suite you can do so with:

```
$ stack test
```

But most of the time you'll want to run tests for the specific assignment you're
working on like so:

```
$ stack test --test-arguments '-m MODULE_NAME'
```

For instance, if I wanted to run the assignments for Week1 I would say:

```
$ stack test --test-arguments '-m Week1'
```

## Using QuickCheck in ghci

    :m +Test.QuickCheck
    :l src/Cis194/Hw/Week1.hs 

    -- define a fx that generates data
    let negInts = choose(-10000000, -1)

    -- define a Property that runs function and asserts something about result
    let toDigitsEmpty x = (toDigits x) == []

    -- run QuickCheck to validate property
    quickCheck (forAll negInts toDigitsEmpty)
