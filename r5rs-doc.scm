;; R5RS Documentation Library
;; Portable to any R5RS-compatible Scheme implementation.

(define *r5rs-docs*
  `(
    ("string-ci>=?" . "library procedure:  (string-ci>=? string_1 string_2) 

These procedures are the lexicographic extensions to strings of the
corresponding orderings on characters.  For example, string<? is
the lexicographic ordering on strings induced by the ordering
char<? on characters.  If two strings differ in length but
are the same up to the length of the shorter string, the shorter string
is considered to be lexicographically less than the longer string.

Implementations may generalize these and the string=? and
string-ci=? procedures to take more than two arguments, as with
the corresponding numerical predicates.")
    ("char-upcase" . "library procedure:  (char-upcase char) 

library procedure:  (char-downcase char) 

These procedures return a character char_2 such that (char-ci=? char char_2).  In addition, if char is
alphabetic, then the result of char-upcase is upper case and the
result of char-downcase is lower case.")
    ("substring" . "library procedure:  (substring string start end) 

String must be a string, and start and end
must be exact integers satisfying

0 < start < end < (string-length string).

Substring returns a newly allocated string formed from the characters of
string beginning with index start (inclusive) and ending with index
end (exclusive).")
    ("make-rectangular" . "procedure:  (make-rectangular x_1 x_2) 

procedure:  (make-polar x_3 x_4) 

procedure:  (real-part z) 

procedure:  (imag-part z) 

procedure:  (magnitude z) 

procedure:  (angle z) 

These procedures are part of every implementation that supports
general
complex numbers.  Suppose x_1, x_2, x_3, and x_4 are
real numbers and z is a complex number such that

 z  =  x_1  +  x_2i
 =  x_3  &middot;  ei x_4

Then

(make-rectangular x_1 x_2)         ===> z

(make-polar x_3 x_4)             ===> z

(real-part z)                          ===> x_1

(imag-part z)                          ===> x_2

(magnitude z)                          ===> |x_3|

(angle z)                              ===> x_angle

where  -  < x_angle <  with x_angle  =  x_4  +  2 n
for some integer n.

Rationale:  
Magnitude is the same as abs for a real argument,
but abs must be present in all implementations, whereas
magnitude need only be present in implementations that support
general complex numbers.")
    ("vector-set!" . "procedure:  (vector-set! vector k obj) 

k must be a valid index of vector.
Vector-set! stores obj in element k of vector.
The value returned by vector-set! is unspecified.  

(let ((vec (vector 0 '(2 2 2 2) \"Anna\")))

  (vector-set! vec 1 '(\"Sue\" \"Sue\"))

  vec)      
                ===>  #(0 (\"Sue\" \"Sue\") \"Anna\")

(vector-set! '#(0 1 2) 1 \"doe\")  
                ===>  error  ; constant vector")
    ("sin" . "procedure:  (sin z) 

procedure:  (cos z) 

procedure:  (tan z) 

procedure:  (asin z) 

procedure:  (acos z) 

procedure:  (atan z) 

procedure:  (atan y x) 

These procedures are part of every implementation that supports
general
real numbers; they compute the usual transcendental functions.  Log
computes the natural logarithm of z (not the base ten logarithm).
Asin, acos, and atan compute arcsine (sin-1),
arccosine (cos-1), and arctangent (tan-1), respectively.
The two-argument variant of atan computes (angle
(make-rectangular x y)) (see below), even in implementations
that don't support general complex numbers.

In general, the mathematical functions log, arcsine, arccosine, and
arctangent are multiply defined.
The value of log z is defined to be the one whose imaginary
part lies in the range from  -  (exclusive) to  (inclusive).
log 0 is undefined.
With log defined this way, the values of sin-1 z, cos-1 z,
and tan-1 z are according to the following formul&aelig;:

sin-1 z  =   - i log (i z  +  (1  -  z2)1/2)

cos-1 z  =   / 2  -  sin-1 z

tan-1 z  =  (log (1  +  i z)  -  log (1  -  i z)) / (2 i)

The above specification follows [27], which in turn
cites [19]; refer to these sources for more detailed
discussion of branch cuts, boundary conditions, and implementation of
these functions.  When it is possible these procedures produce a real
result from a real argument.")
    ("vector-ref" . "procedure:  (vector-ref vector k) 

k must be a valid index of vector.
Vector-ref returns the contents of element k of
vector.

(vector-ref '#(1 1 2 3 5 8 13 21)

            5)  
                ===>  8

(vector-ref '#(1 1 2 3 5 8 13 21)

            (let ((i (round (* 2 (acos -1)))))

              (if (inexact? i)

                  (inexact->exact i)

                  i))) 
                ===> 13")
    ("number->string" . "procedure:  (number->string z) 

procedure:  (number->string z radix) 

Radix must be an exact integer, either 2, 8, 10, or 16.  If omitted,
radix defaults to 10.
The procedure number->string takes a
number and a radix and returns as a string an external representation of
the given number in the given radix such that

(let ((number number)

      (radix radix))

  (eqv? number

        (string->number (number->string number

                                        radix)

                        radix)))

is true.  It is an error if no possible result makes this expression true.

If z is inexact, the radix is 10, and the above expression
can be satisfied by a result that contains a decimal point,
then the result contains a decimal point and is expressed using the
minimum number of digits (exclusive of exponent and trailing
zeroes) needed to make the above expression
true [3, 5];
otherwise the format of the result is unspecified.

The result returned by number->string
never contains an explicit radix prefix.

Note:  
The error case can occur only when z is not a complex number
or is a complex number with a non-rational real or imaginary part.

Rationale:  
If z is an inexact number represented using flonums, and
the radix is 10, then the above expression is normally satisfied by
a result containing a decimal point.  The unspecified case
allows for infinities, NaNs, and non-flonum representations.")
    ("close-output-port" . "procedure:  (close-output-port port) 

Closes the file associated with port, rendering the port
incapable of delivering or accepting characters.  
These routines have no effect if the file has already been closed.
The value returned is unspecified.")
    ("complex?" . "procedure:  (complex? obj) 

procedure:  (real? obj) 

procedure:  (rational? obj) 

procedure:  (integer? obj) 

These numerical type predicates can be applied to any kind of
argument, including non-numbers.  They return #t if the object is
of the named type, and otherwise they return #f.
In general, if a type predicate is true of a number then all higher
type predicates are also true of that number.  Consequently, if a type
predicate is false of a number, then all lower type predicates are
also false of that number.

If z is an inexact complex number, then (real? z) is true if
and only if (zero? (imag-part z)) is true.  If x is an inexact
real number, then (integer? x) is true if and only if
(= x (round x)).

(complex? 3+4i)                 ===>  #t

(complex? 3)                    ===>  #t

(real? 3)                       ===>  #t

(real? -2.5+0.0i)               ===>  #t

(real? #e1e10)                  ===>  #t

(rational? 6/10)                ===>  #t

(rational? 6/3)                 ===>  #t

(integer? 3+0i)                 ===>  #t

(integer? 3.0)                  ===>  #t

(integer? 8/4)                  ===>  #t

Note:  
The behavior of these type predicates on inexact numbers
is unreliable, since any inaccuracy may affect the result.

Note:  
In many implementations the rational? procedure will be the same
as real?, and the complex? procedure will be the same as
number?, but unusual implementations may be able to represent
some irrational numbers exactly or may extend the number system to
support some kind of non-complex numbers.")
    ("inexact->exact" . "procedure:  (inexact->exact z) 

Exact->inexact returns an inexact representation of z.
The value returned is the
inexact number that is numerically closest to the argument.  
If an exact argument has no reasonably close inexact equivalent,
then a violation of an implementation restriction may be reported.

Inexact->exact returns an exact representation of
z.  The value returned is the exact number that is numerically
closest to the argument.
If an inexact argument has no reasonably close exact equivalent,
then a violation of an implementation restriction may be reported.

These procedures implement the natural one-to-one correspondence between
exact and inexact integers throughout an
implementation-dependent range.  See section 6.2.3.")
    ("exact->inexact" . "procedure:  (exact->inexact z) 

procedure:  (inexact->exact z) 

Exact->inexact returns an inexact representation of z.
The value returned is the
inexact number that is numerically closest to the argument.  
If an exact argument has no reasonably close inexact equivalent,
then a violation of an implementation restriction may be reported.

Inexact->exact returns an exact representation of
z.  The value returned is the exact number that is numerically
closest to the argument.
If an inexact argument has no reasonably close exact equivalent,
then a violation of an implementation restriction may be reported.

These procedures implement the natural one-to-one correspondence between
exact and inexact integers throughout an
implementation-dependent range.  See section 6.2.3.")
    ("#d" . "6.2.4  Syntax of numerical constants

The syntax of the written representations for numbers is described formally in
section 7.1.1.  Note that case is not significant in numerical
constants.

A number may be written in binary, octal, decimal, or
hexadecimal by the use of a radix prefix.  The radix prefixes are #b (binary), #o (octal), #d (decimal), and #x (hexadecimal).  With
no radix prefix, a number is assumed to be expressed in decimal.

A
numerical constant may be specified to be either exact or
inexact by a prefix.  The prefixes are #e
for exact, and #i for inexact.  An exactness
prefix may appear before or after any radix prefix that is used.  If
the written representation of a number has no exactness prefix, the
constant may be either inexact or exact.  It is
inexact if it contains a decimal point, an
exponent, or a ``#'' character in the place of a digit,
otherwise it is exact.

In systems with inexact numbers
of varying precisions it may be useful to specify
the precision of a constant.  For this purpose, numerical constants
may be written with an exponent marker that indicates the
desired precision of the inexact
representation.  The letters s, f,
d, and l specify the use of short, single,
double, and long precision, respectively.  (When fewer
than four internal
inexact
representations exist, the four size
specifications are mapped onto those available.  For example, an
implementation with two internal representations may map short and
single together and long and double together.)  In addition, the
exponent marker e specifies the default precision for the
implementation.  The default precision has at least as much precision
as double, but
implementations may wish to allow this default to be set by the user.

3.14159265358979F0

        Round to single --- 3.141593

0.6L0

        Extend to long --- .600000000000000")
    ("interaction-environment" . "optional procedure:  (interaction-environment) 

This procedure returns a specifier for the environment that
contains implementation-defined bindings, typically a superset of
those listed in the report.  The intent is that this procedure
will return the environment in which the implementation would evaluate
expressions dynamically typed by the user.")
    ("#e" . "6.2.4  Syntax of numerical constants

The syntax of the written representations for numbers is described formally in
section 7.1.1.  Note that case is not significant in numerical
constants.

A number may be written in binary, octal, decimal, or
hexadecimal by the use of a radix prefix.  The radix prefixes are #b (binary), #o (octal), #d (decimal), and #x (hexadecimal).  With
no radix prefix, a number is assumed to be expressed in decimal.

A
numerical constant may be specified to be either exact or
inexact by a prefix.  The prefixes are #e
for exact, and #i for inexact.  An exactness
prefix may appear before or after any radix prefix that is used.  If
the written representation of a number has no exactness prefix, the
constant may be either inexact or exact.  It is
inexact if it contains a decimal point, an
exponent, or a ``#'' character in the place of a digit,
otherwise it is exact.

In systems with inexact numbers
of varying precisions it may be useful to specify
the precision of a constant.  For this purpose, numerical constants
may be written with an exponent marker that indicates the
desired precision of the inexact
representation.  The letters s, f,
d, and l specify the use of short, single,
double, and long precision, respectively.  (When fewer
than four internal
inexact
representations exist, the four size
specifications are mapped onto those available.  For example, an
implementation with two internal representations may map short and
single together and long and double together.)  In addition, the
exponent marker e specifies the default precision for the
implementation.  The default precision has at least as much precision
as double, but
implementations may wish to allow this default to be set by the user.

3.14159265358979F0

        Round to single --- 3.141593

0.6L0

        Extend to long --- .600000000000000")
    ("#f" . "6.3.1  Booleans

The standard boolean objects for true and false are written as
#t and #f.  What really
matters, though, are the objects that the Scheme conditional expressions
(if, cond, and, or, do) treat as
true or false.  The phrase ``a true value''
(or sometimes just ``true'') means any object treated as true by the
conditional expressions, and the phrase ``a false value'' (or
``false'') means any object treated as false by the conditional expressions.

Of all the standard Scheme values, only #f
counts as false in conditional expressions.
Except for #f,
all standard Scheme values, including #t,
pairs, the empty list, symbols, numbers, strings, vectors, and procedures,
count as true.

Note:  
Programmers accustomed to other dialects of Lisp should be aware that
Scheme distinguishes both #f and the empty list 
from the symbol nil.

Boolean constants evaluate to themselves, so they do not need to be quoted
in programs.

#t                 ===>  #t

#f                ===>  #f

'#f               ===>  #f")
    ("floor" . "procedure:  (floor x) 

procedure:  (ceiling x) 

procedure:  (truncate x) 

procedure:  (round x) 

These procedures return integers.
Floor returns the largest integer not larger than x.
Ceiling returns the smallest integer not smaller than x.
Truncate returns the integer closest to x whose absolute
value is not larger than the absolute value of x.  Round returns the
closest integer to x, rounding to even when x is halfway between two
integers.

Rationale:  
Round rounds to even for consistency with the default rounding
mode specified by the IEEE floating point standard.

Note:  
If the argument to one of these procedures is inexact, then the result
will also be inexact.  If an exact value is needed, the
result should be passed to the inexact->exact procedure.

(floor -4.3)                  ===>  -5.0

(ceiling -4.3)                ===>  -4.0

(truncate -4.3)               ===>  -4.0

(round -4.3)                  ===>  -4.0

(floor 3.5)                   ===>  3.0

(ceiling 3.5)                 ===>  4.0

(truncate 3.5)                ===>  3.0

(round 3.5)                   ===>  4.0  ; inexact

(round 7/2)                   ===>  4    ; exact

(round 7)                     ===>  7")
    ("transcript-off" . "optional procedure:  (transcript-off) 

Filename must be a string naming an output file to be
created. The effect of transcript-on is to open the named file
for output, and to cause a transcript of subsequent interaction between
the user and the Scheme system to be written to the file.  The
transcript is ended by a call to transcript-off, which closes the
transcript file.  Only one transcript may be in progress at any time,
though some implementations may relax this restriction.  The values
returned by these procedures are unspecified.")
    ("eval" . "procedure:  (eval expression environment-specifier) 

Evaluates expression in the specified environment and returns its value.
Expression must be a valid Scheme expression represented as data,
and environment-specifier must be a value returned by one of the
three procedures described below.
Implementations may extend eval to allow non-expression programs
(definitions) as the first argument and to allow other
values as environments, with the restriction that eval is not
allowed to create new bindings in the environments associated with
null-environment or scheme-report-environment.

(eval '(* 7 3) (scheme-report-environment 5))

                                                           ===>  21

(let ((f (eval '(lambda (f x) (f x x))

               (null-environment 5))))

  (f + 10))

                                                           ===>  20")
    ("#b" . "6.2.4  Syntax of numerical constants

The syntax of the written representations for numbers is described formally in
section 7.1.1.  Note that case is not significant in numerical
constants.

A number may be written in binary, octal, decimal, or
hexadecimal by the use of a radix prefix.  The radix prefixes are #b (binary), #o (octal), #d (decimal), and #x (hexadecimal).  With
no radix prefix, a number is assumed to be expressed in decimal.

A
numerical constant may be specified to be either exact or
inexact by a prefix.  The prefixes are #e
for exact, and #i for inexact.  An exactness
prefix may appear before or after any radix prefix that is used.  If
the written representation of a number has no exactness prefix, the
constant may be either inexact or exact.  It is
inexact if it contains a decimal point, an
exponent, or a ``#'' character in the place of a digit,
otherwise it is exact.

In systems with inexact numbers
of varying precisions it may be useful to specify
the precision of a constant.  For this purpose, numerical constants
may be written with an exponent marker that indicates the
desired precision of the inexact
representation.  The letters s, f,
d, and l specify the use of short, single,
double, and long precision, respectively.  (When fewer
than four internal
inexact
representations exist, the four size
specifications are mapped onto those available.  For example, an
implementation with two internal representations may map short and
single together and long and double together.)  In addition, the
exponent marker e specifies the default precision for the
implementation.  The default precision has at least as much precision
as double, but
implementations may wish to allow this default to be set by the user.

3.14159265358979F0

        Round to single --- 3.141593

0.6L0

        Extend to long --- .600000000000000")
    ("#i" . "6.2.4  Syntax of numerical constants

The syntax of the written representations for numbers is described formally in
section 7.1.1.  Note that case is not significant in numerical
constants.

A number may be written in binary, octal, decimal, or
hexadecimal by the use of a radix prefix.  The radix prefixes are #b (binary), #o (octal), #d (decimal), and #x (hexadecimal).  With
no radix prefix, a number is assumed to be expressed in decimal.

A
numerical constant may be specified to be either exact or
inexact by a prefix.  The prefixes are #e
for exact, and #i for inexact.  An exactness
prefix may appear before or after any radix prefix that is used.  If
the written representation of a number has no exactness prefix, the
constant may be either inexact or exact.  It is
inexact if it contains a decimal point, an
exponent, or a ``#'' character in the place of a digit,
otherwise it is exact.

In systems with inexact numbers
of varying precisions it may be useful to specify
the precision of a constant.  For this purpose, numerical constants
may be written with an exponent marker that indicates the
desired precision of the inexact
representation.  The letters s, f,
d, and l specify the use of short, single,
double, and long precision, respectively.  (When fewer
than four internal
inexact
representations exist, the four size
specifications are mapped onto those available.  For example, an
implementation with two internal representations may map short and
single together and long and double together.)  In addition, the
exponent marker e specifies the default precision for the
implementation.  The default precision has at least as much precision
as double, but
implementations may wish to allow this default to be set by the user.

3.14159265358979F0

        Round to single --- 3.141593

0.6L0

        Extend to long --- .600000000000000")
    ("#t" . "6.3.1  Booleans

The standard boolean objects for true and false are written as
#t and #f.  What really
matters, though, are the objects that the Scheme conditional expressions
(if, cond, and, or, do) treat as
true or false.  The phrase ``a true value''
(or sometimes just ``true'') means any object treated as true by the
conditional expressions, and the phrase ``a false value'' (or
``false'') means any object treated as false by the conditional expressions.

Of all the standard Scheme values, only #f
counts as false in conditional expressions.
Except for #f,
all standard Scheme values, including #t,
pairs, the empty list, symbols, numbers, strings, vectors, and procedures,
count as true.

Note:  
Programmers accustomed to other dialects of Lisp should be aware that
Scheme distinguishes both #f and the empty list 
from the symbol nil.

Boolean constants evaluate to themselves, so they do not need to be quoted
in programs.

#t                 ===>  #t

#f                ===>  #f

'#f               ===>  #f")
    ("#o" . "6.2.4  Syntax of numerical constants

The syntax of the written representations for numbers is described formally in
section 7.1.1.  Note that case is not significant in numerical
constants.

A number may be written in binary, octal, decimal, or
hexadecimal by the use of a radix prefix.  The radix prefixes are #b (binary), #o (octal), #d (decimal), and #x (hexadecimal).  With
no radix prefix, a number is assumed to be expressed in decimal.

A
numerical constant may be specified to be either exact or
inexact by a prefix.  The prefixes are #e
for exact, and #i for inexact.  An exactness
prefix may appear before or after any radix prefix that is used.  If
the written representation of a number has no exactness prefix, the
constant may be either inexact or exact.  It is
inexact if it contains a decimal point, an
exponent, or a ``#'' character in the place of a digit,
otherwise it is exact.

In systems with inexact numbers
of varying precisions it may be useful to specify
the precision of a constant.  For this purpose, numerical constants
may be written with an exponent marker that indicates the
desired precision of the inexact
representation.  The letters s, f,
d, and l specify the use of short, single,
double, and long precision, respectively.  (When fewer
than four internal
inexact
representations exist, the four size
specifications are mapped onto those available.  For example, an
implementation with two internal representations may map short and
single together and long and double together.)  In addition, the
exponent marker e specifies the default precision for the
implementation.  The default precision has at least as much precision
as double, but
implementations may wish to allow this default to be set by the user.

3.14159265358979F0

        Round to single --- 3.141593

0.6L0

        Extend to long --- .600000000000000")
    ("vector-fill!" . "library procedure:  (vector-fill! vector fill) 

Stores fill in every element of vector.
The value returned by vector-fill! is unspecified.")
    ("exact?" . "procedure:  (exact? z) 

procedure:  (inexact? z) 

These numerical predicates provide tests for the exactness of a
quantity.  For any Scheme number, precisely one of these predicates
is true.")
    ("values" . "procedure:  (values obj ...) 

Delivers all of its arguments to its continuation.
Except for continuations created by the call-with-values
procedure, all continuations take exactly one value.
Values might be defined as follows:

(define (values . things)

  (call-with-current-continuation 

    (lambda (cont) (apply cont things))))")
    ("let*" . "library syntax:  (let* <bindings> <body>) 

Syntax: <Bindings> should have the form

((<variable_1> <init_1>) ...),

and <body> should be a sequence of
one or more expressions.

Semantics: Let* is similar to let, but the bindings are performed
sequentially from left to right, and the region of a binding indicated
by (<variable> <init>) is that part of the let*
expression to the right of the binding.  Thus the second binding is done
in an environment in which the first binding is visible, and so on.

(let ((x 2) (y 3))

  (let* ((x 7)

         (z (+ x y)))

    (* z x)))                     ===>  70")
    ("list->string" . "library procedure:  (list->string list) 

String->list returns a newly allocated list of the
characters that make up the given string.  List->string
returns a newly allocated string formed from the characters in the list
list, which must be a list of characters. String->list
and list->string are
inverses so far as equal? is concerned.")
    ("min" . "library procedure:  (min x_1 x_2 ...) 

These procedures return the maximum or minimum of their arguments.

(max 3 4)                      ===>  4    ; exact

(max 3.9 4)                    ===>  4.0  ; inexact

Note:  
If any argument is inexact, then the result will also be inexact (unless
the procedure can prove that the inaccuracy is not large enough to affect the
result, which is possible only in unusual implementations).  If min or
max is used to compare numbers of mixed exactness, and the numerical
value of the result cannot be represented as an inexact number without loss of
accuracy, then the procedure may report a violation of an implementation
restriction.")
    ("string-set!" . "procedure:  (string-set! string k char) 

k must be a valid index of string.
String-set! stores char in element k of string
and returns an unspecified value.  

(define (f) (make-string 3 #\\*))

(define (g) \"***\")

(string-set! (f) 0 #\\?)          ===>  unspecified

(string-set! (g) 0 #\\?)          ===>  error

(string-set! (symbol->string 'immutable)

             0

             #\\?)          ===>  error")
    ("vector-length" . "procedure:  (vector-length vector) 

Returns the number of elements in vector as an exact integer.")
    ("char-ci>?" . "library procedure:  (char-ci>? char_1 char_2) 

library procedure:  (char-ci<=? char_1 char_2) 

library procedure:  (char-ci>=? char_1 char_2) 

These procedures are similar to char=? et cetera, but they treat
upper case and lower case letters as the same.  For example, (char-ci=? #\\A #\\a) returns #t.  Some
implementations may generalize these procedures to take more than two
arguments, as with the corresponding numerical predicates.")
    ("letrec" . "library syntax:  (letrec <bindings> <body>) 

Syntax: <Bindings> should have the form

((<variable_1> <init_1>) ...),

and <body> should be a sequence of
one or more expressions. It is an error for a <variable> to appear more
than once in the list of variables being bound.

Semantics: The <variable>s are bound to fresh locations holding undefined
values, the <init>s are evaluated in the resulting environment (in
some unspecified order), each <variable> is assigned to the result
of the corresponding <init>, the <body> is evaluated in the
resulting environment, and the value(s) of the last expression in
<body> is(are) returned.  Each binding of a <variable> has the
entire letrec expression as its region, making it possible to
define mutually recursive procedures.

(letrec ((even?

          (lambda (n)

            (if (zero? n)

                #t

                (odd? (- n 1)))))

         (odd?

          (lambda (n)

            (if (zero? n)

                #f

                (even? (- n 1))))))

  (even? 88))   

                        ===>  #t

One restriction on letrec is very important: it must be possible
to evaluate each <init> without assigning or referring to the value of any
<variable>.  If this restriction is violated, then it is an error.  The
restriction is necessary because Scheme passes arguments by value rather than by
name.  In the most common uses of letrec, all the <init>s are
lambda expressions and the restriction is satisfied automatically.")
    ("lambda" . "syntax:  (lambda <formals> <body>) 

Syntax: <Formals> should be a formal arguments list as described below,
and <body> should be a sequence of one or more expressions.

Semantics: A lambda expression evaluates to a procedure.  The environment in
effect when the lambda expression was evaluated is remembered as part of the
procedure.  When the procedure is later called with some actual
arguments, the environment in which the lambda expression was evaluated will
be extended by binding the variables in the formal argument list to
fresh locations, the corresponding actual argument values will be stored
in those locations, and the expressions in the body of the lambda expression
will be evaluated sequentially in the extended environment.
The result(s) of the last expression in the body will be returned as
the result(s) of the procedure call.

(lambda (x) (+ x x))              ===>  a procedure

((lambda (x) (+ x x)) 4)          ===>  8

(define reverse-subtract

  (lambda (x y) (- y x)))

(reverse-subtract 7 10)                 ===>  3

(define add4

  (let ((x 4))

    (lambda (y) (+ x y))))

(add4 6)                                ===>  10

<Formals> should have one of the following forms:

(<variable_1> ...):
The procedure takes a fixed number of arguments; when the procedure is
called, the arguments will be stored in the bindings of the
corresponding variables.

<variable>:
The procedure takes any number of arguments; when the procedure is
called, the sequence of actual arguments is converted into a newly
allocated list, and the list is stored in the binding of the
<variable>.

(<variable_1> ... <variable_n> .
<variable_n+1>):
If a space-delimited period precedes the last variable, then
the procedure takes n or more arguments, where n is the
number of formal arguments before the period (there must
be at least one).
The value stored in the binding of the last variable will be a
newly allocated
list of the actual arguments left over after all the other actual
arguments have been matched up against the other formal arguments.

It is an error for a <variable> to appear more than once in
<formals>.

((lambda x x) 3 4 5 6)                  ===>  (3 4 5 6)

((lambda (x y . z) z)

 3 4 5 6)                               ===>  (5 6)

Each procedure created as the result of evaluating a lambda expression is
(conceptually) tagged
with a storage location, in order to make eqv? and
eq? work on procedures (see section 6.1).")
    ("force" . "library procedure:  (force promise) 

Forces the value of promise (see delay,
section 4.2.5).  If no value has been computed for
the promise, then a value is computed and returned.  The value of the
promise is cached (or ``memoized'') so that if it is forced a second
time, the previously computed value is returned.

(force (delay (+ 1 2)))           ===>  3

(let ((p (delay (+ 1 2))))

  (list (force p) (force p)))  

                                       ===>  (3 3)

(define a-stream

  (letrec ((next

            (lambda (n)

              (cons n (delay (next (+ n 1)))))))

    (next 0)))

(define head car)

(define tail

  (lambda (stream) (force (cdr stream))))

(head (tail (tail a-stream)))  

                                       ===>  2

Force and delay are mainly intended for programs written in
functional style.  The following examples should not be considered to
illustrate good programming style, but they illustrate the property that
only one value is computed for a promise, no matter how many times it is
forced.

(define count 0)

(define p

  (delay (begin (set! count (+ count 1))

                (if (> count x)

                    count

                    (force p)))))

(define x 5)

p                             ===>  a promise

(force p)                     ===>  6

p                             ===>  a promise, still

(begin (set! x 10)

       (force p))             ===>  6

Here is a possible implementation of delay and force.
Promises are implemented here as procedures of no arguments,
and force simply calls its argument:

(define force

  (lambda (object)

    (object)))

We define the expression

(delay <expression>)

to have the same meaning as the procedure call

(make-promise (lambda () <expression>))

as follows

(define-syntax delay

  (syntax-rules ()

    ((delay expression)

     (make-promise (lambda () expression))))),

where make-promise is defined as follows:

(define make-promise

  (lambda (proc)

    (let ((result-ready? #f)

          (result #f))

      (lambda ()

        (if result-ready?

            result

            (let ((x (proc)))

              (if result-ready?

                  result

                  (begin (set! result-ready? #t)

                         (set! result x)

                         result))))))))

Rationale:  
A promise may refer to its own value, as in the last example above.
Forcing such a promise may cause the promise to be forced a second time
before the value of the first force has been computed.
This complicates the definition of make-promise.

Various extensions to this semantics of delay and force
are supported in some implementations:

Calling force on an object that is not a promise may simply
return the object.

It may be the case that there is no means by which a promise can be
operationally distinguished from its forced value.  That is, expressions
like the following may evaluate to either #t or to #f,
depending on the implementation:

(eqv? (delay 1) 1)                  ===>  unspecified

(pair? (delay (cons 1 2)))          ===>  unspecified

Some implementations may implement ``implicit forcing,'' where
the value of a promise is forced by primitive procedures like cdr
and +:

(+ (delay (* 3 7)) 13)          ===>  34")
    ("asin" . "procedure:  (asin z) 

procedure:  (acos z) 

procedure:  (atan z) 

procedure:  (atan y x) 

These procedures are part of every implementation that supports
general
real numbers; they compute the usual transcendental functions.  Log
computes the natural logarithm of z (not the base ten logarithm).
Asin, acos, and atan compute arcsine (sin-1),
arccosine (cos-1), and arctangent (tan-1), respectively.
The two-argument variant of atan computes (angle
(make-rectangular x y)) (see below), even in implementations
that don't support general complex numbers.

In general, the mathematical functions log, arcsine, arccosine, and
arctangent are multiply defined.
The value of log z is defined to be the one whose imaginary
part lies in the range from  -  (exclusive) to  (inclusive).
log 0 is undefined.
With log defined this way, the values of sin-1 z, cos-1 z,
and tan-1 z are according to the following formul&aelig;:

sin-1 z  =   - i log (i z  +  (1  -  z2)1/2)

cos-1 z  =   / 2  -  sin-1 z

tan-1 z  =  (log (1  +  i z)  -  log (1  -  i z)) / (2 i)

The above specification follows [27], which in turn
cites [19]; refer to these sources for more detailed
discussion of branch cuts, boundary conditions, and implementation of
these functions.  When it is possible these procedures produce a real
result from a real argument.")
    ("char<?" . "procedure:  (char<? char_1 char_2) 

procedure:  (char>? char_1 char_2) 

procedure:  (char<=? char_1 char_2) 

procedure:  (char>=? char_1 char_2) 

These procedures impose a total ordering on the set of characters.  It
is guaranteed that under this ordering:

The upper case characters are in order.  For example, (char<? #\\A #\\B) returns #t.
The lower case characters are in order.  For example, (char<? #\\a #\\b) returns #t.
The digits are in order.  For example, (char<? #\\0 #\\9) returns #t.
Either all the digits precede all the upper case letters, or vice versa.
Either all the digits precede all the lower case letters, or vice versa.

Some implementations may generalize these procedures to take more than
two arguments, as with the corresponding numerical predicates.")
    ("#x" . "6.2.4  Syntax of numerical constants

The syntax of the written representations for numbers is described formally in
section 7.1.1.  Note that case is not significant in numerical
constants.

A number may be written in binary, octal, decimal, or
hexadecimal by the use of a radix prefix.  The radix prefixes are #b (binary), #o (octal), #d (decimal), and #x (hexadecimal).  With
no radix prefix, a number is assumed to be expressed in decimal.

A
numerical constant may be specified to be either exact or
inexact by a prefix.  The prefixes are #e
for exact, and #i for inexact.  An exactness
prefix may appear before or after any radix prefix that is used.  If
the written representation of a number has no exactness prefix, the
constant may be either inexact or exact.  It is
inexact if it contains a decimal point, an
exponent, or a ``#'' character in the place of a digit,
otherwise it is exact.

In systems with inexact numbers
of varying precisions it may be useful to specify
the precision of a constant.  For this purpose, numerical constants
may be written with an exponent marker that indicates the
desired precision of the inexact
representation.  The letters s, f,
d, and l specify the use of short, single,
double, and long precision, respectively.  (When fewer
than four internal
inexact
representations exist, the four size
specifications are mapped onto those available.  For example, an
implementation with two internal representations may map short and
single together and long and double together.)  In addition, the
exponent marker e specifies the default precision for the
implementation.  The default precision has at least as much precision
as double, but
implementations may wish to allow this default to be set by the user.

3.14159265358979F0

        Round to single --- 3.141593

0.6L0

        Extend to long --- .600000000000000")
    ("and" . "library syntax:  (and <test_1> ...) 

The <test> expressions are evaluated from left to right, and the
value of the first expression that evaluates to a false value (see
section 6.3.1) is returned.  Any remaining expressions
are not evaluated.  If all the expressions evaluate to true values, the
value of the last expression is returned.  If there are no expressions
then #t is returned.

(and (= 2 2) (> 2 1))                   ===>  #t

(and (= 2 2) (< 2 1))                   ===>  #f

(and 1 2 'c '(f g))                     ===>  (f g)

(and)                                   ===>  #t")
    ("let-syntax" . "syntax:  (let-syntax <bindings> <body>) 

Syntax: <Bindings> should have the form

((<keyword> <transformer spec>) ...)

Each <keyword> is an identifier,
each <transformer spec> is an instance of syntax-rules, and
<body> should be a sequence of one or more expressions.  It is an error
for a <keyword> to appear more than once in the list of keywords
being bound.

Semantics: The <body> is expanded in the syntactic environment
obtained by extending the syntactic environment of the
let-syntax expression with macros whose keywords are
the <keyword>s, bound to the specified transformers.
Each binding of a <keyword> has <body> as its region.

(let-syntax ((when (syntax-rules ()

                     ((when test stmt1 stmt2 ...)

                      (if test

                          (begin stmt1

                                 stmt2 ...))))))

  (let ((if #t))

    (when if (set! if 'now))

    if))                                   ===>  now

(let ((x 'outer))

  (let-syntax ((m (syntax-rules () ((m) x))))

    (let ((x 'inner))

      (m))))                               ===>  outer")
    ("not" . "library procedure:  (not obj) 

Not returns #t if obj is false, and returns
#f otherwise.

(not #t)           ===>  #f

(not 3)                  ===>  #f

(not (list 3))           ===>  #f

(not #f)          ===>  #t

(not '())                ===>  #f

(not (list))             ===>  #f

(not 'nil)               ===>  #f")
    ("real-part" . "procedure:  (real-part z) 

procedure:  (imag-part z) 

procedure:  (magnitude z) 

procedure:  (angle z) 

These procedures are part of every implementation that supports
general
complex numbers.  Suppose x_1, x_2, x_3, and x_4 are
real numbers and z is a complex number such that

 z  =  x_1  +  x_2i
 =  x_3  &middot;  ei x_4

Then

(make-rectangular x_1 x_2)         ===> z

(make-polar x_3 x_4)             ===> z

(real-part z)                          ===> x_1

(imag-part z)                          ===> x_2

(magnitude z)                          ===> |x_3|

(angle z)                              ===> x_angle

where  -  < x_angle <  with x_angle  =  x_4  +  2 n
for some integer n.

Rationale:  
Magnitude is the same as abs for a real argument,
but abs must be present in all implementations, whereas
magnitude need only be present in implementations that support
general complex numbers.")
    ("make-polar" . "procedure:  (make-polar x_3 x_4) 

procedure:  (real-part z) 

procedure:  (imag-part z) 

procedure:  (magnitude z) 

procedure:  (angle z) 

These procedures are part of every implementation that supports
general
complex numbers.  Suppose x_1, x_2, x_3, and x_4 are
real numbers and z is a complex number such that

 z  =  x_1  +  x_2i
 =  x_3  &middot;  ei x_4

Then

(make-rectangular x_1 x_2)         ===> z

(make-polar x_3 x_4)             ===> z

(real-part z)                          ===> x_1

(imag-part z)                          ===> x_2

(magnitude z)                          ===> |x_3|

(angle z)                              ===> x_angle

where  -  < x_angle <  with x_angle  =  x_4  +  2 n
for some integer n.

Rationale:  
Magnitude is the same as abs for a real argument,
but abs must be present in all implementations, whereas
magnitude need only be present in implementations that support
general complex numbers.")
    ("string-length" . "procedure:  (string-length string) 

Returns the number of characters in the given string.")
    ("open-input-file" . "procedure:  (open-input-file filename) 

Takes a string naming an existing file and returns an input port capable of
delivering characters from the file.  If the file cannot be opened, an error is
signalled.")
    ("make-vector" . "procedure:  (make-vector k) 

procedure:  (make-vector k fill) 

Returns a newly allocated vector of k elements.  If a second
argument is given, then each element is initialized to fill.
Otherwise the initial contents of each element is unspecified.")
    ("string<?" . "library procedure:  (string<? string_1 string_2) 

library procedure:  (string>? string_1 string_2) 

library procedure:  (string<=? string_1 string_2) 

library procedure:  (string>=? string_1 string_2) 

library procedure:  (string-ci<? string_1 string_2) 

library procedure:  (string-ci>? string_1 string_2) 

library procedure:  (string-ci<=? string_1 string_2) 

library procedure:  (string-ci>=? string_1 string_2) 

These procedures are the lexicographic extensions to strings of the
corresponding orderings on characters.  For example, string<? is
the lexicographic ordering on strings induced by the ordering
char<? on characters.  If two strings differ in length but
are the same up to the length of the shorter string, the shorter string
is considered to be lexicographically less than the longer string.

Implementations may generalize these and the string=? and
string-ci=? procedures to take more than two arguments, as with
the corresponding numerical predicates.")
    ("apply" . "procedure:  (apply proc arg_1 ... args) 

Proc must be a procedure and args must be a list.
Calls proc with the elements of the list
(append (list arg_1 ...) args) as the actual
arguments.

(apply + (list 3 4))                      ===>  7

(define compose

  (lambda (f g)

    (lambda args

      (f (apply g args)))))

((compose sqrt *) 12 75)                      ===>  30")
    ("odd?" . "library procedure:  (odd? n) 

library procedure:  (even? n) 

These numerical predicates test a number for a particular property,
returning #t or #f.  See note above.")
    ("integer?" . "procedure:  (integer? obj) 

These numerical type predicates can be applied to any kind of
argument, including non-numbers.  They return #t if the object is
of the named type, and otherwise they return #f.
In general, if a type predicate is true of a number then all higher
type predicates are also true of that number.  Consequently, if a type
predicate is false of a number, then all lower type predicates are
also false of that number.

If z is an inexact complex number, then (real? z) is true if
and only if (zero? (imag-part z)) is true.  If x is an inexact
real number, then (integer? x) is true if and only if
(= x (round x)).

(complex? 3+4i)                 ===>  #t

(complex? 3)                    ===>  #t

(real? 3)                       ===>  #t

(real? -2.5+0.0i)               ===>  #t

(real? #e1e10)                  ===>  #t

(rational? 6/10)                ===>  #t

(rational? 6/3)                 ===>  #t

(integer? 3+0i)                 ===>  #t

(integer? 3.0)                  ===>  #t

(integer? 8/4)                  ===>  #t

Note:  
The behavior of these type predicates on inexact numbers
is unreliable, since any inaccuracy may affect the result.

Note:  
In many implementations the rational? procedure will be the same
as real?, and the complex? procedure will be the same as
number?, but unusual implementations may be able to represent
some irrational numbers exactly or may extend the number system to
support some kind of non-complex numbers.")
    ("char-ready?" . "procedure:  (char-ready?) 

procedure:  (char-ready? port) 

Returns #t if a character is ready on the input port and
returns #f otherwise.  If char-ready returns #t then
the next read-char operation on the given port is guaranteed
not to hang.  If the port is at end of file then char-ready?
returns #t.  Port may be omitted, in which case it defaults to
the value returned by current-input-port.

Rationale:  
Char-ready? exists to make it possible for a program to
accept characters from interactive ports without getting stuck waiting for
input.  Any input editors associated with such ports must ensure that
characters whose existence has been asserted by char-ready? cannot
be rubbed out.  If char-ready? were to return #f at end of
file, a port at end of file would be indistinguishable from an interactive
port that has no ready characters.")
    ("tan" . "procedure:  (tan z) 

procedure:  (asin z) 

procedure:  (acos z) 

procedure:  (atan z) 

procedure:  (atan y x) 

These procedures are part of every implementation that supports
general
real numbers; they compute the usual transcendental functions.  Log
computes the natural logarithm of z (not the base ten logarithm).
Asin, acos, and atan compute arcsine (sin-1),
arccosine (cos-1), and arctangent (tan-1), respectively.
The two-argument variant of atan computes (angle
(make-rectangular x y)) (see below), even in implementations
that don't support general complex numbers.

In general, the mathematical functions log, arcsine, arccosine, and
arctangent are multiply defined.
The value of log z is defined to be the one whose imaginary
part lies in the range from  -  (exclusive) to  (inclusive).
log 0 is undefined.
With log defined this way, the values of sin-1 z, cos-1 z,
and tan-1 z are according to the following formul&aelig;:

sin-1 z  =   - i log (i z  +  (1  -  z2)1/2)

cos-1 z  =   / 2  -  sin-1 z

tan-1 z  =  (log (1  +  i z)  -  log (1  -  i z)) / (2 i)

The above specification follows [27], which in turn
cites [19]; refer to these sources for more detailed
discussion of branch cuts, boundary conditions, and implementation of
these functions.  When it is possible these procedures produce a real
result from a real argument.")
    ("call-with-current-continuation" . "procedure:  (call-with-current-continuation proc) 

 Proc must be a procedure of one
argument. The procedure call-with-current-continuation packages
up the current continuation (see the rationale below) as an ``escape
procedure'' and passes it as an argument to
proc.  The escape procedure is a Scheme procedure that, if it is
later called, will abandon whatever continuation is in effect at that later
time and will instead use the continuation that was in effect
when the escape procedure was created.  Calling the escape procedure
may cause the invocation of before and after thunks installed using
dynamic-wind.

The escape procedure accepts the same number of arguments as the continuation to
the original call to call-with-current-continuation.
Except for continuations created by the call-with-values
procedure, all continuations take exactly one value.  The
effect of passing no value or more than one value to continuations
that were not created by call-with-values is unspecified.

The escape procedure that is passed to proc has
unlimited extent just like any other procedure in Scheme.  It may be stored
in variables or data structures and may be called as many times as desired.

The following examples show only the most common ways in which
call-with-current-continuation is used.  If all real uses were as
simple as these examples, there would be no need for a procedure with
the power of call-with-current-continuation.

(call-with-current-continuation

  (lambda (exit)

    (for-each (lambda (x)

                (if (negative? x)

                    (exit x)))

              '(54 0 37 -3 245 19))

    #t))                                ===>  -3

(define list-length

  (lambda (obj)

    (call-with-current-continuation

      (lambda (return)

        (letrec ((r

                  (lambda (obj)

                    (cond ((null? obj) 0)

                          ((pair? obj)

                           (+ (r (cdr obj)) 1))

                          (else (return #f))))))

          (r obj))))))

(list-length '(1 2 3 4))                    ===>  4

(list-length '(a b . c))                    ===>  #f

Rationale:  

A common use of call-with-current-continuation is for
structured, non-local exits from loops or procedure bodies, but in fact
call-with-current-continuation is extremely useful for implementing a
wide variety of advanced control structures.

Whenever a Scheme expression is evaluated there is a
continuation wanting the result of the expression.  The continuation
represents an entire (default) future for the computation.  If the expression is
evaluated at top level, for example, then the continuation might take the
result, print it on the screen, prompt for the next input, evaluate it, and
so on forever.  Most of the time the continuation includes actions
specified by user code, as in a continuation that will take the result,
multiply it by the value stored in a local variable, add seven, and give
the answer to the top level continuation to be printed.  Normally these
ubiquitous continuations are hidden behind the scenes and programmers do not
think much about them.  On rare occasions, however, a programmer may
need to deal with continuations explicitly.
Call-with-current-continuation allows Scheme programmers to do
that by creating a procedure that acts just like the current
continuation.

Most programming languages incorporate one or more special-purpose
escape constructs with names like exit, return, or
even goto.  In 1965, however, Peter Landin [16]
invented a general purpose escape operator called the J-operator.  John
Reynolds [24] described a simpler but equally powerful
construct in 1972.  The catch special form described by Sussman
and Steele in the 1975 report on Scheme is exactly the same as
Reynolds's construct, though its name came from a less general construct
in MacLisp.  Several Scheme implementors noticed that the full power of the
catch construct could be provided by a procedure instead of by a
special syntactic construct, and the name
call-with-current-continuation was coined in 1982.  This name is
descriptive, but opinions differ on the merits of such a long name, and
some people use the name call/cc instead.")
    ("call-with-values" . "procedure:  (call-with-values producer consumer) 

Calls its producer argument with no values and
a continuation that, when passed some values, calls the
consumer procedure with those values as arguments.
The continuation for the call to consumer is the
continuation of the call to call-with-values.

(call-with-values (lambda () (values 4 5))

                  (lambda (a b) b))

                                                           ===>  5

(call-with-values * -)                                     ===>  -1")
    ("'" . "syntax:  <constant> 

(quote <datum>) evaluates to <datum>.
<Datum>
may be any external representation of a Scheme object (see
section 3.3).  This notation is used to include literal
constants in Scheme code.

(quote a)                             ===>  a

(quote #(a b c))             ===>  #(a b c)

(quote (+ 1 2))                       ===>  (+ 1 2)

(quote <datum>) may be abbreviated as
'<datum>.  The two notations are equivalent in all
respects.

'a                           ===>  a

'#(a b c)                   ===>  #(a b c)

'()                          ===>  ()

'(+ 1 2)                     ===>  (+ 1 2)

'(quote a)                   ===>  (quote a)

''a                          ===>  (quote a)

Numerical constants, string constants, character constants, and boolean
constants evaluate ``to themselves''; they need not be quoted.

'\"abc\"             ===>  \"abc\"

\"abc\"              ===>  \"abc\"

'145932            ===>  145932

145932             ===>  145932

'#t          ===>  #t

#t           ===>  #t

As noted in section 3.4, it is an error to alter a constant
(i.e. the value of a literal expression) using a mutation procedure like
set-car! or string-set!.")
    ("char-ci<?" . "library procedure:  (char-ci<? char_1 char_2) 

library procedure:  (char-ci>? char_1 char_2) 

library procedure:  (char-ci<=? char_1 char_2) 

library procedure:  (char-ci>=? char_1 char_2) 

These procedures are similar to char=? et cetera, but they treat
upper case and lower case letters as the same.  For example, (char-ci=? #\\A #\\a) returns #t.  Some
implementations may generalize these procedures to take more than two
arguments, as with the corresponding numerical predicates.")
    ("char>=?" . "procedure:  (char>=? char_1 char_2) 

These procedures impose a total ordering on the set of characters.  It
is guaranteed that under this ordering:

The upper case characters are in order.  For example, (char<? #\\A #\\B) returns #t.
The lower case characters are in order.  For example, (char<? #\\a #\\b) returns #t.
The digits are in order.  For example, (char<? #\\0 #\\9) returns #t.
Either all the digits precede all the upper case letters, or vice versa.
Either all the digits precede all the lower case letters, or vice versa.

Some implementations may generalize these procedures to take more than
two arguments, as with the corresponding numerical predicates.")
    ("char>?" . "procedure:  (char>? char_1 char_2) 

procedure:  (char<=? char_1 char_2) 

procedure:  (char>=? char_1 char_2) 

These procedures impose a total ordering on the set of characters.  It
is guaranteed that under this ordering:

The upper case characters are in order.  For example, (char<? #\\A #\\B) returns #t.
The lower case characters are in order.  For example, (char<? #\\a #\\b) returns #t.
The digits are in order.  For example, (char<? #\\0 #\\9) returns #t.
Either all the digits precede all the upper case letters, or vice versa.
Either all the digits precede all the lower case letters, or vice versa.

Some implementations may generalize these procedures to take more than
two arguments, as with the corresponding numerical predicates.")
    ("..." . ":  (syntax-rules <literals> <syntax rule> ...) 

Syntax: <Literals> is a list of identifiers and each <syntax rule>
should be of the form

(<pattern> <template>)

The <pattern> in a <syntax rule> is a list <pattern>
that begins with the keyword for the macro.

A <pattern> is either an identifier, a constant, or one of the
following

(<pattern> ...)

(<pattern> <pattern> ... . <pattern>)

(<pattern> ... <pattern> <ellipsis>)

#(<pattern> ...)

#(<pattern> ... <pattern> <ellipsis>)

and a template is either an identifier, a constant, or one of the following

(<element> ...)

(<element> <element> ... . <template>)

#(<element> ...)

where an <element> is a <template> optionally
followed by an <ellipsis> and
an <ellipsis> is the identifier ``...'' (which cannot be used as
an identifier in either a template or a pattern).

Semantics: An instance of syntax-rules produces a new macro
transformer by specifying a sequence of hygienic rewrite rules.  A use
of a macro whose keyword is associated with a transformer specified by
syntax-rules is matched against the patterns contained in the
<syntax rule>s, beginning with the leftmost <syntax rule>.
When a match is found, the macro use is transcribed hygienically
according to the template.

An identifier that appears in the pattern of a <syntax rule> is
a pattern variable, unless it is the keyword that begins the pattern,
is listed in <literals>, or is the identifier ``...''.
Pattern variables match arbitrary input elements and
are used to refer to elements of the input in the template.  It is an
error for the same pattern variable to appear more than once in a
<pattern>.

The keyword at the beginning of the pattern in a
<syntax rule> is not involved in the matching and
is not considered a pattern variable or literal identifier.

Rationale:  
The scope of the keyword is determined by the expression or syntax
definition that binds it to the associated macro transformer.
If the keyword were a pattern variable or literal
identifier, then
the template that follows the pattern would be within its scope
regardless of whether the keyword were bound by let-syntax
or by letrec-syntax.

Identifiers that appear in <literals> are interpreted as literal
identifiers to be matched against corresponding subforms of the input.
A subform
in the input matches a literal identifier if and only if it is an
identifier
and either both its occurrence in the macro expression and its
occurrence in the macro definition have the same lexical binding, or
the two identifiers are equal and both have no lexical binding.

A subpattern followed by ... can match zero or more elements of the
input.  It is an error for ... to appear in <literals>.
Within a pattern the identifier ... must follow the last element of
a nonempty sequence of subpatterns.

More formally, an input form F matches a pattern P if and only if:

P is a non-literal identifier; or

P is a literal identifier and F is an identifier with the same
binding; or

P is a list (P_1 ... P_n) and F is a
list of n
forms that match P_1 through P_n, respectively; or

P is an improper list
(P_1 P_2 ... P_n . P_n+1)
and F is a list or
improper list of n or more forms that match P_1 through P_n,
respectively, and whose nth ``cdr'' matches P_n+1; or

P is of the form
(P_1 ... P_n P_n+1 <ellipsis>)
where <ellipsis> is the identifier ...
and F is
a proper list of at least n forms, the first n of which match
P_1 through P_n, respectively, and each remaining element of F
matches P_n+1; or

P is a vector of the form #(P_1 ... P_n)
and F is a vector
of n forms that match P_1 through P_n; or

P is of the form
#(P_1 ... P_n P_n+1 <ellipsis>)
where <ellipsis> is the identifier ...
and F is a vector of n
or more forms the first n of which match
P_1 through P_n, respectively, and each remaining element of F
matches P_n+1; or

P is a datum and F is equal to P in the sense of
the equal? procedure.

It is an error to use a macro keyword, within the scope of its
binding, in an expression that does not match any of the patterns.

When a macro use is transcribed according to the template of the
matching <syntax rule>, pattern variables that occur in the
template are replaced by the subforms they match in the input.
Pattern variables that occur in subpatterns followed by one or more
instances of the identifier
... are allowed only in subtemplates that are
followed by as many instances of ....
They are replaced in the
output by all of the subforms they match in the input, distributed as
indicated.  It is an error if the output cannot be built up as
specified.

Identifiers that appear in the template but are not pattern variables
or the identifier
... are inserted into the output as literal identifiers.  If a
literal identifier is inserted as a free identifier then it refers to the
binding of that identifier within whose scope the instance of
syntax-rules appears.
If a literal identifier is inserted as a bound identifier then it is
in effect renamed to prevent inadvertent captures of free identifiers.

As an example, if let and cond are defined as in
section 7.3 then they are hygienic (as required) and
the following is not an error.

(let ((=> #f))

  (cond (#t => 'ok)))                   ===> ok

The macro transformer for cond recognizes =>
as a local variable, and hence an expression, and not as the
top-level identifier =>, which the macro transformer treats
as a syntactic keyword.  Thus the example expands into

(let ((=> #f))

  (if #t (begin => 'ok)))

instead of

(let ((=> #f))

  (let ((temp #t))

    (if temp ('ok temp))))

which would result in an invalid procedure call.")
    ("current-input-port" . "procedure:  (current-input-port) 

procedure:  (current-output-port) 

Returns the current default input or output port.")
    ("eof-object?" . "procedure:  (eof-object? obj) 

Returns #t if obj is an end of file object, otherwise returns
#f.  The precise set of end of file objects will vary among
implementations, but in any case no end of file object will ever be an object
that can be read in using read.")
    ("display" . "library procedure:  (display obj) 

library procedure:  (display obj port) 

Writes a representation of obj to the given port.  Strings
that appear in the written representation are not enclosed in
doublequotes, and no characters are escaped within those strings.  Character
objects appear in the representation as if written by write-char
instead of by write.  Display returns an unspecified value.
The port argument may be omitted, in which case it defaults to the
value returned by current-output-port.

Rationale:  
Write is intended
for producing machine-readable output and display is for producing
human-readable output.  Implementations that allow ``slashification''
within symbols will probably want write but not display to
slashify funny characters in symbols.")
    ("string<=?" . "library procedure:  (string<=? string_1 string_2) 

library procedure:  (string>=? string_1 string_2) 

library procedure:  (string-ci<? string_1 string_2) 

library procedure:  (string-ci>? string_1 string_2) 

library procedure:  (string-ci<=? string_1 string_2) 

library procedure:  (string-ci>=? string_1 string_2) 

These procedures are the lexicographic extensions to strings of the
corresponding orderings on characters.  For example, string<? is
the lexicographic ordering on strings induced by the ordering
char<? on characters.  If two strings differ in length but
are the same up to the length of the shorter string, the shorter string
is considered to be lexicographically less than the longer string.

Implementations may generalize these and the string=? and
string-ci=? procedures to take more than two arguments, as with
the corresponding numerical predicates.")
    ("char-ci=?" . "library procedure:  (char-ci=? char_1 char_2) 

library procedure:  (char-ci<? char_1 char_2) 

library procedure:  (char-ci>? char_1 char_2) 

library procedure:  (char-ci<=? char_1 char_2) 

library procedure:  (char-ci>=? char_1 char_2) 

These procedures are similar to char=? et cetera, but they treat
upper case and lower case letters as the same.  For example, (char-ci=? #\\A #\\a) returns #t.  Some
implementations may generalize these procedures to take more than two
arguments, as with the corresponding numerical predicates.")
    ("null-environment" . "procedure:  (null-environment version) 

Version must be the exact integer 5,
corresponding to this revision of the Scheme report (the
Revised5 Report on Scheme).
Scheme-report-environment returns a specifier for an
environment that is empty except for all bindings defined in
this report that are either required or both optional and
supported by the implementation. Null-environment returns
a specifier for an environment that is empty except for the
(syntactic) bindings for all syntactic keywords defined in
this report that are either required or both optional and
supported by the implementation.

Other values of version can be used to specify environments
matching past revisions of this report, but their support is not
required.  An implementation will signal an error if version
is neither 5 nor another value supported by
the implementation.

The effect of assigning (through the use of eval) a variable
bound in a scheme-report-environment
(for example car) is unspecified.  Thus the environments specified
by scheme-report-environment may be immutable.")
    ("symbol->string" . "procedure:  (symbol->string symbol) 

Returns the name of symbol as a string.  If the symbol was part of
an object returned as the value of a literal expression
(section 4.1.2) or by a call to the read procedure,
and its name contains alphabetic characters, then the string returned
will contain characters in the implementation's preferred standard
case -- some implementations will prefer upper case, others lower case.
If the symbol was returned by string->symbol, the case of
characters in the string returned will be the same as the case in the
string that was passed to string->symbol.  It is an error
to apply mutation procedures like string-set! to strings returned
by this procedure.

The following examples assume that the implementation's standard case is
lower case:

(symbol->string 'flying-fish)     

                                          ===>  \"flying-fish\"

(symbol->string 'Martin)                  ===>  \"martin\"

(symbol->string

   (string->symbol \"Malvina\"))     

                                          ===>  \"Malvina\"")
    ("char=?" . "procedure:  (char=? char_1 char_2) 

procedure:  (char<? char_1 char_2) 

procedure:  (char>? char_1 char_2) 

procedure:  (char<=? char_1 char_2) 

procedure:  (char>=? char_1 char_2) 

These procedures impose a total ordering on the set of characters.  It
is guaranteed that under this ordering:

The upper case characters are in order.  For example, (char<? #\\A #\\B) returns #t.
The lower case characters are in order.  For example, (char<? #\\a #\\b) returns #t.
The digits are in order.  For example, (char<? #\\0 #\\9) returns #t.
Either all the digits precede all the upper case letters, or vice versa.
Either all the digits precede all the lower case letters, or vice versa.

Some implementations may generalize these procedures to take more than
two arguments, as with the corresponding numerical predicates.")
    ("case" . "library syntax:  (case <key> <clause_1> <clause_2> ...) 

Syntax: <Key> may be any expression.  Each <clause> should have
the form

((<datum_1> ...) <expression_1> <expression_2> ...),

where each <datum> is an external representation of some object.
All the <datum>s must be distinct.
The last <clause> may be an ``else clause,'' which has the form

(else <expression_1> <expression_2> ...).

Semantics: A case expression is evaluated as follows.  <Key> is
evaluated and its result is compared against each <datum>.  If the
result of evaluating <key> is equivalent (in the sense of
eqv?; see section 6.1) to a <datum>, then the
expressions in the corresponding <clause> are evaluated from left
to right and the result(s) of the last expression in the <clause> is(are)
returned as the result(s) of the case expression.  If the result of
evaluating <key> is different from every <datum>, then if
there is an else clause its expressions are evaluated and the
result(s) of the last is(are) the result(s) of the case expression;
otherwise the result of the case expression is unspecified.

(case (* 2 3)

  ((2 3 5 7) 'prime)

  ((1 4 6 8 9) 'composite))             ===>  composite

(case (car '(c d))

  ((a) 'a)

  ((b) 'b))                             ===>  unspecified

(case (car '(c d))

  ((a e i o u) 'vowel)

  ((w y) 'semivowel)

  (else 'consonant))                    ===>  consonant")
    ("cdr" . "procedure:  (cdr pair) 

Returns the contents of the cdr field of pair.
Note that it is an error to take the cdr of the empty list.

(cdr '((a) b c d))              ===>  (b c d)

(cdr '(1 . 2))                  ===>  2

(cdr '())                       ===>  error")
    ("string-append" . "library procedure:  (string-append string ...) 

Returns a newly allocated string whose characters form the concatenation of the
given strings.")
    ("gcd" . "library procedure:  (gcd n_1 ...) 

library procedure:  (lcm n_1 ...) 

These procedures return the greatest common divisor or least common
multiple of their arguments.  The result is always non-negative.

(gcd 32 -36)                    ===>  4

(gcd)                           ===>  0

(lcm 32 -36)                    ===>  288

(lcm 32.0 -36)                  ===>  288.0  ; inexact

(lcm)                           ===>  1")
    ("with-output-to-file" . "optional procedure:  (with-output-to-file string thunk) 

String should be a string naming a file, and
proc should be a procedure of no arguments.
For with-input-from-file,
the file should already exist; for
with-output-to-file,
the effect is unspecified if the file
already exists.
The file is opened for input or output, an input or output port
connected to it is made the default value returned by
current-input-port or current-output-port
(and is used by (read), (write obj), and so forth),
and the
thunk is called with no arguments.  When the thunk returns,
the port is closed and the previous default is restored.
With-input-from-file and with-output-to-file return(s) the
value(s) yielded by thunk.
If an escape procedure
is used to escape from the continuation of these procedures, their
behavior is implementation dependent.")
    ("char->integer" . "procedure:  (char->integer char) 

procedure:  (integer->char n) 

Given a character, char->integer returns an exact integer
representation of the character.  Given an exact integer that is the image of
a character under char->integer, integer->char
returns that character.  These procedures implement order-preserving isomorphisms
between the set of characters under the char<=? ordering and some
subset of the integers under the <= ordering.  That is, if

(char<=? a b) ===> #t  and  (<= x y) ===> #t

and x and y are in the domain of
integer->char, then

(<= (char->integer a)

    (char->integer b))                 ===>  #t

(char<=? (integer->char x)

         (integer->char y))             ===>  #t")
    ("real?" . "procedure:  (real? obj) 

procedure:  (rational? obj) 

procedure:  (integer? obj) 

These numerical type predicates can be applied to any kind of
argument, including non-numbers.  They return #t if the object is
of the named type, and otherwise they return #f.
In general, if a type predicate is true of a number then all higher
type predicates are also true of that number.  Consequently, if a type
predicate is false of a number, then all lower type predicates are
also false of that number.

If z is an inexact complex number, then (real? z) is true if
and only if (zero? (imag-part z)) is true.  If x is an inexact
real number, then (integer? x) is true if and only if
(= x (round x)).

(complex? 3+4i)                 ===>  #t

(complex? 3)                    ===>  #t

(real? 3)                       ===>  #t

(real? -2.5+0.0i)               ===>  #t

(real? #e1e10)                  ===>  #t

(rational? 6/10)                ===>  #t

(rational? 6/3)                 ===>  #t

(integer? 3+0i)                 ===>  #t

(integer? 3.0)                  ===>  #t

(integer? 8/4)                  ===>  #t

Note:  
The behavior of these type predicates on inexact numbers
is unreliable, since any inaccuracy may affect the result.

Note:  
In many implementations the rational? procedure will be the same
as real?, and the complex? procedure will be the same as
number?, but unusual implementations may be able to represent
some irrational numbers exactly or may extend the number system to
support some kind of non-complex numbers.")
    ("lcm" . "library procedure:  (lcm n_1 ...) 

These procedures return the greatest common divisor or least common
multiple of their arguments.  The result is always non-negative.

(gcd 32 -36)                    ===>  4

(gcd)                           ===>  0

(lcm 32 -36)                    ===>  288

(lcm 32.0 -36)                  ===>  288.0  ; inexact

(lcm)                           ===>  1")
    ("let" . "library syntax:  (let <bindings> <body>) 

Syntax: <Bindings> should have the form

((<variable_1> <init_1>) ...),

where each <init> is an expression, and <body> should be a
sequence of one or more expressions.  It is
an error for a <variable> to appear more than once in the list of variables
being bound.

Semantics: The <init>s are evaluated in the current environment (in some
unspecified order), the <variable>s are bound to fresh locations
holding the results, the <body> is evaluated in the extended
environment, and the value(s) of the last expression of <body>
is(are) returned.  Each binding of a <variable> has <body> as its
region.

(let ((x 2) (y 3))

  (* x y))                              ===>  6

(let ((x 2) (y 3))

  (let ((x 7)

        (z (+ x y)))

    (* z x)))                           ===>  35

See also named let, section 4.2.4.")
    ("truncate" . "procedure:  (truncate x) 

procedure:  (round x) 

These procedures return integers.
Floor returns the largest integer not larger than x.
Ceiling returns the smallest integer not smaller than x.
Truncate returns the integer closest to x whose absolute
value is not larger than the absolute value of x.  Round returns the
closest integer to x, rounding to even when x is halfway between two
integers.

Rationale:  
Round rounds to even for consistency with the default rounding
mode specified by the IEEE floating point standard.

Note:  
If the argument to one of these procedures is inexact, then the result
will also be inexact.  If an exact value is needed, the
result should be passed to the inexact->exact procedure.

(floor -4.3)                  ===>  -5.0

(ceiling -4.3)                ===>  -4.0

(truncate -4.3)               ===>  -4.0

(round -4.3)                  ===>  -4.0

(floor 3.5)                   ===>  3.0

(ceiling 3.5)                 ===>  4.0

(truncate 3.5)                ===>  3.0

(round 3.5)                   ===>  4.0  ; inexact

(round 7/2)                   ===>  4    ; exact

(round 7)                     ===>  7")
    ("list" . "library procedure:  (list obj ...) 

Returns a newly allocated list of its arguments.

(list 'a (+ 3 4) 'c)                    ===>  (a 7 c)

(list)                                  ===>  ()")
    ("string" . "library procedure:  (string char ...) 

Returns a newly allocated string composed of the arguments.")
    ("=" . "procedure:  (= z_1 z_2 z_3 ...) 

procedure:  (< x_1 x_2 x_3 ...) 

procedure:  (> x_1 x_2 x_3 ...) 

procedure:  (<= x_1 x_2 x_3 ...) 

procedure:  (>= x_1 x_2 x_3 ...) 

These procedures return #t if their arguments are (respectively):
equal, monotonically increasing, monotonically decreasing,
monotonically nondecreasing, or monotonically nonincreasing.

These predicates are required to be transitive.

Note:  
The traditional implementations of these predicates in Lisp-like
languages are not transitive.

Note:  
While it is not an error to compare inexact numbers using these
predicates, the results may be unreliable because a small inaccuracy
may affect the result; this is especially true of = and zero?.
When in doubt, consult a numerical analyst.")
    (">" . "procedure:  (> x_1 x_2 x_3 ...) 

procedure:  (<= x_1 x_2 x_3 ...) 

procedure:  (>= x_1 x_2 x_3 ...) 

These procedures return #t if their arguments are (respectively):
equal, monotonically increasing, monotonically decreasing,
monotonically nondecreasing, or monotonically nonincreasing.

These predicates are required to be transitive.

Note:  
The traditional implementations of these predicates in Lisp-like
languages are not transitive.

Note:  
While it is not an error to compare inexact numbers using these
predicates, the results may be unreliable because a small inaccuracy
may affect the result; this is especially true of = and zero?.
When in doubt, consult a numerical analyst.")
    ("write-char" . "procedure:  (write-char char) 

procedure:  (write-char char port) 

Writes the character char (not an external representation of the
character) to the given port and returns an unspecified value.  The
port argument may be omitted, in which case it defaults to the value
returned by current-output-port.")
    (";" . "2.2  Whitespace and comments

Whitespace characters are spaces and newlines.
(Implementations typically provide additional whitespace characters such
as tab or page break.)  Whitespace is used for improved readability and
as necessary to separate tokens from each other, a token being an
indivisible lexical unit such as an identifier or number, but is
otherwise insignificant.  Whitespace may occur between any two tokens,
but not within a token.  Whitespace may also occur inside a string,
where it is significant.

A semicolon (;) indicates the start of a
comment.  The comment continues to the
end of the line on which the semicolon appears.  Comments are invisible
to Scheme, but the end of the line is visible as whitespace.  This
prevents a comment from appearing in the middle of an identifier or
number.

;;; The FACT procedure computes the factorial

;;; of a non-negative integer.

(define fact

  (lambda (n)

    (if (= n 0)

        1        ;Base case: return 1

        (* n (fact (- n 1))))))")
    ("<" . "procedure:  (< x_1 x_2 x_3 ...) 

procedure:  (> x_1 x_2 x_3 ...) 

procedure:  (<= x_1 x_2 x_3 ...) 

procedure:  (>= x_1 x_2 x_3 ...) 

These procedures return #t if their arguments are (respectively):
equal, monotonically increasing, monotonically decreasing,
monotonically nondecreasing, or monotonically nonincreasing.

These predicates are required to be transitive.

Note:  
The traditional implementations of these predicates in Lisp-like
languages are not transitive.

Note:  
While it is not an error to compare inexact numbers using these
predicates, the results may be unreliable because a small inaccuracy
may affect the result; this is especially true of = and zero?.
When in doubt, consult a numerical analyst.")
    ("list?" . "library procedure:  (list? obj) 

Returns #t if obj is a list, otherwise returns #f.
By definition, all lists have finite length and are terminated by
the empty list.

        (list? '(a b c))             ===>  #t

        (list? '())                  ===>  #t

        (list? '(a . b))             ===>  #f

        (let ((x (list 'a)))

          (set-cdr! x x)

          (list? x))                 ===>  #f")
    ("define-syntax" . "5.3  Syntax definitions

Syntax definitions are valid only at the top level of a <program>.

They have the following form:

(define-syntax <keyword> <transformer spec>)

<Keyword> is an identifier, and
the <transformer spec> should be an instance of syntax-rules.
The top-level syntactic environment is extended by binding the
<keyword> to the specified transformer.

There is no define-syntax analogue of internal definitions.

Although macros may expand into definitions and syntax definitions in
any context that permits them, it is an error for a definition or syntax
definition to shadow a syntactic keyword whose meaning is needed to
determine whether some form in the group of forms that contains the
shadowing definition is in fact a definition, or, for internal definitions,
is needed to determine the boundary between the group and the expressions
that follow the group.  For example, the following are errors:

(define define 3)

(begin (define begin list))

(let-syntax

  ((foo (syntax-rules ()

          ((foo (proc args ...) body ...)

           (define proc

             (lambda (args ...)

               body ...))))))

  (let ((x 3))

    (foo (plus x y) (+ x y))

    (define foo x)

    (plus foo x)))")
    ("/" . "procedure:  (/ z_1 z_2) 

procedure:  (/ z) 

optional procedure:  (/ z_1 z_2 ...) 

With two or more arguments, these procedures return the difference or
quotient of their arguments, associating to the left.  With one argument,
however, they return the additive or multiplicative inverse of their argument.

(- 3 4)                         ===>  -1

(- 3 4 5)                       ===>  -6

(- 3)                           ===>  -3

(/ 3 4 5)                       ===>  3/20

(/ 3)                           ===>  1/3")
    ("-" . "procedure:  (- z_1 z_2) 

procedure:  (- z) 

optional procedure:  (- z_1 z_2 ...) 

procedure:  (/ z_1 z_2) 

procedure:  (/ z) 

optional procedure:  (/ z_1 z_2 ...) 

With two or more arguments, these procedures return the difference or
quotient of their arguments, associating to the left.  With one argument,
however, they return the additive or multiplicative inverse of their argument.

(- 3 4)                         ===>  -1

(- 3 4 5)                       ===>  -6

(- 3)                           ===>  -3

(/ 3 4 5)                       ===>  3/20

(/ 3)                           ===>  1/3")
    ("+" . "procedure:  (+ z_1 ...) 

procedure:  (* z_1 ...) 

These procedures return the sum or product of their arguments.

(+ 3 4)                         ===>  7

(+ 3)                           ===>  3

(+)                             ===>  0

(* 4)                           ===>  4

(*)                             ===>  1")
    ("," . "syntax:  `<qq template> 

``Backquote'' or ``quasiquote'' expressions are useful
for constructing a list or vector structure when most but not all of the
desired structure is known in advance.  If no
commas appear within the <qq template>, the result of
evaluating
`<qq template> is equivalent to the result of evaluating
'<qq template>.  If a comma appears within the
<qq template>, however, the expression following the comma is
evaluated (``unquoted'') and its result is inserted into the structure
instead of the comma and the expression.  If a comma appears followed
immediately by an at-sign (@), then the following
expression must evaluate to a list; the opening and closing parentheses
of the list are then ``stripped away'' and the elements of the list are
inserted in place of the comma at-sign expression sequence.  A comma
at-sign should only appear within a list or vector <qq template>.

`(list ,(+ 1 2) 4)          ===>  (list 3 4)

(let ((name 'a)) `(list ,name ',name))           
                ===>  (list a (quote a))

`(a ,(+ 1 2) ,@(map abs '(4 -5 6)) b)           
                ===>  (a 3 4 5 6 b)

`(( foo ,(- 10 3)) ,@(cdr '(c)) . ,(car '(cons)))           
                ===>  ((foo 7) . cons)

`#(10 5 ,(sqrt 4) ,@(map sqrt '(16 9)) 8)           
                ===>  #(10 5 2 4 3 8)

Quasiquote forms may be nested.  Substitutions are made only for
unquoted components appearing at the same nesting level
as the outermost backquote.  The nesting level increases by one inside
each successive quasiquotation, and decreases by one inside each
unquotation.

`(a `(b ,(+ 1 2) ,(foo ,(+ 1 3) d) e) f)           
                ===>  (a `(b ,(+ 1 2) ,(foo 4 d) e) f)

(let ((name1 'x)

      (name2 'y))

  `(a `(b ,,name1 ,',name2 d) e))           
                ===>  (a `(b ,x ,'y d) e)

The two notations
`<qq template> and (quasiquote <qq template>)
are identical in all respects.
,<expression> is identical to (unquote <expression>),
and
,@<expression> is identical to (unquote-splicing <expression>).
The external syntax generated by write for two-element lists whose
car is one of these symbols may vary between implementations.

(quasiquote (list (unquote (+ 1 2)) 4))           
                ===>  (list 3 4)

'(quasiquote (list (unquote (+ 1 2)) 4))           
                ===>  `(list ,(+ 1 2) 4)

     i.e., (quasiquote (list (unquote (+ 1 2)) 4))

Unpredictable behavior can result if any of the symbols
quasiquote, unquote, or unquote-splicing appear in
positions within a <qq template> otherwise than as described above.")
    ("*" . "procedure:  (* z_1 ...) 

These procedures return the sum or product of their arguments.

(+ 3 4)                         ===>  7

(+ 3)                           ===>  3

(+)                             ===>  0

(* 4)                           ===>  4

(*)                             ===>  1")
    ("eqv?" . "procedure:  (eqv? obj_1 obj_2) 

The eqv? procedure defines a useful equivalence relation on objects.
Briefly, it returns #t if obj_1 and obj_2 should
normally be regarded as the same object.  This relation is left slightly
open to interpretation, but the following partial specification of
eqv? holds for all implementations of Scheme.

The eqv? procedure returns #t if:

obj_1 and obj_2 are both #t or both #f.

obj_1 and obj_2 are both symbols and

(string=? (symbol->string obj1)

          (symbol->string obj2))

            ===>  #t

Note:   
This assumes that neither obj_1 nor obj_2 is an ``uninterned
symbol'' as alluded to in section 6.3.3.  This report does
not presume to specify the behavior of eqv? on implementation-dependent
extensions.

obj_1 and obj_2 are both numbers, are numerically
equal (see =, section 6.2), and are either both
exact or both inexact.

obj_1 and obj_2 are both characters and are the same
character according to the char=? procedure
(section 6.3.4).

both obj_1 and obj_2 are the empty list.

obj_1 and obj_2 are pairs, vectors, or strings that denote the
same locations in the store (section 3.4).

obj_1 and obj_2 are procedures whose location tags are
equal (section 4.1.4).

The eqv? procedure returns #f if:

obj_1 and obj_2 are of different types
(section 3.2).

one of obj_1 and obj_2 is #t but the other is
#f.

obj_1 and obj_2 are symbols but

(string=? (symbol->string obj_1)

          (symbol->string obj_2))

            ===>  #f

one of obj_1 and obj_2 is an exact number but the other
is an inexact number.

obj_1 and obj_2 are numbers for which the =
procedure returns #f.

obj_1 and obj_2 are characters for which the char=?
procedure returns #f.

one of obj_1 and obj_2 is the empty list but the other
is not.

obj_1 and obj_2 are pairs, vectors, or strings that denote
distinct locations.

obj_1 and obj_2 are procedures that would behave differently
(return different value(s) or have different side effects) for some arguments.

(eqv? 'a 'a)                             ===>  #t

(eqv? 'a 'b)                             ===>  #f

(eqv? 2 2)                               ===>  #t

(eqv? '() '())                           ===>  #t

(eqv? 100000000 100000000)               ===>  #t

(eqv? (cons 1 2) (cons 1 2))             ===>  #f

(eqv? (lambda () 1)

      (lambda () 2))                     ===>  #f

(eqv? #f 'nil)                          ===>  #f

(let ((p (lambda (x) x)))

  (eqv? p p))                                 ===>  #t

The following examples illustrate cases in which the above rules do
not fully specify the behavior of eqv?.  All that can be said
about such cases is that the value returned by eqv? must be a
boolean.

(eqv? \"\" \"\")                     ===>  unspecified

(eqv? '#() '#())                 ===>  unspecified

(eqv? (lambda (x) x)

      (lambda (x) x))            ===>  unspecified

(eqv? (lambda (x) x)

      (lambda (y) y))            ===>  unspecified

The next set of examples shows the use of eqv? with procedures
that have local state.  Gen-counter must return a distinct
procedure every time, since each procedure has its own internal counter.
Gen-loser, however, returns equivalent procedures each time, since
the local state does not affect the value or side effects of the
procedures.

(define gen-counter

  (lambda ()

    (let ((n 0))

      (lambda () (set! n (+ n 1)) n))))

(let ((g (gen-counter)))

  (eqv? g g))                   ===>  #t

(eqv? (gen-counter) (gen-counter))

                                ===>  #f

(define gen-loser

  (lambda ()

    (let ((n 0))

      (lambda () (set! n (+ n 1)) 27))))

(let ((g (gen-loser)))

  (eqv? g g))                   ===>  #t

(eqv? (gen-loser) (gen-loser))

                                ===>  unspecified

(letrec ((f (lambda () (if (eqv? f g) 'both 'f)))

         (g (lambda () (if (eqv? f g) 'both 'g))))

  (eqv? f g))

                                ===>  unspecified

(letrec ((f (lambda () (if (eqv? f g) 'f 'both)))

         (g (lambda () (if (eqv? f g) 'g 'both))))

  (eqv? f g))

                                ===>  #f

Since it is an error to modify constant objects (those returned by
literal expressions), implementations are permitted, though not
required, to share structure between constants where appropriate.  Thus
the value of eqv? on constants is sometimes
implementation-dependent.

(eqv? '(a) '(a))                         ===>  unspecified

(eqv? \"a\" \"a\")                           ===>  unspecified

(eqv? '(b) (cdr '(a b)))                 ===>  unspecified

(let ((x '(a)))

  (eqv? x x))                            ===>  #t

Rationale:   
The above definition of eqv? allows implementations latitude in
their treatment of procedures and literals:  implementations are free
either to detect or to fail to detect that two procedures or two literals
are equivalent to each other, and can decide whether or not to
merge representations of equivalent objects by using the same pointer or
bit pattern to represent both.")
    ("`" . "syntax:  `<qq template> 

``Backquote'' or ``quasiquote'' expressions are useful
for constructing a list or vector structure when most but not all of the
desired structure is known in advance.  If no
commas appear within the <qq template>, the result of
evaluating
`<qq template> is equivalent to the result of evaluating
'<qq template>.  If a comma appears within the
<qq template>, however, the expression following the comma is
evaluated (``unquoted'') and its result is inserted into the structure
instead of the comma and the expression.  If a comma appears followed
immediately by an at-sign (@), then the following
expression must evaluate to a list; the opening and closing parentheses
of the list are then ``stripped away'' and the elements of the list are
inserted in place of the comma at-sign expression sequence.  A comma
at-sign should only appear within a list or vector <qq template>.

`(list ,(+ 1 2) 4)          ===>  (list 3 4)

(let ((name 'a)) `(list ,name ',name))           
                ===>  (list a (quote a))

`(a ,(+ 1 2) ,@(map abs '(4 -5 6)) b)           
                ===>  (a 3 4 5 6 b)

`(( foo ,(- 10 3)) ,@(cdr '(c)) . ,(car '(cons)))           
                ===>  ((foo 7) . cons)

`#(10 5 ,(sqrt 4) ,@(map sqrt '(16 9)) 8)           
                ===>  #(10 5 2 4 3 8)

Quasiquote forms may be nested.  Substitutions are made only for
unquoted components appearing at the same nesting level
as the outermost backquote.  The nesting level increases by one inside
each successive quasiquotation, and decreases by one inside each
unquotation.

`(a `(b ,(+ 1 2) ,(foo ,(+ 1 3) d) e) f)           
                ===>  (a `(b ,(+ 1 2) ,(foo 4 d) e) f)

(let ((name1 'x)

      (name2 'y))

  `(a `(b ,,name1 ,',name2 d) e))           
                ===>  (a `(b ,x ,'y d) e)

The two notations
`<qq template> and (quasiquote <qq template>)
are identical in all respects.
,<expression> is identical to (unquote <expression>),
and
,@<expression> is identical to (unquote-splicing <expression>).
The external syntax generated by write for two-element lists whose
car is one of these symbols may vary between implementations.

(quasiquote (list (unquote (+ 1 2)) 4))           
                ===>  (list 3 4)

'(quasiquote (list (unquote (+ 1 2)) 4))           
                ===>  `(list ,(+ 1 2) 4)

     i.e., (quasiquote (list (unquote (+ 1 2)) 4))

Unpredictable behavior can result if any of the symbols
quasiquote, unquote, or unquote-splicing appear in
positions within a <qq template> otherwise than as described above.")
    ("char?" . "3.2  Disjointness of types

No object satisfies more than one of the following predicates:

boolean?          pair?

symbol?           number?

char?             string?

vector?           port?

procedure?

These predicates define the types boolean, pair, symbol, number, char (or character), string, vector, port, and procedure.  The empty list is a special
object of its own type; it satisfies none of the above predicates.

Although there is a separate boolean type,
any Scheme value can be used as a boolean value for the purpose of a
conditional test.  As explained in section 6.3.1, all
values count as true in such a test except for #f.
This report uses the word ``true'' to refer to any
Scheme value except #f, and the word ``false'' to refer to
#f.")
    ("list-ref" . "library procedure:  (list-ref list k) 

Returns the kth element of list.  (This is the same
as the car of (list-tail list k).)
It is an error if list has fewer than k elements.

(list-ref '(a b c d) 2)                         ===>  c

(list-ref '(a b c d)

          (inexact->exact (round 1.8))) 
                ===>  c")
    ("eq?" . "procedure:  (eq? obj_1 obj_2) 

Eq? is similar to eqv? except that in some cases it is
capable of discerning distinctions finer than those detectable by
eqv?.

Eq? and eqv? are guaranteed to have the same
behavior on symbols, booleans, the empty list, pairs, procedures,
and non-empty
strings and vectors.  Eq?'s behavior on numbers and characters is
implementation-dependent, but it will always return either true or
false, and will return true only when eqv? would also return
true.  Eq? may also behave differently from eqv? on empty
vectors and empty strings.

(eq? 'a 'a)                             ===>  #t

(eq? '(a) '(a))                         ===>  unspecified

(eq? (list 'a) (list 'a))               ===>  #f

(eq? \"a\" \"a\")                           ===>  unspecified

(eq? \"\" \"\")                             ===>  unspecified

(eq? '() '())                           ===>  #t

(eq? 2 2)                               ===>  unspecified

(eq? #\\A #\\A)         ===>  unspecified

(eq? car car)                           ===>  #t

(let ((n (+ 2 3)))

  (eq? n n))              ===>  unspecified

(let ((x '(a)))

  (eq? x x))              ===>  #t

(let ((x '#()))

  (eq? x x))              ===>  #t

(let ((p (lambda (x) x)))

  (eq? p p))              ===>  #t

Rationale:   It will usually be possible to implement eq? much
more efficiently than eqv?, for example, as a simple pointer
comparison instead of as some more complicated operation.  One reason is
that it may not be possible to compute eqv? of two numbers in
constant time, whereas eq? implemented as pointer comparison will
always finish in constant time.  Eq? may be used like eqv?
in applications using procedures to implement objects with state since
it obeys the same constraints as eqv?.")
    ("char-alphabetic?" . "library procedure:  (char-alphabetic? char) 

library procedure:  (char-numeric? char) 

library procedure:  (char-whitespace? char) 

library procedure:  (char-upper-case? letter) 

library procedure:  (char-lower-case? letter) 

These procedures return #t if their arguments are alphabetic,
numeric, whitespace, upper case, or lower case characters, respectively,
otherwise they return #f.  The following remarks, which are specific to
the ASCII character set, are intended only as a guide:  The alphabetic characters
are the 52 upper and lower case letters.  The numeric characters are the
ten decimal digits.  The whitespace characters are space, tab, line
feed, form feed, and carriage return.")
    ("transcript-on" . "optional procedure:  (transcript-on filename) 

optional procedure:  (transcript-off) 

Filename must be a string naming an output file to be
created. The effect of transcript-on is to open the named file
for output, and to cause a transcript of subsequent interaction between
the user and the Scheme system to be written to the file.  The
transcript is ended by a call to transcript-off, which closes the
transcript file.  Only one transcript may be in progress at any time,
though some implementations may relax this restriction.  The values
returned by these procedures are unspecified.")
    ("append" . "library procedure:  (append list ...) 

Returns a list consisting of the elements of the first list
followed by the elements of the other lists.

(append '(x) '(y))                      ===>  (x y)

(append '(a) '(b c d))                  ===>  (a b c d)

(append '(a (b)) '((c)))                ===>  (a (b) (c))

The resulting list is always newly allocated, except that it shares
structure with the last list argument.  The last argument may
actually be any object; an improper list results if the last argument is not a
proper list.  

(append '(a b) '(c . d))                ===>  (a b c . d)

(append '() 'a)                         ===>  a")
    ("caar" . "library procedure:  (caar pair) 

library procedure:  (cadr pair) 

                                                 :                                                    

library procedure:  (cdddar pair) 

library procedure:  (cddddr pair) 

These procedures are compositions of car and cdr, where
for example caddr could be defined by

(define caddr (lambda (x) (car (cdr (cdr x))))).

Arbitrary compositions, up to four deep, are provided.  There are
twenty-eight of these procedures in all.")
    ("or" . "library syntax:  (or <test_1> ...) 

The <test> expressions are evaluated from left to right, and the value of the
first expression that evaluates to a true value (see
section 6.3.1) is returned.  Any remaining expressions
are not evaluated.  If all expressions evaluate to false values, the
value of the last expression is returned.  If there are no
expressions then #f is returned.

(or (= 2 2) (> 2 1))                    ===>  #t

(or (= 2 2) (< 2 1))                    ===>  #t

(or #f #f #f)         ===>  #f

(or (memq 'b '(a b c)) 

    (/ 3 0))                            ===>  (b c)")
    ("string-copy" . "library procedure:  (string-copy string) 

Returns a newly allocated copy of the given string.")
    ("max" . "library procedure:  (max x_1 x_2 ...) 

library procedure:  (min x_1 x_2 ...) 

These procedures return the maximum or minimum of their arguments.

(max 3 4)                      ===>  4    ; exact

(max 3.9 4)                    ===>  4.0  ; inexact

Note:  
If any argument is inexact, then the result will also be inexact (unless
the procedure can prove that the inaccuracy is not large enough to affect the
result, which is possible only in unusual implementations).  If min or
max is used to compare numbers of mixed exactness, and the numerical
value of the result cannot be represented as an inexact number without loss of
accuracy, then the procedure may report a violation of an implementation
restriction.")
    ("syntax-rules" . ":  (syntax-rules <literals> <syntax rule> ...) 

Syntax: <Literals> is a list of identifiers and each <syntax rule>
should be of the form

(<pattern> <template>)

The <pattern> in a <syntax rule> is a list <pattern>
that begins with the keyword for the macro.

A <pattern> is either an identifier, a constant, or one of the
following

(<pattern> ...)

(<pattern> <pattern> ... . <pattern>)

(<pattern> ... <pattern> <ellipsis>)

#(<pattern> ...)

#(<pattern> ... <pattern> <ellipsis>)

and a template is either an identifier, a constant, or one of the following

(<element> ...)

(<element> <element> ... . <template>)

#(<element> ...)

where an <element> is a <template> optionally
followed by an <ellipsis> and
an <ellipsis> is the identifier ``...'' (which cannot be used as
an identifier in either a template or a pattern).

Semantics: An instance of syntax-rules produces a new macro
transformer by specifying a sequence of hygienic rewrite rules.  A use
of a macro whose keyword is associated with a transformer specified by
syntax-rules is matched against the patterns contained in the
<syntax rule>s, beginning with the leftmost <syntax rule>.
When a match is found, the macro use is transcribed hygienically
according to the template.

An identifier that appears in the pattern of a <syntax rule> is
a pattern variable, unless it is the keyword that begins the pattern,
is listed in <literals>, or is the identifier ``...''.
Pattern variables match arbitrary input elements and
are used to refer to elements of the input in the template.  It is an
error for the same pattern variable to appear more than once in a
<pattern>.

The keyword at the beginning of the pattern in a
<syntax rule> is not involved in the matching and
is not considered a pattern variable or literal identifier.

Rationale:  
The scope of the keyword is determined by the expression or syntax
definition that binds it to the associated macro transformer.
If the keyword were a pattern variable or literal
identifier, then
the template that follows the pattern would be within its scope
regardless of whether the keyword were bound by let-syntax
or by letrec-syntax.

Identifiers that appear in <literals> are interpreted as literal
identifiers to be matched against corresponding subforms of the input.
A subform
in the input matches a literal identifier if and only if it is an
identifier
and either both its occurrence in the macro expression and its
occurrence in the macro definition have the same lexical binding, or
the two identifiers are equal and both have no lexical binding.

A subpattern followed by ... can match zero or more elements of the
input.  It is an error for ... to appear in <literals>.
Within a pattern the identifier ... must follow the last element of
a nonempty sequence of subpatterns.

More formally, an input form F matches a pattern P if and only if:

P is a non-literal identifier; or

P is a literal identifier and F is an identifier with the same
binding; or

P is a list (P_1 ... P_n) and F is a
list of n
forms that match P_1 through P_n, respectively; or

P is an improper list
(P_1 P_2 ... P_n . P_n+1)
and F is a list or
improper list of n or more forms that match P_1 through P_n,
respectively, and whose nth ``cdr'' matches P_n+1; or

P is of the form
(P_1 ... P_n P_n+1 <ellipsis>)
where <ellipsis> is the identifier ...
and F is
a proper list of at least n forms, the first n of which match
P_1 through P_n, respectively, and each remaining element of F
matches P_n+1; or

P is a vector of the form #(P_1 ... P_n)
and F is a vector
of n forms that match P_1 through P_n; or

P is of the form
#(P_1 ... P_n P_n+1 <ellipsis>)
where <ellipsis> is the identifier ...
and F is a vector of n
or more forms the first n of which match
P_1 through P_n, respectively, and each remaining element of F
matches P_n+1; or

P is a datum and F is equal to P in the sense of
the equal? procedure.

It is an error to use a macro keyword, within the scope of its
binding, in an expression that does not match any of the patterns.

When a macro use is transcribed according to the template of the
matching <syntax rule>, pattern variables that occur in the
template are replaced by the subforms they match in the input.
Pattern variables that occur in subpatterns followed by one or more
instances of the identifier
... are allowed only in subtemplates that are
followed by as many instances of ....
They are replaced in the
output by all of the subforms they match in the input, distributed as
indicated.  It is an error if the output cannot be built up as
specified.

Identifiers that appear in the template but are not pattern variables
or the identifier
... are inserted into the output as literal identifiers.  If a
literal identifier is inserted as a free identifier then it refers to the
binding of that identifier within whose scope the instance of
syntax-rules appears.
If a literal identifier is inserted as a bound identifier then it is
in effect renamed to prevent inadvertent captures of free identifiers.

As an example, if let and cond are defined as in
section 7.3 then they are hygienic (as required) and
the following is not an error.

(let ((=> #f))

  (cond (#t => 'ok)))                   ===> ok

The macro transformer for cond recognizes =>
as a local variable, and hence an expression, and not as the
top-level identifier =>, which the macro transformer treats
as a syntactic keyword.  Thus the example expands into

(let ((=> #f))

  (if #t (begin => 'ok)))

instead of

(let ((=> #f))

  (let ((temp #t))

    (if temp ('ok temp))))

which would result in an invalid procedure call.")
    ("map" . "library procedure:  (map proc list_1 list_2 ...) 

The lists must be lists, and proc must be a
procedure taking as many arguments as there are lists
and returning a single value.  If more
than one list is given, then they must all be the same length.
Map applies proc element-wise to the elements of the
lists and returns a list of the results, in order.
The dynamic order in which proc is applied to the elements of the
lists is unspecified.

(map cadr '((a b) (d e) (g h)))   
                ===>  (b e h)

(map (lambda (n) (expt n n))

     '(1 2 3 4 5))                
                ===>  (1 4 27 256 3125)

(map + '(1 2 3) '(4 5 6))                 ===>  (5 7 9)

(let ((count 0))

  (map (lambda (ignored)

         (set! count (+ count 1))

         count)

       '(a b)))                         ===>  (1 2) or (2 1)")
    ("inexact?" . "procedure:  (inexact? z) 

These numerical predicates provide tests for the exactness of a
quantity.  For any Scheme number, precisely one of these predicates
is true.")
    ("zero?" . "library procedure:  (zero? z) 

library procedure:  (positive? x) 

library procedure:  (negative? x) 

library procedure:  (odd? n) 

library procedure:  (even? n) 

These numerical predicates test a number for a particular property,
returning #t or #f.  See note above.")
    ("negative?" . "library procedure:  (negative? x) 

library procedure:  (odd? n) 

library procedure:  (even? n) 

These numerical predicates test a number for a particular property,
returning #t or #f.  See note above.")
    ("begin" . "library syntax:  (begin <expression_1> <expression_2> ...) 

The <expression>s are evaluated sequentially from left to right,
and the value(s) of the last <expression> is(are) returned.  This
expression type is used to sequence side effects such as input and
output.

(define x 0)

(begin (set! x 5)

       (+ x 1))                          ===>  6

(begin (display \"4 plus 1 equals \")

       (display (+ 4 1)))              ===>  unspecified

  and prints  4 plus 1 equals 5")
    ("cos" . "procedure:  (cos z) 

procedure:  (tan z) 

procedure:  (asin z) 

procedure:  (acos z) 

procedure:  (atan z) 

procedure:  (atan y x) 

These procedures are part of every implementation that supports
general
real numbers; they compute the usual transcendental functions.  Log
computes the natural logarithm of z (not the base ten logarithm).
Asin, acos, and atan compute arcsine (sin-1),
arccosine (cos-1), and arctangent (tan-1), respectively.
The two-argument variant of atan computes (angle
(make-rectangular x y)) (see below), even in implementations
that don't support general complex numbers.

In general, the mathematical functions log, arcsine, arccosine, and
arctangent are multiply defined.
The value of log z is defined to be the one whose imaginary
part lies in the range from  -  (exclusive) to  (inclusive).
log 0 is undefined.
With log defined this way, the values of sin-1 z, cos-1 z,
and tan-1 z are according to the following formul&aelig;:

sin-1 z  =   - i log (i z  +  (1  -  z2)1/2)

cos-1 z  =   / 2  -  sin-1 z

tan-1 z  =  (log (1  +  i z)  -  log (1  -  i z)) / (2 i)

The above specification follows [27], which in turn
cites [19]; refer to these sources for more detailed
discussion of branch cuts, boundary conditions, and implementation of
these functions.  When it is possible these procedures produce a real
result from a real argument.")
    ("load" . "optional procedure:  (load filename) 

Filename should be a string naming an existing file
containing Scheme source code.  The load procedure reads
expressions and definitions from the file and evaluates them
sequentially.  It is unspecified whether the results of the expressions
are printed.  The load procedure does not affect the values
returned by current-input-port and current-output-port.
Load returns an unspecified value.

Rationale:  
For portability, load must operate on source files.
Its operation on other kinds of files necessarily varies among
implementations.")
    ("list-tail" . "library procedure:  (list-tail list k) 

Returns the sublist of list obtained by omitting the first k
elements.  It is an error if list has fewer than k elements.
List-tail could be defined by

(define list-tail

  (lambda (x k)

    (if (zero? k)

        x

        (list-tail (cdr x) (- k 1)))))")
    ("newline" . "library procedure:  (newline) 

library procedure:  (newline port) 

Writes an end of line to port.  Exactly how this is done differs
from one operating system to another.  Returns an unspecified value.
The port argument may be omitted, in which case it defaults to the
value returned by current-output-port.")
    ("quote" . "syntax:  (quote <datum>) 

syntax:  '<datum> 

syntax:  <constant> 

(quote <datum>) evaluates to <datum>.
<Datum>
may be any external representation of a Scheme object (see
section 3.3).  This notation is used to include literal
constants in Scheme code.

(quote a)                             ===>  a

(quote #(a b c))             ===>  #(a b c)

(quote (+ 1 2))                       ===>  (+ 1 2)

(quote <datum>) may be abbreviated as
'<datum>.  The two notations are equivalent in all
respects.

'a                           ===>  a

'#(a b c)                   ===>  #(a b c)

'()                          ===>  ()

'(+ 1 2)                     ===>  (+ 1 2)

'(quote a)                   ===>  (quote a)

''a                          ===>  (quote a)

Numerical constants, string constants, character constants, and boolean
constants evaluate ``to themselves''; they need not be quoted.

'\"abc\"             ===>  \"abc\"

\"abc\"              ===>  \"abc\"

'145932            ===>  145932

145932             ===>  145932

'#t          ===>  #t

#t           ===>  #t

As noted in section 3.4, it is an error to alter a constant
(i.e. the value of a literal expression) using a mutation procedure like
set-car! or string-set!.")
    ("member" . "library procedure:  (member obj list) 

These procedures return the first sublist of list whose car is
obj, where the sublists of list are the non-empty lists
returned by (list-tail list k) for k less
than the length of list.  If
obj does not occur in list, then #f (not the empty list) is
returned.  Memq uses eq? to compare obj with the elements of
list, while memv uses eqv? and member uses equal?.

(memq 'a '(a b c))                      ===>  (a b c)

(memq 'b '(a b c))                      ===>  (b c)

(memq 'a '(b c d))                      ===>  #f

(memq (list 'a) '(b (a) c))             ===>  #f

(member (list 'a)

        '(b (a) c))                     ===>  ((a) c)

(memq 101 '(100 101 102))               ===>  unspecified

(memv 101 '(100 101 102))               ===>  (101 102)")
    ("cadr" . "library procedure:  (cadr pair) 

                                                 :                                                    

library procedure:  (cdddar pair) 

library procedure:  (cddddr pair) 

These procedures are compositions of car and cdr, where
for example caddr could be defined by

(define caddr (lambda (x) (car (cdr (cdr x))))).

Arbitrary compositions, up to four deep, are provided.  There are
twenty-eight of these procedures in all.")
    ("char-ci>=?" . "library procedure:  (char-ci>=? char_1 char_2) 

These procedures are similar to char=? et cetera, but they treat
upper case and lower case letters as the same.  For example, (char-ci=? #\\A #\\a) returns #t.  Some
implementations may generalize these procedures to take more than two
arguments, as with the corresponding numerical predicates.")
    ("input-port?" . "procedure:  (input-port? obj) 

procedure:  (output-port? obj) 

Returns #t if obj is an input port or output port
respectively, otherwise returns #f.")
    ("imag-part" . "procedure:  (imag-part z) 

procedure:  (magnitude z) 

procedure:  (angle z) 

These procedures are part of every implementation that supports
general
complex numbers.  Suppose x_1, x_2, x_3, and x_4 are
real numbers and z is a complex number such that

 z  =  x_1  +  x_2i
 =  x_3  &middot;  ei x_4

Then

(make-rectangular x_1 x_2)         ===> z

(make-polar x_3 x_4)             ===> z

(real-part z)                          ===> x_1

(imag-part z)                          ===> x_2

(magnitude z)                          ===> |x_3|

(angle z)                              ===> x_angle

where  -  < x_angle <  with x_angle  =  x_4  +  2 n
for some integer n.

Rationale:  
Magnitude is the same as abs for a real argument,
but abs must be present in all implementations, whereas
magnitude need only be present in implementations that support
general complex numbers.")
    ("do" . "library syntax:  (do ((<variable_1> <init_1> <step_1>) 

     ...)

   (<test> <expression> ...)

 <command> ...)

Do is an iteration construct.  It specifies a set of variables to
be bound, how they are to be initialized at the start, and how they are
to be updated on each iteration.  When a termination condition is met,
the loop exits after evaluating the <expression>s.

Do expressions are evaluated as follows:
The <init> expressions are evaluated (in some unspecified order),
the <variable>s are bound to fresh locations, the results of the
<init> expressions are stored in the bindings of the
<variable>s, and then the iteration phase begins.

Each iteration begins by evaluating <test>; if the result is
false (see section 6.3.1), then the <command>
expressions are evaluated in order for effect, the <step>
expressions are evaluated in some unspecified order, the
<variable>s are bound to fresh locations, the results of the
<step>s are stored in the bindings of the
<variable>s, and the next iteration begins.

If <test> evaluates to a true value, then the
<expression>s are evaluated from left to right and the value(s) of
the last <expression> is(are) returned.  If no <expression>s
are present, then the value of the do expression is unspecified.

The region of the binding of a <variable>
consists of the entire do expression except for the <init>s.
It is an error for a <variable> to appear more than once in the
list of do variables.

A <step> may be omitted, in which case the effect is the
same as if (<variable> <init> <variable>) had
been written instead of (<variable> <init>).

(do ((vec (make-vector 5))

     (i 0 (+ i 1)))

    ((= i 5) vec)

  (vector-set! vec i i))                  ===>  #(0 1 2 3 4)

(let ((x '(1 3 5 7 9)))

  (do ((x x (cdr x))

       (sum 0 (+ sum (car x))))

      ((null? x) sum)))                     ===>  25")
    ("round" . "procedure:  (round x) 

These procedures return integers.
Floor returns the largest integer not larger than x.
Ceiling returns the smallest integer not smaller than x.
Truncate returns the integer closest to x whose absolute
value is not larger than the absolute value of x.  Round returns the
closest integer to x, rounding to even when x is halfway between two
integers.

Rationale:  
Round rounds to even for consistency with the default rounding
mode specified by the IEEE floating point standard.

Note:  
If the argument to one of these procedures is inexact, then the result
will also be inexact.  If an exact value is needed, the
result should be passed to the inexact->exact procedure.

(floor -4.3)                  ===>  -5.0

(ceiling -4.3)                ===>  -4.0

(truncate -4.3)               ===>  -4.0

(round -4.3)                  ===>  -4.0

(floor 3.5)                   ===>  3.0

(ceiling 3.5)                 ===>  4.0

(truncate 3.5)                ===>  3.0

(round 3.5)                   ===>  4.0  ; inexact

(round 7/2)                   ===>  4    ; exact

(round 7)                     ===>  7")
    ("string->number" . "procedure:  (string->number string) 

procedure:  (string->number string radix) 

Returns a number of the maximally precise representation expressed by the
given string.  Radix must be an exact integer, either 2, 8, 10,
or 16.  If supplied, radix is a default radix that may be overridden
by an explicit radix prefix in string (e.g. \"#o177\").  If radix
is not supplied, then the default radix is 10.  If string is not
a syntactically valid notation for a number, then string->number
returns #f.

(string->number \"100\")                ===>  100

(string->number \"100\" 16)             ===>  256

(string->number \"1e2\")                ===>  100.0

(string->number \"15##\")               ===>  1500.0

Note:  
The domain of string->number may be restricted by implementations
in the following ways.  String->number is permitted to return
#f whenever string contains an explicit radix prefix.
If all numbers supported by an implementation are real, then
string->number is permitted to return #f whenever
string uses the polar or rectangular notations for complex
numbers.  If all numbers are integers, then
string->number may return #f whenever
the fractional notation is used.  If all numbers are exact, then
string->number may return #f whenever
an exponent marker or explicit exactness prefix is used, or if
a # appears in place of a digit.  If all inexact
numbers are integers, then
string->number may return #f whenever
a decimal point is used.")
    ("open-output-file" . "procedure:  (open-output-file filename) 

Takes a string naming an output file to be created and returns an output
port capable of writing characters to a new file by that name.  If the file
cannot be opened, an error is signalled.  If a file with the given name
already exists, the effect is unspecified.")
    ("close-input-port" . "procedure:  (close-input-port port) 

procedure:  (close-output-port port) 

Closes the file associated with port, rendering the port
incapable of delivering or accepting characters.  
These routines have no effect if the file has already been closed.
The value returned is unspecified.")
    ("vector->list" . "library procedure:  (vector->list vector) 

library procedure:  (list->vector list) 

Vector->list returns a newly allocated list of the objects contained
in the elements of vector.  List->vector returns a newly
created vector initialized to the elements of the list list.

(vector->list '#(dah dah didah))  
                ===>  (dah dah didah)

(list->vector '(dididit dah))   
                ===>  #(dididit dah)")
    ("read" . "library procedure:  (read) 

library procedure:  (read port) 

Read converts external representations of Scheme objects into the
objects themselves.  That is, it is a parser for the nonterminal
<datum> (see sections 7.1.2 and
6.3.2).  Read returns the next
object parsable from the given input port, updating port to point to
the first character past the end of the external representation of the object.

If an end of file is encountered in the input before any
characters are found that can begin an object, then an end of file
object is returned.   The port remains open, and further attempts
to read will also return an end of file object.  If an end of file is
encountered after the beginning of an object's external representation,
but the external representation is incomplete and therefore not parsable,
an error is signalled.

The port argument may be omitted, in which case it defaults to the
value returned by current-input-port.  It is an error to read from
a closed port.")
    ("rationalize" . "library procedure:  (rationalize x y) 

Rationalize returns the simplest rational number
differing from x by no more than y.  A rational number r_1 is
simpler  than another rational number
r_2 if r_1  =  p_1/q_1 and r_2  =  p_2/q_2 (in lowest terms) and |p_1|
< |p_2| and |q_1| < |q_2|.  Thus 3/5 is simpler than 4/7.
Although not all rationals are comparable in this ordering (consider 2/7
and 3/5) any interval contains a rational number that is simpler than
every other rational number in that interval (the simpler 2/5 lies
between 2/7 and 3/5).  Note that 0  =  0/1 is the simplest rational of
all.

(rationalize

  (inexact->exact .3) 1/10)          ===> 1/3    ; exact

(rationalize .3 1/10)                ===> #i1/3  ; inexact")
    ("cdddar" . "library procedure:  (cdddar pair) 

library procedure:  (cddddr pair) 

These procedures are compositions of car and cdr, where
for example caddr could be defined by

(define caddr (lambda (x) (car (cdr (cdr x))))).

Arbitrary compositions, up to four deep, are provided.  There are
twenty-eight of these procedures in all.")
    ("define" . "5.2  Definitions

Definitions are valid in some, but not all, contexts where expressions
are allowed.  They are valid only at the top level of a <program>
and at the beginning of a <body>.

A definition should have one of the following forms:

(define <variable> <expression>)

(define (<variable> <formals>) <body>)

<Formals> should be either a
sequence of zero or more variables, or a sequence of one or more
variables followed by a space-delimited period and another variable (as
in a lambda expression).  This form is equivalent to

(define <variable>

  (lambda (<formals>) <body>)).

(define (<variable> . <formal>) <body>)

<Formal> should be a single
variable.  This form is equivalent to

(define <variable>

  (lambda <formal> <body>)).")
    ("list->vector" . "library procedure:  (list->vector list) 

Vector->list returns a newly allocated list of the objects contained
in the elements of vector.  List->vector returns a newly
created vector initialized to the elements of the list list.

(vector->list '#(dah dah didah))  
                ===>  (dah dah didah)

(list->vector '(dididit dah))   
                ===>  #(dididit dah)")
    ("reverse" . "library procedure:  (reverse list) 

Returns a newly allocated list consisting of the elements of list
in reverse order.

(reverse '(a b c))                      ===>  (c b a)

(reverse '(a (b c) d (e (f))))  
                ===>  ((e (f)) d (b c) a)")
    ("car" . "procedure:  (car pair) 

Returns the contents of the car field of pair.  Note that it is an
error to take the car of the empty list.

(car '(a b c))                  ===>  a

(car '((a) b c d))              ===>  (a)

(car '(1 . 2))                  ===>  1

(car '())                       ===>  error")
    ("modulo" . "procedure:  (modulo n_1 n_2) 

These procedures implement number-theoretic (integer)
division.  n_2 should be non-zero.  All three procedures
return integers.  If n_1/n_2 is an integer:

    (quotient n_1 n_2)           ===> n_1/n_2

    (remainder n_1 n_2)          ===> 0

    (modulo n_1 n_2)             ===> 0

If n_1/n_2 is not an integer:

    (quotient n_1 n_2)           ===> n_q

    (remainder n_1 n_2)          ===> n_r

    (modulo n_1 n_2)             ===> n_m

where n_q is n_1/n_2 rounded towards zero,
0 < |n_r| < |n_2|, 0 < |n_m| < |n_2|,
n_r and n_m differ from n_1 by a multiple of n_2,
n_r has the same sign as n_1, and
n_m has the same sign as n_2.

From this we can conclude that for integers n_1 and n_2 with
n_2 not equal to 0,

     (= n_1 (+ (* n_2 (quotient n_1 n_2))

           (remainder n_1 n_2)))

                                         ===>  #t

provided all numbers involved in that computation are exact.

(modulo 13 4)                   ===>  1

(remainder 13 4)                ===>  1

(modulo -13 4)                  ===>  3

(remainder -13 4)               ===>  -1

(modulo 13 -4)                  ===>  -3

(remainder 13 -4)               ===>  1

(modulo -13 -4)                 ===>  -1

(remainder -13 -4)              ===>  -1

(remainder -13 -4.0)            ===>  -1.0  ; inexact")
    ("port?" . "3.2  Disjointness of types

No object satisfies more than one of the following predicates:

boolean?          pair?

symbol?           number?

char?             string?

vector?           port?

procedure?

These predicates define the types boolean, pair, symbol, number, char (or character), string, vector, port, and procedure.  The empty list is a special
object of its own type; it satisfies none of the above predicates.

Although there is a separate boolean type,
any Scheme value can be used as a boolean value for the purpose of a
conditional test.  As explained in section 6.3.1, all
values count as true in such a test except for #f.
This report uses the word ``true'' to refer to any
Scheme value except #f, and the word ``false'' to refer to
#f.")
    ("rational?" . "procedure:  (rational? obj) 

procedure:  (integer? obj) 

These numerical type predicates can be applied to any kind of
argument, including non-numbers.  They return #t if the object is
of the named type, and otherwise they return #f.
In general, if a type predicate is true of a number then all higher
type predicates are also true of that number.  Consequently, if a type
predicate is false of a number, then all lower type predicates are
also false of that number.

If z is an inexact complex number, then (real? z) is true if
and only if (zero? (imag-part z)) is true.  If x is an inexact
real number, then (integer? x) is true if and only if
(= x (round x)).

(complex? 3+4i)                 ===>  #t

(complex? 3)                    ===>  #t

(real? 3)                       ===>  #t

(real? -2.5+0.0i)               ===>  #t

(real? #e1e10)                  ===>  #t

(rational? 6/10)                ===>  #t

(rational? 6/3)                 ===>  #t

(integer? 3+0i)                 ===>  #t

(integer? 3.0)                  ===>  #t

(integer? 8/4)                  ===>  #t

Note:  
The behavior of these type predicates on inexact numbers
is unreliable, since any inaccuracy may affect the result.

Note:  
In many implementations the rational? procedure will be the same
as real?, and the complex? procedure will be the same as
number?, but unusual implementations may be able to represent
some irrational numbers exactly or may extend the number system to
support some kind of non-complex numbers.")
    ("positive?" . "library procedure:  (positive? x) 

library procedure:  (negative? x) 

library procedure:  (odd? n) 

library procedure:  (even? n) 

These numerical predicates test a number for a particular property,
returning #t or #f.  See note above.")
    ("for-each" . "library procedure:  (for-each proc list_1 list_2 ...) 

The arguments to for-each are like the arguments to map, but
for-each calls proc for its side effects rather than for its
values.  Unlike map, for-each is guaranteed to call proc on
the elements of the lists in order from the first element(s) to the
last, and the value returned by for-each is unspecified.

(let ((v (make-vector 5)))

  (for-each (lambda (i)

              (vector-set! v i (* i i)))

            '(0 1 2 3 4))

  v)                                        ===>  #(0 1 4 9 16)")
    ("char-ci<=?" . "library procedure:  (char-ci<=? char_1 char_2) 

library procedure:  (char-ci>=? char_1 char_2) 

These procedures are similar to char=? et cetera, but they treat
upper case and lower case letters as the same.  For example, (char-ci=? #\\A #\\a) returns #t.  Some
implementations may generalize these procedures to take more than two
arguments, as with the corresponding numerical predicates.")
    ("string-ref" . "procedure:  (string-ref string k) 

k must be a valid index of string.
String-ref returns character k of string using zero-origin indexing.")
    ("current-output-port" . "procedure:  (current-output-port) 

Returns the current default input or output port.")
    ("integer->char" . "procedure:  (integer->char n) 

Given a character, char->integer returns an exact integer
representation of the character.  Given an exact integer that is the image of
a character under char->integer, integer->char
returns that character.  These procedures implement order-preserving isomorphisms
between the set of characters under the char<=? ordering and some
subset of the integers under the <= ordering.  That is, if

(char<=? a b) ===> #t  and  (<= x y) ===> #t

and x and y are in the domain of
integer->char, then

(<= (char->integer a)

    (char->integer b))                 ===>  #t

(char<=? (integer->char x)

         (integer->char y))             ===>  #t")
    ("assv" . "library procedure:  (assv obj alist) 

library procedure:  (assoc obj alist) 

Alist (for ``association list'') must be a list of
pairs.  These procedures find the first pair in alist whose car field is obj,
and returns that pair.  If no pair in alist has obj as its
car, then #f (not the empty list) is returned.  Assq uses
eq? to compare obj with the car fields of the pairs in alist,
while assv uses eqv? and assoc uses equal?.

(define e '((a 1) (b 2) (c 3)))

(assq 'a e)             ===>  (a 1)

(assq 'b e)             ===>  (b 2)

(assq 'd e)             ===>  #f

(assq (list 'a) '(((a)) ((b)) ((c))))

                        ===>  #f

(assoc (list 'a) '(((a)) ((b)) ((c))))   

                                   ===>  ((a))

(assq 5 '((2 3) (5 7) (11 13)))    

                                   ===>  unspecified

(assv 5 '((2 3) (5 7) (11 13)))    

                                   ===>  (5 7)

Rationale:  
Although they are ordinarily used as predicates,
memq, memv, member, assq, assv, and assoc do not
have question marks in their names because they return useful values rather
than just #t or #f.")
    ("null?" . "library procedure:  (null? obj) 

Returns #t if obj is the empty list,
otherwise returns #f.")
    ("letrec-syntax" . "syntax:  (letrec-syntax <bindings> <body>) 

Syntax: Same as for let-syntax.

Semantics: The <body> is expanded in the syntactic environment obtained by
extending the syntactic environment of the letrec-syntax
expression with macros whose keywords are the
<keyword>s, bound to the specified transformers.
Each binding of a <keyword> has the <bindings>
as well as the <body> within its region,
so the transformers can
transcribe expressions into uses of the macros
introduced by the letrec-syntax expression.

(letrec-syntax

  ((my-or (syntax-rules ()

            ((my-or) #f)

            ((my-or e) e)

            ((my-or e1 e2 ...)

             (let ((temp e1))

               (if temp

                   temp

                   (my-or e2 ...)))))))

  (let ((x #f)

        (y 7)

        (temp 8)

        (let odd?)

        (if even?))

    (my-or x

           (let temp)

           (if y)

           y)))                ===>  7")
    ("even?" . "library procedure:  (even? n) 

These numerical predicates test a number for a particular property,
returning #t or #f.  See note above.")
    ("assq" . "library procedure:  (assq obj alist) 

library procedure:  (assv obj alist) 

library procedure:  (assoc obj alist) 

Alist (for ``association list'') must be a list of
pairs.  These procedures find the first pair in alist whose car field is obj,
and returns that pair.  If no pair in alist has obj as its
car, then #f (not the empty list) is returned.  Assq uses
eq? to compare obj with the car fields of the pairs in alist,
while assv uses eqv? and assoc uses equal?.

(define e '((a 1) (b 2) (c 3)))

(assq 'a e)             ===>  (a 1)

(assq 'b e)             ===>  (b 2)

(assq 'd e)             ===>  #f

(assq (list 'a) '(((a)) ((b)) ((c))))

                        ===>  #f

(assoc (list 'a) '(((a)) ((b)) ((c))))   

                                   ===>  ((a))

(assq 5 '((2 3) (5 7) (11 13)))    

                                   ===>  unspecified

(assv 5 '((2 3) (5 7) (11 13)))    

                                   ===>  (5 7)

Rationale:  
Although they are ordinarily used as predicates,
memq, memv, member, assq, assv, and assoc do not
have question marks in their names because they return useful values rather
than just #t or #f.")
    ("char-downcase" . "library procedure:  (char-downcase char) 

These procedures return a character char_2 such that (char-ci=? char char_2).  In addition, if char is
alphabetic, then the result of char-upcase is upper case and the
result of char-downcase is lower case.")
    (",@" . "syntax:  `<qq template> 

``Backquote'' or ``quasiquote'' expressions are useful
for constructing a list or vector structure when most but not all of the
desired structure is known in advance.  If no
commas appear within the <qq template>, the result of
evaluating
`<qq template> is equivalent to the result of evaluating
'<qq template>.  If a comma appears within the
<qq template>, however, the expression following the comma is
evaluated (``unquoted'') and its result is inserted into the structure
instead of the comma and the expression.  If a comma appears followed
immediately by an at-sign (@), then the following
expression must evaluate to a list; the opening and closing parentheses
of the list are then ``stripped away'' and the elements of the list are
inserted in place of the comma at-sign expression sequence.  A comma
at-sign should only appear within a list or vector <qq template>.

`(list ,(+ 1 2) 4)          ===>  (list 3 4)

(let ((name 'a)) `(list ,name ',name))           
                ===>  (list a (quote a))

`(a ,(+ 1 2) ,@(map abs '(4 -5 6)) b)           
                ===>  (a 3 4 5 6 b)

`(( foo ,(- 10 3)) ,@(cdr '(c)) . ,(car '(cons)))           
                ===>  ((foo 7) . cons)

`#(10 5 ,(sqrt 4) ,@(map sqrt '(16 9)) 8)           
                ===>  #(10 5 2 4 3 8)

Quasiquote forms may be nested.  Substitutions are made only for
unquoted components appearing at the same nesting level
as the outermost backquote.  The nesting level increases by one inside
each successive quasiquotation, and decreases by one inside each
unquotation.

`(a `(b ,(+ 1 2) ,(foo ,(+ 1 3) d) e) f)           
                ===>  (a `(b ,(+ 1 2) ,(foo 4 d) e) f)

(let ((name1 'x)

      (name2 'y))

  `(a `(b ,,name1 ,',name2 d) e))           
                ===>  (a `(b ,x ,'y d) e)

The two notations
`<qq template> and (quasiquote <qq template>)
are identical in all respects.
,<expression> is identical to (unquote <expression>),
and
,@<expression> is identical to (unquote-splicing <expression>).
The external syntax generated by write for two-element lists whose
car is one of these symbols may vary between implementations.

(quasiquote (list (unquote (+ 1 2)) 4))           
                ===>  (list 3 4)

'(quasiquote (list (unquote (+ 1 2)) 4))           
                ===>  `(list ,(+ 1 2) 4)

     i.e., (quasiquote (list (unquote (+ 1 2)) 4))

Unpredictable behavior can result if any of the symbols
quasiquote, unquote, or unquote-splicing appear in
positions within a <qq template> otherwise than as described above.")
    ("string->symbol" . "procedure:  (string->symbol string) 

Returns the symbol whose name is string.  This procedure can
create symbols with names containing special characters or letters in
the non-standard case, but it is usually a bad idea to create such
symbols because in some implementations of Scheme they cannot be read as
themselves.  See symbol->string.

The following examples assume that the implementation's standard case is
lower case:

(eq? 'mISSISSIppi 'mississippi)  
                ===>  #t

(string->symbol \"mISSISSIppi\")  
                ===>  the symbol with name \"mISSISSIppi\"

(eq? 'bitBlt (string->symbol \"bitBlt\"))     
                ===>  #f

(eq? 'JollyWog

     (string->symbol

       (symbol->string 'JollyWog)))  
                ===>  #t

(string=? \"K. Harper, M.D.\"

          (symbol->string

            (string->symbol \"K. Harper, M.D.\")))  
                ===>  #t")
    ("string-ci<=?" . "library procedure:  (string-ci<=? string_1 string_2) 

library procedure:  (string-ci>=? string_1 string_2) 

These procedures are the lexicographic extensions to strings of the
corresponding orderings on characters.  For example, string<? is
the lexicographic ordering on strings induced by the ordering
char<? on characters.  If two strings differ in length but
are the same up to the length of the shorter string, the shorter string
is considered to be lexicographically less than the longer string.

Implementations may generalize these and the string=? and
string-ci=? procedures to take more than two arguments, as with
the corresponding numerical predicates.")
    ("log" . "procedure:  (log z) 

procedure:  (sin z) 

procedure:  (cos z) 

procedure:  (tan z) 

procedure:  (asin z) 

procedure:  (acos z) 

procedure:  (atan z) 

procedure:  (atan y x) 

These procedures are part of every implementation that supports
general
real numbers; they compute the usual transcendental functions.  Log
computes the natural logarithm of z (not the base ten logarithm).
Asin, acos, and atan compute arcsine (sin-1),
arccosine (cos-1), and arctangent (tan-1), respectively.
The two-argument variant of atan computes (angle
(make-rectangular x y)) (see below), even in implementations
that don't support general complex numbers.

In general, the mathematical functions log, arcsine, arccosine, and
arctangent are multiply defined.
The value of log z is defined to be the one whose imaginary
part lies in the range from  -  (exclusive) to  (inclusive).
log 0 is undefined.
With log defined this way, the values of sin-1 z, cos-1 z,
and tan-1 z are according to the following formul&aelig;:

sin-1 z  =   - i log (i z  +  (1  -  z2)1/2)

cos-1 z  =   / 2  -  sin-1 z

tan-1 z  =  (log (1  +  i z)  -  log (1  -  i z)) / (2 i)

The above specification follows [27], which in turn
cites [19]; refer to these sources for more detailed
discussion of branch cuts, boundary conditions, and implementation of
these functions.  When it is possible these procedures produce a real
result from a real argument.")
    ("quasiquote" . "syntax:  (quasiquote <qq template>) 
 syntax:  `<qq template> 

``Backquote'' or ``quasiquote'' expressions are useful
for constructing a list or vector structure when most but not all of the
desired structure is known in advance.  If no
commas appear within the <qq template>, the result of
evaluating
`<qq template> is equivalent to the result of evaluating
'<qq template>.  If a comma appears within the
<qq template>, however, the expression following the comma is
evaluated (``unquoted'') and its result is inserted into the structure
instead of the comma and the expression.  If a comma appears followed
immediately by an at-sign (@), then the following
expression must evaluate to a list; the opening and closing parentheses
of the list are then ``stripped away'' and the elements of the list are
inserted in place of the comma at-sign expression sequence.  A comma
at-sign should only appear within a list or vector <qq template>.

`(list ,(+ 1 2) 4)          ===>  (list 3 4)

(let ((name 'a)) `(list ,name ',name))           
                ===>  (list a (quote a))

`(a ,(+ 1 2) ,@(map abs '(4 -5 6)) b)           
                ===>  (a 3 4 5 6 b)

`(( foo ,(- 10 3)) ,@(cdr '(c)) . ,(car '(cons)))           
                ===>  ((foo 7) . cons)

`#(10 5 ,(sqrt 4) ,@(map sqrt '(16 9)) 8)           
                ===>  #(10 5 2 4 3 8)

Quasiquote forms may be nested.  Substitutions are made only for
unquoted components appearing at the same nesting level
as the outermost backquote.  The nesting level increases by one inside
each successive quasiquotation, and decreases by one inside each
unquotation.

`(a `(b ,(+ 1 2) ,(foo ,(+ 1 3) d) e) f)           
                ===>  (a `(b ,(+ 1 2) ,(foo 4 d) e) f)

(let ((name1 'x)

      (name2 'y))

  `(a `(b ,,name1 ,',name2 d) e))           
                ===>  (a `(b ,x ,'y d) e)

The two notations
`<qq template> and (quasiquote <qq template>)
are identical in all respects.
,<expression> is identical to (unquote <expression>),
and
,@<expression> is identical to (unquote-splicing <expression>).
The external syntax generated by write for two-element lists whose
car is one of these symbols may vary between implementations.

(quasiquote (list (unquote (+ 1 2)) 4))           
                ===>  (list 3 4)

'(quasiquote (list (unquote (+ 1 2)) 4))           
                ===>  `(list ,(+ 1 2) 4)

     i.e., (quasiquote (list (unquote (+ 1 2)) 4))

Unpredictable behavior can result if any of the symbols
quasiquote, unquote, or unquote-splicing appear in
positions within a <qq template> otherwise than as described above.")
    ("set-car!" . "procedure:  (set-car! pair obj) 

Stores obj in the car field of pair.
The value returned by set-car! is unspecified.  

(define (f) (list 'not-a-constant-list))

(define (g) '(constant-list))

(set-car! (f) 3)                     ===>  unspecified

(set-car! (g) 3)                     ===>  error")
    ("magnitude" . "procedure:  (magnitude z) 

procedure:  (angle z) 

These procedures are part of every implementation that supports
general
complex numbers.  Suppose x_1, x_2, x_3, and x_4 are
real numbers and z is a complex number such that

 z  =  x_1  +  x_2i
 =  x_3  &middot;  ei x_4

Then

(make-rectangular x_1 x_2)         ===> z

(make-polar x_3 x_4)             ===> z

(real-part z)                          ===> x_1

(imag-part z)                          ===> x_2

(magnitude z)                          ===> |x_3|

(angle z)                              ===> x_angle

where  -  < x_angle <  with x_angle  =  x_4  +  2 n
for some integer n.

Rationale:  
Magnitude is the same as abs for a real argument,
but abs must be present in all implementations, whereas
magnitude need only be present in implementations that support
general complex numbers.")
    ("atan" . "procedure:  (atan z) 

procedure:  (atan y x) 

These procedures are part of every implementation that supports
general
real numbers; they compute the usual transcendental functions.  Log
computes the natural logarithm of z (not the base ten logarithm).
Asin, acos, and atan compute arcsine (sin-1),
arccosine (cos-1), and arctangent (tan-1), respectively.
The two-argument variant of atan computes (angle
(make-rectangular x y)) (see below), even in implementations
that don't support general complex numbers.

In general, the mathematical functions log, arcsine, arccosine, and
arctangent are multiply defined.
The value of log z is defined to be the one whose imaginary
part lies in the range from  -  (exclusive) to  (inclusive).
log 0 is undefined.
With log defined this way, the values of sin-1 z, cos-1 z,
and tan-1 z are according to the following formul&aelig;:

sin-1 z  =   - i log (i z  +  (1  -  z2)1/2)

cos-1 z  =   / 2  -  sin-1 z

tan-1 z  =  (log (1  +  i z)  -  log (1  -  i z)) / (2 i)

The above specification follows [27], which in turn
cites [19]; refer to these sources for more detailed
discussion of branch cuts, boundary conditions, and implementation of
these functions.  When it is possible these procedures produce a real
result from a real argument.")
    ("number?" . "3.2  Disjointness of types

No object satisfies more than one of the following predicates:

boolean?          pair?

symbol?           number?

char?             string?

vector?           port?

procedure?

These predicates define the types boolean, pair, symbol, number, char (or character), string, vector, port, and procedure.  The empty list is a special
object of its own type; it satisfies none of the above predicates.

Although there is a separate boolean type,
any Scheme value can be used as a boolean value for the purpose of a
conditional test.  As explained in section 6.3.1, all
values count as true in such a test except for #f.
This report uses the word ``true'' to refer to any
Scheme value except #f, and the word ``false'' to refer to
#f.")
    ("abs" . "library procedure:  (abs x) 

Abs returns the absolute value of its argument.  

(abs -7)                        ===>  7")
    ("set!" . "syntax:  (set! <variable> <expression>) 

<Expression> is evaluated, and the resulting value is stored in
the location to which <variable> is bound.  <Variable> must
be bound either in some region enclosing the set! expression
or at top level.  The result of the set! expression is
unspecified.

(define x 2)

(+ x 1)                         ===>  3

(set! x 4)                      ===>  unspecified

(+ x 1)                         ===>  5")
    ("acos" . "procedure:  (acos z) 

procedure:  (atan z) 

procedure:  (atan y x) 

These procedures are part of every implementation that supports
general
real numbers; they compute the usual transcendental functions.  Log
computes the natural logarithm of z (not the base ten logarithm).
Asin, acos, and atan compute arcsine (sin-1),
arccosine (cos-1), and arctangent (tan-1), respectively.
The two-argument variant of atan computes (angle
(make-rectangular x y)) (see below), even in implementations
that don't support general complex numbers.

In general, the mathematical functions log, arcsine, arccosine, and
arctangent are multiply defined.
The value of log z is defined to be the one whose imaginary
part lies in the range from  -  (exclusive) to  (inclusive).
log 0 is undefined.
With log defined this way, the values of sin-1 z, cos-1 z,
and tan-1 z are according to the following formul&aelig;:

sin-1 z  =   - i log (i z  +  (1  -  z2)1/2)

cos-1 z  =   / 2  -  sin-1 z

tan-1 z  =  (log (1  +  i z)  -  log (1  -  i z)) / (2 i)

The above specification follows [27], which in turn
cites [19]; refer to these sources for more detailed
discussion of branch cuts, boundary conditions, and implementation of
these functions.  When it is possible these procedures produce a real
result from a real argument.")
    ("numerator" . "procedure:  (numerator q) 

procedure:  (denominator q) 

These procedures return the numerator or denominator of their
argument; the result is computed as if the argument was represented as
a fraction in lowest terms.  The denominator is always positive.  The
denominator of 0 is defined to be 1.

(numerator (/ 6 4))          ===>  3

(denominator (/ 6 4))          ===>  2

(denominator

  (exact->inexact (/ 6 4)))         ===> 2.0")
    ("angle" . "procedure:  (angle z) 

These procedures are part of every implementation that supports
general
complex numbers.  Suppose x_1, x_2, x_3, and x_4 are
real numbers and z is a complex number such that

 z  =  x_1  +  x_2i
 =  x_3  &middot;  ei x_4

Then

(make-rectangular x_1 x_2)         ===> z

(make-polar x_3 x_4)             ===> z

(real-part z)                          ===> x_1

(imag-part z)                          ===> x_2

(magnitude z)                          ===> |x_3|

(angle z)                              ===> x_angle

where  -  < x_angle <  with x_angle  =  x_4  +  2 n
for some integer n.

Rationale:  
Magnitude is the same as abs for a real argument,
but abs must be present in all implementations, whereas
magnitude need only be present in implementations that support
general complex numbers.")
    ("denominator" . "procedure:  (denominator q) 

These procedures return the numerator or denominator of their
argument; the result is computed as if the argument was represented as
a fraction in lowest terms.  The denominator is always positive.  The
denominator of 0 is defined to be 1.

(numerator (/ 6 4))          ===>  3

(denominator (/ 6 4))          ===>  2

(denominator

  (exact->inexact (/ 6 4)))         ===> 2.0")
    ("scheme-report-environment" . "procedure:  (scheme-report-environment version) 

procedure:  (null-environment version) 

Version must be the exact integer 5,
corresponding to this revision of the Scheme report (the
Revised5 Report on Scheme).
Scheme-report-environment returns a specifier for an
environment that is empty except for all bindings defined in
this report that are either required or both optional and
supported by the implementation. Null-environment returns
a specifier for an environment that is empty except for the
(syntactic) bindings for all syntactic keywords defined in
this report that are either required or both optional and
supported by the implementation.

Other values of version can be used to specify environments
matching past revisions of this report, but their support is not
required.  An implementation will signal an error if version
is neither 5 nor another value supported by
the implementation.

The effect of assigning (through the use of eval) a variable
bound in a scheme-report-environment
(for example car) is unspecified.  Thus the environments specified
by scheme-report-environment may be immutable.")
    ("char-upper-case?" . "library procedure:  (char-upper-case? letter) 

library procedure:  (char-lower-case? letter) 

These procedures return #t if their arguments are alphabetic,
numeric, whitespace, upper case, or lower case characters, respectively,
otherwise they return #f.  The following remarks, which are specific to
the ASCII character set, are intended only as a guide:  The alphabetic characters
are the 52 upper and lower case letters.  The numeric characters are the
ten decimal digits.  The whitespace characters are space, tab, line
feed, form feed, and carriage return.")
    ("output-port?" . "procedure:  (output-port? obj) 

Returns #t if obj is an input port or output port
respectively, otherwise returns #f.")
    ("else" . "library syntax:  (cond <clause_1> <clause_2> ...) 

Syntax: Each <clause> should be of the form

(<test> <expression_1> ...)

where <test> is any expression.  Alternatively, a <clause> may be
of the form

(<test> => <expression>)

The last <clause> may be
an ``else clause,'' which has the form

(else <expression_1> <expression_2> ...).

Semantics: A cond expression is evaluated by evaluating the <test>
expressions of successive <clause>s in order until one of them
evaluates to a true value (see
section 6.3.1).  When a <test> evaluates to a true
value, then the remaining <expression>s in its <clause> are
evaluated in order, and the result(s) of the last <expression> in the
<clause> is(are) returned as the result(s) of the entire cond
expression.  If the selected <clause> contains only the
<test> and no <expression>s, then the value of the
<test> is returned as the result.  If the selected <clause> uses the
=> alternate form, then the <expression> is evaluated.
Its value must be a procedure that accepts one argument; this procedure is then
called on the value of the <test> and the value(s) returned by this
procedure is(are) returned by the cond expression.
If all <test>s evaluate
to false values, and there is no else clause, then the result of
the conditional expression is unspecified; if there is an else
clause, then its <expression>s are evaluated, and the value(s) of
the last one is(are) returned.

(cond ((> 3 2) 'greater)

      ((< 3 2) 'less))                 ===>  greater

(cond ((> 3 3) 'greater)

      ((< 3 3) 'less)

      (else 'equal))                    ===>  equal

(cond ((assv 'b '((a 1) (b 2))) => cadr)

      (else #f))                 ===>  2")
    ("vector" . "library procedure:  (vector obj ...) 

Returns a newly allocated vector whose elements contain the given
arguments.  Analogous to list.

(vector 'a 'b 'c)                       ===>  #(a b c)")
    ("char<=?" . "procedure:  (char<=? char_1 char_2) 

procedure:  (char>=? char_1 char_2) 

These procedures impose a total ordering on the set of characters.  It
is guaranteed that under this ordering:

The upper case characters are in order.  For example, (char<? #\\A #\\B) returns #t.
The lower case characters are in order.  For example, (char<? #\\a #\\b) returns #t.
The digits are in order.  For example, (char<? #\\0 #\\9) returns #t.
Either all the digits precede all the upper case letters, or vice versa.
Either all the digits precede all the lower case letters, or vice versa.

Some implementations may generalize these procedures to take more than
two arguments, as with the corresponding numerical predicates.")
    ("assoc" . "library procedure:  (assoc obj alist) 

Alist (for ``association list'') must be a list of
pairs.  These procedures find the first pair in alist whose car field is obj,
and returns that pair.  If no pair in alist has obj as its
car, then #f (not the empty list) is returned.  Assq uses
eq? to compare obj with the car fields of the pairs in alist,
while assv uses eqv? and assoc uses equal?.

(define e '((a 1) (b 2) (c 3)))

(assq 'a e)             ===>  (a 1)

(assq 'b e)             ===>  (b 2)

(assq 'd e)             ===>  #f

(assq (list 'a) '(((a)) ((b)) ((c))))

                        ===>  #f

(assoc (list 'a) '(((a)) ((b)) ((c))))   

                                   ===>  ((a))

(assq 5 '((2 3) (5 7) (11 13)))    

                                   ===>  unspecified

(assv 5 '((2 3) (5 7) (11 13)))    

                                   ===>  (5 7)

Rationale:  
Although they are ordinarily used as predicates,
memq, memv, member, assq, assv, and assoc do not
have question marks in their names because they return useful values rather
than just #t or #f.")
    ("cddddr" . "library procedure:  (cddddr pair) 

These procedures are compositions of car and cdr, where
for example caddr could be defined by

(define caddr (lambda (x) (car (cdr (cdr x))))).

Arbitrary compositions, up to four deep, are provided.  There are
twenty-eight of these procedures in all.")
    ("equal?" . "library procedure:  (equal? obj_1 obj_2) 

Equal? recursively compares the contents of pairs, vectors, and
strings, applying eqv? on other objects such as numbers and symbols.
A rule of thumb is that objects are generally equal? if they print
the same.  Equal? may fail to terminate if its arguments are
circular data structures.

(equal? 'a 'a)                          ===>  #t

(equal? '(a) '(a))                      ===>  #t

(equal? '(a (b) c)

        '(a (b) c))                     ===>  #t

(equal? \"abc\" \"abc\")                    ===>  #t

(equal? 2 2)                            ===>  #t

(equal? (make-vector 5 'a)

        (make-vector 5 'a))             ===>  #t

(equal? (lambda (x) x)

        (lambda (y) y))          ===>  unspecified")
    ("call-with-input-file" . "library procedure:  (call-with-input-file string proc) 

library procedure:  (call-with-output-file string proc) 

String should be a string naming a file, and
proc should be a procedure that accepts one argument.
For call-with-input-file,
the file should already exist; for
call-with-output-file,
the effect is unspecified if the file
already exists. These procedures call proc with one argument: the
port obtained by opening the named file for input or output.  If the
file cannot be opened, an error is signalled.  If proc returns,
then the port is closed automatically and the value(s) yielded by the
proc is(are) returned.  If proc does not return, then 
the port will not be closed automatically unless it is possible to
prove that the port will never again be used for a read or write
operation.

Rationale:  
Because Scheme's escape procedures have unlimited extent, it  is
possible to escape from the current continuation but later to escape back in. 
If implementations were permitted to close the port on any escape from the
current continuation, then it would be impossible to write portable code using
both call-with-current-continuation and call-with-input-file or
call-with-output-file.")
    ("char-numeric?" . "library procedure:  (char-numeric? char) 

library procedure:  (char-whitespace? char) 

library procedure:  (char-upper-case? letter) 

library procedure:  (char-lower-case? letter) 

These procedures return #t if their arguments are alphabetic,
numeric, whitespace, upper case, or lower case characters, respectively,
otherwise they return #f.  The following remarks, which are specific to
the ASCII character set, are intended only as a guide:  The alphabetic characters
are the 52 upper and lower case letters.  The numeric characters are the
ten decimal digits.  The whitespace characters are space, tab, line
feed, form feed, and carriage return.")
    ("boolean?" . "3.2  Disjointness of types

No object satisfies more than one of the following predicates:

boolean?          pair?

symbol?           number?

char?             string?

vector?           port?

procedure?

These predicates define the types boolean, pair, symbol, number, char (or character), string, vector, port, and procedure.  The empty list is a special
object of its own type; it satisfies none of the above predicates.

Although there is a separate boolean type,
any Scheme value can be used as a boolean value for the purpose of a
conditional test.  As explained in section 6.3.1, all
values count as true in such a test except for #f.
This report uses the word ``true'' to refer to any
Scheme value except #f, and the word ``false'' to refer to
#f.")
    ("dynamic-wind" . "procedure:  (dynamic-wind before thunk after) 

Calls thunk without arguments, returning the result(s) of this call.
Before and after are called, also without arguments, as required
by the following rules (note that in the absence of calls to continuations
captured using call-with-current-continuation the three arguments are
called once each, in order).  Before is called whenever execution
enters the dynamic extent of the call to thunk and after is called
whenever it exits that dynamic extent.  The dynamic extent of a procedure
call is the period between when the call is initiated and when it
returns.  In Scheme, because of call-with-current-continuation, the
dynamic extent of a call may not be a single, connected time period.
It is defined as follows:

The dynamic extent is entered when execution of the body of the
called procedure begins.

The dynamic extent is also entered when execution is not within
the dynamic extent and a continuation is invoked that was captured
(using call-with-current-continuation) during the dynamic extent.

It is exited when the called procedure returns.

It is also exited when execution is within the dynamic extent and
a continuation is invoked that was captured while not within the
dynamic extent.

If a second call to dynamic-wind occurs within the dynamic extent of the
call to thunk and then a continuation is invoked in such a way that the
afters from these two invocations of dynamic-wind are both to be
called, then the after associated with the second (inner) call to
dynamic-wind is called first.

If a second call to dynamic-wind occurs within the dynamic extent of the
call to thunk and then a continuation is invoked in such a way that the
befores from these two invocations of dynamic-wind are both to be
called, then the before associated with the first (outer) call to
dynamic-wind is called first.

If invoking a continuation requires calling the before from one call
to dynamic-wind and the after from another, then the after
is called first.

The effect of using a captured continuation to enter or exit the dynamic
extent of a call to before or after is undefined.

(let ((path '())

      (c #f))

  (let ((add (lambda (s)

               (set! path (cons s path)))))

    (dynamic-wind

      (lambda () (add 'connect))

      (lambda ()

        (add (call-with-current-continuation

               (lambda (c0)

                 (set! c c0)

                 'talk1))))

      (lambda () (add 'disconnect)))

    (if (< (length path) 4)

        (c 'talk2)

        (reverse path))))

                ===> (connect talk1 disconnect

               connect talk2 disconnect)")
    ("sqrt" . "procedure:  (sqrt z) 

Returns the principal square root of z.  The result will have
either positive real part, or zero real part and non-negative imaginary
part.")
    ("make-string" . "procedure:  (make-string k) 

procedure:  (make-string k char) 

Make-string returns a newly allocated string of
length k.  If char is given, then all elements of the string
are initialized to char, otherwise the contents of the
string are unspecified.")
    ("string?" . "3.2  Disjointness of types

No object satisfies more than one of the following predicates:

boolean?          pair?

symbol?           number?

char?             string?

vector?           port?

procedure?

These predicates define the types boolean, pair, symbol, number, char (or character), string, vector, port, and procedure.  The empty list is a special
object of its own type; it satisfies none of the above predicates.

Although there is a separate boolean type,
any Scheme value can be used as a boolean value for the purpose of a
conditional test.  As explained in section 6.3.1, all
values count as true in such a test except for #f.
This report uses the word ``true'' to refer to any
Scheme value except #f, and the word ``false'' to refer to
#f.")
    ("memq" . "library procedure:  (memq obj list) 

library procedure:  (memv obj list) 

library procedure:  (member obj list) 

These procedures return the first sublist of list whose car is
obj, where the sublists of list are the non-empty lists
returned by (list-tail list k) for k less
than the length of list.  If
obj does not occur in list, then #f (not the empty list) is
returned.  Memq uses eq? to compare obj with the elements of
list, while memv uses eqv? and member uses equal?.

(memq 'a '(a b c))                      ===>  (a b c)

(memq 'b '(a b c))                      ===>  (b c)

(memq 'a '(b c d))                      ===>  #f

(memq (list 'a) '(b (a) c))             ===>  #f

(member (list 'a)

        '(b (a) c))                     ===>  ((a) c)

(memq 101 '(100 101 102))               ===>  unspecified

(memv 101 '(100 101 102))               ===>  (101 102)")
    ("pair?" . "3.2  Disjointness of types

No object satisfies more than one of the following predicates:

boolean?          pair?

symbol?           number?

char?             string?

vector?           port?

procedure?

These predicates define the types boolean, pair, symbol, number, char (or character), string, vector, port, and procedure.  The empty list is a special
object of its own type; it satisfies none of the above predicates.

Although there is a separate boolean type,
any Scheme value can be used as a boolean value for the purpose of a
conditional test.  As explained in section 6.3.1, all
values count as true in such a test except for #f.
This report uses the word ``true'' to refer to any
Scheme value except #f, and the word ``false'' to refer to
#f.")
    ("call-with-output-file" . "library procedure:  (call-with-output-file string proc) 

String should be a string naming a file, and
proc should be a procedure that accepts one argument.
For call-with-input-file,
the file should already exist; for
call-with-output-file,
the effect is unspecified if the file
already exists. These procedures call proc with one argument: the
port obtained by opening the named file for input or output.  If the
file cannot be opened, an error is signalled.  If proc returns,
then the port is closed automatically and the value(s) yielded by the
proc is(are) returned.  If proc does not return, then 
the port will not be closed automatically unless it is possible to
prove that the port will never again be used for a read or write
operation.

Rationale:  
Because Scheme's escape procedures have unlimited extent, it  is
possible to escape from the current continuation but later to escape back in. 
If implementations were permitted to close the port on any escape from the
current continuation, then it would be impossible to write portable code using
both call-with-current-continuation and call-with-input-file or
call-with-output-file.")
    ("string->list" . "library procedure:  (string->list string) 

library procedure:  (list->string list) 

String->list returns a newly allocated list of the
characters that make up the given string.  List->string
returns a newly allocated string formed from the characters in the list
list, which must be a list of characters. String->list
and list->string are
inverses so far as equal? is concerned.")
    ("<=" . "procedure:  (<= x_1 x_2 x_3 ...) 

procedure:  (>= x_1 x_2 x_3 ...) 

These procedures return #t if their arguments are (respectively):
equal, monotonically increasing, monotonically decreasing,
monotonically nondecreasing, or monotonically nonincreasing.

These predicates are required to be transitive.

Note:  
The traditional implementations of these predicates in Lisp-like
languages are not transitive.

Note:  
While it is not an error to compare inexact numbers using these
predicates, the results may be unreliable because a small inaccuracy
may affect the result; this is especially true of = and zero?.
When in doubt, consult a numerical analyst.")
    ("ceiling" . "procedure:  (ceiling x) 

procedure:  (truncate x) 

procedure:  (round x) 

These procedures return integers.
Floor returns the largest integer not larger than x.
Ceiling returns the smallest integer not smaller than x.
Truncate returns the integer closest to x whose absolute
value is not larger than the absolute value of x.  Round returns the
closest integer to x, rounding to even when x is halfway between two
integers.

Rationale:  
Round rounds to even for consistency with the default rounding
mode specified by the IEEE floating point standard.

Note:  
If the argument to one of these procedures is inexact, then the result
will also be inexact.  If an exact value is needed, the
result should be passed to the inexact->exact procedure.

(floor -4.3)                  ===>  -5.0

(ceiling -4.3)                ===>  -4.0

(truncate -4.3)               ===>  -4.0

(round -4.3)                  ===>  -4.0

(floor 3.5)                   ===>  3.0

(ceiling 3.5)                 ===>  4.0

(truncate 3.5)                ===>  3.0

(round 3.5)                   ===>  4.0  ; inexact

(round 7/2)                   ===>  4    ; exact

(round 7)                     ===>  7")
    ("char-whitespace?" . "library procedure:  (char-whitespace? char) 

library procedure:  (char-upper-case? letter) 

library procedure:  (char-lower-case? letter) 

These procedures return #t if their arguments are alphabetic,
numeric, whitespace, upper case, or lower case characters, respectively,
otherwise they return #f.  The following remarks, which are specific to
the ASCII character set, are intended only as a guide:  The alphabetic characters
are the 52 upper and lower case letters.  The numeric characters are the
ten decimal digits.  The whitespace characters are space, tab, line
feed, form feed, and carriage return.")
    ("set-cdr!" . "procedure:  (set-cdr! pair obj) 

Stores obj in the cdr field of pair.
The value returned by set-cdr! is unspecified.")
    ("length" . "library procedure:  (length list) 

Returns the length of list.

(length '(a b c))                       ===>  3

(length '(a (b) (c d e)))               ===>  3

(length '())                            ===>  0")
    ("string>=?" . "library procedure:  (string>=? string_1 string_2) 

library procedure:  (string-ci<? string_1 string_2) 

library procedure:  (string-ci>? string_1 string_2) 

library procedure:  (string-ci<=? string_1 string_2) 

library procedure:  (string-ci>=? string_1 string_2) 

These procedures are the lexicographic extensions to strings of the
corresponding orderings on characters.  For example, string<? is
the lexicographic ordering on strings induced by the ordering
char<? on characters.  If two strings differ in length but
are the same up to the length of the shorter string, the shorter string
is considered to be lexicographically less than the longer string.

Implementations may generalize these and the string=? and
string-ci=? procedures to take more than two arguments, as with
the corresponding numerical predicates.")
    ("write" . "library procedure:  (write obj) 

library procedure:  (write obj port) 

Writes a written representation of obj to the given port.  Strings
that appear in the written representation are enclosed in doublequotes, and
within those strings backslash and doublequote characters are
escaped by backslashes.
Character objects are written using the #\\ notation.
Write returns an unspecified value.  The
port argument may be omitted, in which case it defaults to the value
returned by current-output-port.")
    ("memv" . "library procedure:  (memv obj list) 

library procedure:  (member obj list) 

These procedures return the first sublist of list whose car is
obj, where the sublists of list are the non-empty lists
returned by (list-tail list k) for k less
than the length of list.  If
obj does not occur in list, then #f (not the empty list) is
returned.  Memq uses eq? to compare obj with the elements of
list, while memv uses eqv? and member uses equal?.

(memq 'a '(a b c))                      ===>  (a b c)

(memq 'b '(a b c))                      ===>  (b c)

(memq 'a '(b c d))                      ===>  #f

(memq (list 'a) '(b (a) c))             ===>  #f

(member (list 'a)

        '(b (a) c))                     ===>  ((a) c)

(memq 101 '(100 101 102))               ===>  unspecified

(memv 101 '(100 101 102))               ===>  (101 102)")
    ("string>?" . "library procedure:  (string>? string_1 string_2) 

library procedure:  (string<=? string_1 string_2) 

library procedure:  (string>=? string_1 string_2) 

library procedure:  (string-ci<? string_1 string_2) 

library procedure:  (string-ci>? string_1 string_2) 

library procedure:  (string-ci<=? string_1 string_2) 

library procedure:  (string-ci>=? string_1 string_2) 

These procedures are the lexicographic extensions to strings of the
corresponding orderings on characters.  For example, string<? is
the lexicographic ordering on strings induced by the ordering
char<? on characters.  If two strings differ in length but
are the same up to the length of the shorter string, the shorter string
is considered to be lexicographically less than the longer string.

Implementations may generalize these and the string=? and
string-ci=? procedures to take more than two arguments, as with
the corresponding numerical predicates.")
    ("with-input-from-file" . "optional procedure:  (with-input-from-file string thunk) 

optional procedure:  (with-output-to-file string thunk) 

String should be a string naming a file, and
proc should be a procedure of no arguments.
For with-input-from-file,
the file should already exist; for
with-output-to-file,
the effect is unspecified if the file
already exists.
The file is opened for input or output, an input or output port
connected to it is made the default value returned by
current-input-port or current-output-port
(and is used by (read), (write obj), and so forth),
and the
thunk is called with no arguments.  When the thunk returns,
the port is closed and the previous default is restored.
With-input-from-file and with-output-to-file return(s) the
value(s) yielded by thunk.
If an escape procedure
is used to escape from the continuation of these procedures, their
behavior is implementation dependent.")
    ("char-lower-case?" . "library procedure:  (char-lower-case? letter) 

These procedures return #t if their arguments are alphabetic,
numeric, whitespace, upper case, or lower case characters, respectively,
otherwise they return #f.  The following remarks, which are specific to
the ASCII character set, are intended only as a guide:  The alphabetic characters
are the 52 upper and lower case letters.  The numeric characters are the
ten decimal digits.  The whitespace characters are space, tab, line
feed, form feed, and carriage return.")
    ("string-ci>?" . "library procedure:  (string-ci>? string_1 string_2) 

library procedure:  (string-ci<=? string_1 string_2) 

library procedure:  (string-ci>=? string_1 string_2) 

These procedures are the lexicographic extensions to strings of the
corresponding orderings on characters.  For example, string<? is
the lexicographic ordering on strings induced by the ordering
char<? on characters.  If two strings differ in length but
are the same up to the length of the shorter string, the shorter string
is considered to be lexicographically less than the longer string.

Implementations may generalize these and the string=? and
string-ci=? procedures to take more than two arguments, as with
the corresponding numerical predicates.")
    ("remainder" . "procedure:  (remainder n_1 n_2) 

procedure:  (modulo n_1 n_2) 

These procedures implement number-theoretic (integer)
division.  n_2 should be non-zero.  All three procedures
return integers.  If n_1/n_2 is an integer:

    (quotient n_1 n_2)           ===> n_1/n_2

    (remainder n_1 n_2)          ===> 0

    (modulo n_1 n_2)             ===> 0

If n_1/n_2 is not an integer:

    (quotient n_1 n_2)           ===> n_q

    (remainder n_1 n_2)          ===> n_r

    (modulo n_1 n_2)             ===> n_m

where n_q is n_1/n_2 rounded towards zero,
0 < |n_r| < |n_2|, 0 < |n_m| < |n_2|,
n_r and n_m differ from n_1 by a multiple of n_2,
n_r has the same sign as n_1, and
n_m has the same sign as n_2.

From this we can conclude that for integers n_1 and n_2 with
n_2 not equal to 0,

     (= n_1 (+ (* n_2 (quotient n_1 n_2))

           (remainder n_1 n_2)))

                                         ===>  #t

provided all numbers involved in that computation are exact.

(modulo 13 4)                   ===>  1

(remainder 13 4)                ===>  1

(modulo -13 4)                  ===>  3

(remainder -13 4)               ===>  -1

(modulo 13 -4)                  ===>  -3

(remainder 13 -4)               ===>  1

(modulo -13 -4)                 ===>  -1

(remainder -13 -4)              ===>  -1

(remainder -13 -4.0)            ===>  -1.0  ; inexact")
    (">=" . "procedure:  (>= x_1 x_2 x_3 ...) 

These procedures return #t if their arguments are (respectively):
equal, monotonically increasing, monotonically decreasing,
monotonically nondecreasing, or monotonically nonincreasing.

These predicates are required to be transitive.

Note:  
The traditional implementations of these predicates in Lisp-like
languages are not transitive.

Note:  
While it is not an error to compare inexact numbers using these
predicates, the results may be unreliable because a small inaccuracy
may affect the result; this is especially true of = and zero?.
When in doubt, consult a numerical analyst.")
    ("cons" . "procedure:  (cons obj_1 obj_2) 

Returns a newly allocated pair whose car is obj_1 and whose cdr is
obj_2.  The pair is guaranteed to be different (in the sense of
eqv?) from every existing object.

(cons 'a '())                   ===>  (a)

(cons '(a) '(b c d))            ===>  ((a) b c d)

(cons \"a\" '(b c))               ===>  (\"a\" b c)

(cons 'a 3)                     ===>  (a . 3)

(cons '(a b) 'c)                ===>  ((a b) . c)")
    ("cond" . "library syntax:  (cond <clause_1> <clause_2> ...) 

Syntax: Each <clause> should be of the form

(<test> <expression_1> ...)

where <test> is any expression.  Alternatively, a <clause> may be
of the form

(<test> => <expression>)

The last <clause> may be
an ``else clause,'' which has the form

(else <expression_1> <expression_2> ...).

Semantics: A cond expression is evaluated by evaluating the <test>
expressions of successive <clause>s in order until one of them
evaluates to a true value (see
section 6.3.1).  When a <test> evaluates to a true
value, then the remaining <expression>s in its <clause> are
evaluated in order, and the result(s) of the last <expression> in the
<clause> is(are) returned as the result(s) of the entire cond
expression.  If the selected <clause> contains only the
<test> and no <expression>s, then the value of the
<test> is returned as the result.  If the selected <clause> uses the
=> alternate form, then the <expression> is evaluated.
Its value must be a procedure that accepts one argument; this procedure is then
called on the value of the <test> and the value(s) returned by this
procedure is(are) returned by the cond expression.
If all <test>s evaluate
to false values, and there is no else clause, then the result of
the conditional expression is unspecified; if there is an else
clause, then its <expression>s are evaluated, and the value(s) of
the last one is(are) returned.

(cond ((> 3 2) 'greater)

      ((< 3 2) 'less))                 ===>  greater

(cond ((> 3 3) 'greater)

      ((< 3 3) 'less)

      (else 'equal))                    ===>  equal

(cond ((assv 'b '((a 1) (b 2))) => cadr)

      (else #f))                 ===>  2")
    ("quotient" . "procedure:  (quotient n_1 n_2) 

procedure:  (remainder n_1 n_2) 

procedure:  (modulo n_1 n_2) 

These procedures implement number-theoretic (integer)
division.  n_2 should be non-zero.  All three procedures
return integers.  If n_1/n_2 is an integer:

    (quotient n_1 n_2)           ===> n_1/n_2

    (remainder n_1 n_2)          ===> 0

    (modulo n_1 n_2)             ===> 0

If n_1/n_2 is not an integer:

    (quotient n_1 n_2)           ===> n_q

    (remainder n_1 n_2)          ===> n_r

    (modulo n_1 n_2)             ===> n_m

where n_q is n_1/n_2 rounded towards zero,
0 < |n_r| < |n_2|, 0 < |n_m| < |n_2|,
n_r and n_m differ from n_1 by a multiple of n_2,
n_r has the same sign as n_1, and
n_m has the same sign as n_2.

From this we can conclude that for integers n_1 and n_2 with
n_2 not equal to 0,

     (= n_1 (+ (* n_2 (quotient n_1 n_2))

           (remainder n_1 n_2)))

                                         ===>  #t

provided all numbers involved in that computation are exact.

(modulo 13 4)                   ===>  1

(remainder 13 4)                ===>  1

(modulo -13 4)                  ===>  3

(remainder -13 4)               ===>  -1

(modulo 13 -4)                  ===>  -3

(remainder 13 -4)               ===>  1

(modulo -13 -4)                 ===>  -1

(remainder -13 -4)              ===>  -1

(remainder -13 -4.0)            ===>  -1.0  ; inexact")
    ("vector?" . "3.2  Disjointness of types

No object satisfies more than one of the following predicates:

boolean?          pair?

symbol?           number?

char?             string?

vector?           port?

procedure?

These predicates define the types boolean, pair, symbol, number, char (or character), string, vector, port, and procedure.  The empty list is a special
object of its own type; it satisfies none of the above predicates.

Although there is a separate boolean type,
any Scheme value can be used as a boolean value for the purpose of a
conditional test.  As explained in section 6.3.1, all
values count as true in such a test except for #f.
This report uses the word ``true'' to refer to any
Scheme value except #f, and the word ``false'' to refer to
#f.")
    ("string-ci=?" . "library procedure:  (string-ci=? string_1 string_2) 

Returns #t if the two strings are the same length and contain the same
characters in the same positions, otherwise returns #f.
String-ci=? treats
upper and lower case letters as though they were the same character, but
string=? treats upper and lower case as distinct characters.")
    ("delay" . "library syntax:  (delay <expression>) 

The delay construct is used together with the procedure force to
implement lazy evaluation or call by need.
(delay <expression>) returns an object called a
promise which at some point in the future may be asked (by
the force procedure)  to evaluate
<expression>, and deliver the resulting value.
The effect of <expression> returning multiple values
is unspecified.

See the description of force (section 6.4) for a
more complete description of delay.")
    ("if" . "syntax:  (if <test> <consequent> <alternate>) 

syntax:  (if <test> <consequent>) 

Syntax: <Test>, <consequent>, and <alternate> may be arbitrary
expressions.

Semantics: An if expression is evaluated as follows: first,
<test> is evaluated.  If it yields a true value (see
section 6.3.1), then <consequent> is evaluated and
its value(s) is(are) returned.  Otherwise <alternate> is evaluated and its
value(s) is(are) returned.  If <test> yields a false value and no
<alternate> is specified, then the result of the expression is
unspecified.

(if (> 3 2) 'yes 'no)                   ===>  yes

(if (> 2 3) 'yes 'no)                   ===>  no

(if (> 3 2)

    (- 3 2)

    (+ 3 2))                            ===>  1")
    ("read-char" . "procedure:  (read-char) 

procedure:  (read-char port) 

Returns the next character available from the input port, updating
the port to point to the following character.  If no more characters
are available, an end of file object is returned.  Port may be
omitted, in which case it defaults to the value returned by current-input-port.")
    ("exp" . "procedure:  (exp z) 

procedure:  (log z) 

procedure:  (sin z) 

procedure:  (cos z) 

procedure:  (tan z) 

procedure:  (asin z) 

procedure:  (acos z) 

procedure:  (atan z) 

procedure:  (atan y x) 

These procedures are part of every implementation that supports
general
real numbers; they compute the usual transcendental functions.  Log
computes the natural logarithm of z (not the base ten logarithm).
Asin, acos, and atan compute arcsine (sin-1),
arccosine (cos-1), and arctangent (tan-1), respectively.
The two-argument variant of atan computes (angle
(make-rectangular x y)) (see below), even in implementations
that don't support general complex numbers.

In general, the mathematical functions log, arcsine, arccosine, and
arctangent are multiply defined.
The value of log z is defined to be the one whose imaginary
part lies in the range from  -  (exclusive) to  (inclusive).
log 0 is undefined.
With log defined this way, the values of sin-1 z, cos-1 z,
and tan-1 z are according to the following formul&aelig;:

sin-1 z  =   - i log (i z  +  (1  -  z2)1/2)

cos-1 z  =   / 2  -  sin-1 z

tan-1 z  =  (log (1  +  i z)  -  log (1  -  i z)) / (2 i)

The above specification follows [27], which in turn
cites [19]; refer to these sources for more detailed
discussion of branch cuts, boundary conditions, and implementation of
these functions.  When it is possible these procedures produce a real
result from a real argument.")
    ("=>" . "library syntax:  (cond <clause_1> <clause_2> ...) 

Syntax: Each <clause> should be of the form

(<test> <expression_1> ...)

where <test> is any expression.  Alternatively, a <clause> may be
of the form

(<test> => <expression>)

The last <clause> may be
an ``else clause,'' which has the form

(else <expression_1> <expression_2> ...).

Semantics: A cond expression is evaluated by evaluating the <test>
expressions of successive <clause>s in order until one of them
evaluates to a true value (see
section 6.3.1).  When a <test> evaluates to a true
value, then the remaining <expression>s in its <clause> are
evaluated in order, and the result(s) of the last <expression> in the
<clause> is(are) returned as the result(s) of the entire cond
expression.  If the selected <clause> contains only the
<test> and no <expression>s, then the value of the
<test> is returned as the result.  If the selected <clause> uses the
=> alternate form, then the <expression> is evaluated.
Its value must be a procedure that accepts one argument; this procedure is then
called on the value of the <test> and the value(s) returned by this
procedure is(are) returned by the cond expression.
If all <test>s evaluate
to false values, and there is no else clause, then the result of
the conditional expression is unspecified; if there is an else
clause, then its <expression>s are evaluated, and the value(s) of
the last one is(are) returned.

(cond ((> 3 2) 'greater)

      ((< 3 2) 'less))                 ===>  greater

(cond ((> 3 3) 'greater)

      ((< 3 3) 'less)

      (else 'equal))                    ===>  equal

(cond ((assv 'b '((a 1) (b 2))) => cadr)

      (else #f))                 ===>  2")
    ("symbol?" . "3.2  Disjointness of types

No object satisfies more than one of the following predicates:

boolean?          pair?

symbol?           number?

char?             string?

vector?           port?

procedure?

These predicates define the types boolean, pair, symbol, number, char (or character), string, vector, port, and procedure.  The empty list is a special
object of its own type; it satisfies none of the above predicates.

Although there is a separate boolean type,
any Scheme value can be used as a boolean value for the purpose of a
conditional test.  As explained in section 6.3.1, all
values count as true in such a test except for #f.
This report uses the word ``true'' to refer to any
Scheme value except #f, and the word ``false'' to refer to
#f.")
    ("procedure?" . "3.2  Disjointness of types

No object satisfies more than one of the following predicates:

boolean?          pair?

symbol?           number?

char?             string?

vector?           port?

procedure?

These predicates define the types boolean, pair, symbol, number, char (or character), string, vector, port, and procedure.  The empty list is a special
object of its own type; it satisfies none of the above predicates.

Although there is a separate boolean type,
any Scheme value can be used as a boolean value for the purpose of a
conditional test.  As explained in section 6.3.1, all
values count as true in such a test except for #f.
This report uses the word ``true'' to refer to any
Scheme value except #f, and the word ``false'' to refer to
#f.")
    ("expt" . "procedure:  (expt z_1 z_2) 

Returns z_1 raised to the power z_2.  For z_1  0

z_1z_2  =  ez_2 log z_1

0z is 1 if z  =  0 and 0 otherwise.")
    ("string-fill!" . "library procedure:  (string-fill! string char) 

Stores char in every element of the given string and returns an
unspecified value.")
    ("string-ci<?" . "library procedure:  (string-ci<? string_1 string_2) 

library procedure:  (string-ci>? string_1 string_2) 

library procedure:  (string-ci<=? string_1 string_2) 

library procedure:  (string-ci>=? string_1 string_2) 

These procedures are the lexicographic extensions to strings of the
corresponding orderings on characters.  For example, string<? is
the lexicographic ordering on strings induced by the ordering
char<? on characters.  If two strings differ in length but
are the same up to the length of the shorter string, the shorter string
is considered to be lexicographically less than the longer string.

Implementations may generalize these and the string=? and
string-ci=? procedures to take more than two arguments, as with
the corresponding numerical predicates.")
    ("peek-char" . "procedure:  (peek-char) 

procedure:  (peek-char port) 

Returns the next character available from the input port,
without updating
the port to point to the following character.  If no more characters
are available, an end of file object is returned.  Port may be
omitted, in which case it defaults to the value returned by current-input-port.

Note:  
The value returned by a call to peek-char is the same as the
value that would have been returned by a call to read-char with the
same port.  The only difference is that the very next call to
read-char or peek-char on that port will return the
value returned by the preceding call to peek-char.  In particular, a call
to peek-char on an interactive port will hang waiting for input
whenever a call to read-char would have hung.")
    ("string=?" . "library procedure:  (string=? string_1 string_2) 

library procedure:  (string-ci=? string_1 string_2) 

Returns #t if the two strings are the same length and contain the same
characters in the same positions, otherwise returns #f.
String-ci=? treats
upper and lower case letters as though they were the same character, but
string=? treats upper and lower case as distinct characters.")
  ))

(define (assoc-ci key alist)
  (cond ((null? alist) #f)
        ((string-ci=? key (car (car alist))) (car alist))
        (else (assoc-ci key (cdr alist)))))

;; (r5rs-doc-string word)
;; Returns the R5RS documentation string for the given keyword or procedure,
;; or #f if not found. The word can be a symbol or a string. Search is case-insensitive.
(define (r5rs-doc-string word)
  (let* ((word-str (if (symbol? word) (symbol->string word) word))
         (entry (assoc-ci word-str *r5rs-docs*)))
    (if entry (cdr entry) #f)))

;; (r5rs-doc word)
;; Looks up and prints the R5RS documentation for the given keyword or procedure.
(define (r5rs-doc word)
  (let ((doc-str (r5rs-doc-string word)))
    (if doc-str
        (display doc-str)
        (begin
          (display "Documentation not found for ")
          (display word)))
    (newline)))

;; (r5rs-doc-list)
;; Returns a list of all symbols/keywords available for documentation lookup.
(define (r5rs-doc-list)
  (map car *r5rs-docs*))
