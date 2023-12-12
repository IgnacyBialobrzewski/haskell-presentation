---
marp: true
paginate: true
style: "
h1 {
    color: #5e5086;
}
"
---

![](static/haskell_brand.svg)
**An advanced, purely functional programming language**

_Ignacy Białobrzewski
Michał Bujak_

---

# Table of contents

1. <a href="#3">What is Haskell?</a>
2. <a href="#4">What is functional programming?</a>
3. <a href="#5">Why use Haskell?</a>
4. <a href="#6">Haskell in the industry</a>
5. <a href="#7">Hands-on Haskell</a>
6. <a href="#10">Closing remarks</a>
7. <a href="#11">Learning resources</a>
8. <a href="#12">Sources</a>

---

# What is Haskell?

Haskell is a **general-purpose, statically-typed functional programming language** named after the American logician Haskell Curry. It's used for teaching, research, and industry-grade applications.

> The most widely used Haskell compiler is the **Glasgow Haskell Compiler**, developed at the **University of Glasgow in 1992**.

---

# What is functional programming?

Functional programming is a **subset of the declarative programming paradigm** in which the program is composed **entirely of expressions** that are then evaluated at run-time or, in some cases, compile-time.

In functional programming, every function is "**Pure**" i.e., **a function will always produce the same output given the same input** contributing to the predictability of functional languages.

---

# Why use Haskell?

Haskell shines when it comes to developing maintainable industrial systems due to its **robust type system** and the **predictable nature** of functional programming while preserving programmer productivity stemming from Haskell's **simplistic syntax**.

While Haskell is often used for large-scale systems that an average developer might not encounter, it's still an **excellent learning experience that will improve one's perception of programming as a whole**.

---

# Haskell in the industry

-   **Hasura**
    -   GraphQL Engine
-   **GitHub**
    -   CLI Tool
-   **Meta**
    -   Large-scale moderation platform
    -   Source code analyzer
    -   Data fetching framework
-   **Microsoft**
    -   Production serialization system

---

# Hands-on Haskell - Functions

`one` takes no arguments and evaluates to `1`

```hs
one :: Int -- Function declaration
one = 1 -- Function definition
```

`addOne` takes an `Int` and evaluates to `x + 1`

```hs
addOne :: Int -> Int
addOne x = x + 1
```

`addXY` is curried so it takes an `Int` and returns a partial function `(Int -> Int)` which also takes an `Int` and then evaluates to `Int`

```hs
addXY :: Int -> Int -> Int
addXY x y = x + y
```

---

# Hands-on Haskell - Recursion & list comprehensions

`fib` is recursive and uses **pattern-matching**, takes an `Int` and evaluates to an `Int`

```hs
fib :: Int -> Int
fib 0 = 0 -- Base case
fib 1 = 1 -- Base case
fib n = fib (n - 1) + fib (n - 2)
```

`filter'` takes a **predicate** and applies it to each element using a **list comprehension**

```hs
filter' :: (a -> Bool) -> [a] -> [a]
filter' p xs = [x | x <- xs, p x]
```

---

# Hands-on Haskell - Example

<p style="font-size: medium; margin-bottom: 0; font-weight: bold">Advent of Code 2023 - Day 1 - Parser.</p>
<p style="font-size: medium; margin-top: 0">Author: Ignacy Białobrzewski.</p>

```hs
import Data.Char (isNumber)
-- getLineValue parses value of a single line (a1b2c3d4e5f -> 15)
getLineValue :: String -> String -- getLineValue declaration
getLineValue "" = "" -- given an empty string return an empty string
getLineValue str@(x:xs) -- given a string separate head from tail (head:tail)
    | isNumber x = [x, head v] -- if head is a number, return a string
    | otherwise = getLineValue xs -- otherwise, strip the head away, move on
    where v = getLineValue (reverse str) -- v is the reverse value of a line
-- sumLines uses getLineValue to sum a list of lines (strings)
sumLines :: Int -> [String] -> Int -- sumLines declaration
sumLines = foldl (\ acc xs -> acc + read (getLineValue xs) :: Int)
-- fold the list from left to right, accumulate the values

main :: IO()
main = do
    input <- readFile "input.txt" -- these are our values separated with "\n"
    print $ sumLines 0 (lines input) -- turn the input to lines and sum them
```

---

# Closing remarks

_Haskell stands apart not merely due to its succinct syntax or exceptional speed and portability. It distinguishes itself by compelling developers to adopt an unconventional perspective when approaching problems, fostering a profound shift in how we conceive and tackle obstacles in the field of engineering._

---

# Learning resources

-   <a href="http://learnyouahaskell.com/">Learn you a Haskell</a> - Light but rapid introduction to Haskell and the principles of functional programming.
-   <a href="https://book.realworldhaskell.org/">Real World Haskell</a> - A look into Haskell and the problems involved with developing real software using it.
-   <a href="https://www.youtube.com/watch?v=Vgu82wiiZ90">Haskell for Imperative Programmers</a> - Easily digestible overview of Haskell in a video form for people used to the imperative paradigm.

---

# Sources

-   https://www.haskell.org/
-   https://wiki.haskell.org/
-   https://wiki.haskell.org/Haskell_in_industry
-   https://en.wikipedia.org/wiki/Haskell
-   https://en.wikipedia.org/wiki/Glasgow_Haskell_Compiler
-   https://serokell.io/blog/top-software-written-in-haskell

---

![height:100](static/haskell_logo.svg)

# Thank you for your time.
