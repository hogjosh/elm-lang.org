
import Website.Skeleton (skeleton)
import open Website.ColorScheme
import Window
import JavaScript as JS

title = constant (JS.fromString "Interactive Programming in Elm")
foreign export jsevent "title"
  title : Signal JS.JSString

main = lift (skeleton everything) Window.width

everything w =
    width w intro

intro = [markdown|

<style type="text/css">
p { text-align: justify }
pre {
 background-color: rgb(245,245,245);
 margin: 0 30px;
 padding: 4px 10px;
 border-left: solid 2px rgb(96,181,204);
}
table.sourceCode, tr.sourceCode, td.lineNumbers, td.sourceCode {
  margin: 0; padding: 0; vertical-align: baseline; border: none; }
table.sourceCode { width: 100%; background-color: #f8f8f8; }
td.lineNumbers { text-align: right; padding-right: 4px; padding-left: 4px; color: #aaaaaa; border-right: 1px solid #aaaaaa; }
td.sourceCode { padding-left: 5px; }
pre, code { background-color: #f8f8f8; }
code > span.kw { color: #204a87; font-weight: bold; }
code > span.dt { color: #204a87; }
code > span.dv { color: #0000cf; }
code > span.bn { color: #0000cf; }
code > span.fl { color: #0000cf; }
code > span.ch { color: #4e9a06; }
code > span.st { color: #4e9a06; }
code > span.co { color: #8f5902; font-style: italic; }
code > span.ot { color: #8f5902; }
code > span.al { color: #ef2929; }
code > span.fu { color: #000000; }
code > span.er { font-weight: bold; }
</style>

<h1><div style="text-align:center">Interactive Programming
<div style="font-size:0.5em;font-weight:normal">*Modifying Running Programs / Immediate Feedback*</div></div>
</h1>

JavaScript proved that the development loop can be as short as refreshing
your browser. This kind of [interactive programming][ip] is very powerful
for quickly iterating and testing an idea, making programming more accessible
and more fun.

 [ip]: http://en.wikipedia.org/wiki/Interactive_programming

Articles like [Learnable Programming](http://worrydream.com/LearnableProgramming/)
are presenting ideas on what interactive programming might look like. Projects like
[LightTable](http://www.lighttable.com/) are taking this concept further, making
an IDE for interactive programming.

Elm takes the next step, exploring what it means to be a *language* for
interactive programming.

Modifying running code is traditionally called [hot-swapping](http://en.wikipedia.org/wiki/Hot_swapping).
[It is not a new concept](http://www.erlang.org/), it is just hard to do in most languages.
Turns out, it is very easy in Elm.

<div style="position: relative; padding-bottom: 56.25%; padding-top: 30px; height: 0; overflow: hidden;">
<iframe src="//www.youtube.com/embed/SmUD0vbSUHg"
        frameborder="0"
        allowfullscreen
        style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"
        width="640" height="480"></iframe>
</div>

Support for hot-swapping is live, so you can [mess with Mario too](/edit/examples/Intermediate/Mario.elm).
Just check the auto-swap button in the editor. As you tweak the code
below&mdash;colors, numbers, etc.&mdash;you will see the program update
automatically.

<iframe src="/edit/examples/Intermediate/Clock.elm" 
        frameborder="0"
        style="overflow:hidden;height:300px;width:100%"
        height="300px" width="100%"></iframe>

Perhaps the most interesting thing about hot-swapping is that it was quite
easy to add. It took about four days.

During those four days, it became very clear that the practicality of supporting
interactive programming was directly related to the abstractions (or lack-thereof) in
the language.

## Interactive Programming needs the right Language

Languages impose fundamental limitations on speed and quality of feedback.
Hot-swapping is just one aspect of interactive programming. The *right*
language for interactive programming would be able to provide:

 * [Hot-Swapping](#hot-swapping-pure-functions-and-immutable-data)
 * [Fast Compilation](#fast-compilation-modern-module-system)
 * [Useful Error Messages](#useful-error-messages-static-type-system)

In each of these cases, developers can get faster and better feedback,
but this is only possible in languages that are *designed* for it.
It is only possible in languages that **take abstractions seriously**.

These three properties of interactive programming&mdash;hot-swapping, fast compilation,
and useful error messages&mdash;are directly related to the language
you are working in. In fact, each one comes from specific language features.

### Hot-Swapping: Pure Functions and Immutable Data

Elm and Erlang both support hot-swapping. Both languages only allow
pure functions and only provide immutable data. In fact, both are based
on the CoCC. This is no coincidence.

In a language like JavaScript where side-effects can happen anywhere
and program state is scattered haphazardly throughout the codebase, .


### Fast Compilation: Modern Module System

While working on backend services within gmail, waiting for my C++ servers
to compile was a fundamental fact of life. The stone-age linking process
used by C++ means that compilation can be *exponential* in the number of files!
This is not a problem that can be solved by faster or more hardware, although
Google has already used both of these methods to improve compile times.
Between all of Google&rsquo;s engineers, the cost of this is huge, [whether you
measure it in productivity, coffee, or snacks](http://imgs.xkcd.com/comics/compiling.png).

One of the primary design goals of Go is to cut compilation time out of
an engineers day. Go set out to solve the complitation delays at the *language*
level. By choosing the right lanugage features, Go was able to bring compile
times down to O(n) if you are compiling from scratch. From there Go can use
cached information so that only needs to compile files that have been changed.

This is a small step towards immediate feedback in compiled languages. In fact,
many *modern* compiled languages use a very similar strategy.

### Useful Error Messages: Static Type System

A static type system makes it possible to catch many common errors at compile time.
This is an important feature of Elm and I think it is quite helpful.

That said, I have found that debate is not a viable strategy for this topic.
The best argument I can make is to recommend extensively using a statically-typed
functional language with type inference and seeing if you like it.

I think the key problem is that when people hear &ldquo;static types&rdquo;
they think of Java. This is the definition of a marketing problem.
Not all static type systems are equal, and I think languages like OCaml, F#,
Haskell, and Elm are much better representatives of static types.

People will tell you things like, &ldquo;makes development faster&rdquo;,
&ldquo;fewer bugs&rdquo;, &ldquo;not just for academics&rdquo;, yada, yada, yada.
None of that is going to convince you. Just try out a language with a proper type
system and *then* make up your mind.

|]