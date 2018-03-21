Idris
#####
A Programming Language with Dependent Types
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

:Author: Sumner Evans and Sam Sartor
:Date: 2018-03-22

.. Requirements:
.. - Introduces the programming language, its goals, and its history
.. - Classifies the language, and provides an overview of the language’s
     features
.. - Evaluates the language using the criteria presented in class (is it more
     writable than readable? Etcetera etcetera etcetera.)
.. - What is interesting and unique about this language?
.. - Describes syntactic details that may make the language more expressive, but
     avoid describing lots of syntactic details (find a select few details that
     are important to the language)
.. - Describes your example code, why you wrote it, what it shows, what it does,
     what problems you encountered, etc.

What is Idris?
==============

    "Idris is a general purpose pure functional programming language with
    dependent types."

    -- The Idris Website

- **Version 0.1.3** of Idris was released in December of 2009.
- **Version 1.2.0** is the latest stable release and was released on January 9,
  2018.
- Idris was named after the singing dragon in the 1970s UK children's television
  program *Ivor the Engine*.
- Idris development is led by Edwin Brady at the University of St. Andrews.

The Obligatory Picture of This Madman
=====================================

.. image:: graphics/edwin-brady.jpg

Properties of Idris
===================

- Idris can be **interpreted, transpiled, or compiled**
- Idris is **statically typed**
- Idris is **strongly typed**

As you will see as this presentation goes on, Idris is **only typed**.


Idris Features
==============

- Haskell-like syntax
- 

.. TODO haskell-like syntax, ...
.. TODO as we discuss these, talk about the evaluation metrics of Idris
   (readability, writabality, etc.)

Idris Syntax
============

.. TODO maybe combine with Idris Features?

.. TODO we are supposed to just concentrate on a couple of features that make it
        nice. I think we focus on the function definition syntax, holes, and
        data definition syntax (this segways well into the next part about
        dependent types and the proof assistant)

What Makes Idris Unique?
========================

.. TODO dependent types and proof assistant

What is a Dependent Type?
=========================

.. TODO

Using Idris as a Proof Assistant
================================

.. TODO run away, run away quickly
.. TODO this section is where we will have our code demos

Quotes From Our Exploration
===========================

    "The concept of a programming language in which the possibility of inline
    assembly is an entirely foreign concept hurts my brain."

..

    "Where do I put it? Do I put it in the type?"

..

    "When your Rust program compiles, you know it won't segfault, or give you
    any undefined behavior at runtime. When your Idris program compiles, you
    throw away your executable, and publish your dissertation."

Questions?
==========
