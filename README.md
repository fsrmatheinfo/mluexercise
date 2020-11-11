# 📄 mluexercise

[LaTeX](https://www.latex-project.org/) class for exercises/homework, maintained by the [Computer Science Student's Council](https://fachschaft.mathinf.uni-halle.de) at [Martin Luther University Halle-Wittenberg](https://uni-halle.de).

This class is _work in progress_ and subject to changes without prior notice. Development language is English for code readability reasons.

## Usage

At the moment, the `mluexercise` class is not distributed on [CTAN](https://ctan.org/).
Instead you should download [the `mluexercise.cls` file](mluexercise.cls) and place it in the same folder as your LaTeX document.
Then load the class in the preamble:

```tex
\documentclass[ngerman]{mluexercise}
```

### Parameters

Meta data about your exercise must be defined in the preamble.

| Command | Description | Example | Required |
| --- | --- | --- | --- |
| `\lecture{…}` | Lecture name | `\lecture{Linear Algebra}` | yes |
| `\semester{…}` | Semester | `\semester{WS 2020/2021}` | no |
| `\exercise{…}` | Exercise number | `\exercise{1}` | yes |
| `\task{…}` | Task number | `\task{2}` | no |
| `\group{…}` | Group number | `\group{3}` | no |
| `\studentname{…}` | Full student name | `\studentname{John Doe}` | yes |
| `\studentnumber{…}` | Matriculation number | `\studentnumber{234567890}` | no* |
| `\studentsymbol{…}` | University ID (same as for [Stud.IP](https://studip.uni-halle.de)) | `\studentsymbol{abcde}` | no* |

*Most professors require specifying either student number or symbol.

### Included packages

The `mluexercise` class loads a number of useful LaTeX packages which are needed to typeset exercises during the Bachelor's degree in Computer Science:

- [`babel`](https://ctan.org/pkg/babel) for proper hyphenation
- [`amsmath`](https://ctan.org/pkg/amsmath), [`amsthm`](https://ctan.org/pkg/amsthm), [`amssymb`](https://ctan.org/pkg/amssymb), [`amstext`](https://ctan.org/pkg/amstext), [`array`](https://ctan.org/pkg/array), and [`cancel`](https://ctan.org/pkg/cancel) for mathematics
- [`inputenc`](https://ctan.org/pkg/inputenc) and [`fontenc`](https://ctan.org/pkg/fontenc) for UTF8 support
- [`graphicx`](https://ctan.org/pkg/graphicx) for loading images and graphics
- [`xcolor`](https://ctan.org/pkg/xcolor) for defining colors
- [`tikz`](https://ctan.org/pkg/tikz) and [`pgfplots`](https://ctan.org/pkg/pgfplots) for drawing graphs and plots
- [`algorithm2e`](https://ctan.org/pkg/algorithm2e) for pseudocode/algorithms
- [`listings`](https://ctan.org/pkg/listings) and [`listingsutf8`](https://ctan.org/pkg/listingsutf8) for code listings (in UTF8)
- [`subcaption`](https://ctan.org/pkg/subcaption) for sub-figures
- [`csquotes`](https://ctan.org/pkg/csquotes) for quotation (not citation)

## Goals

- Usability for first semester students with rather little LaTeX experience
- Consistency with [Martin Luther University's](https://uni-halle.de/) [brand guidelines](https://www.pr.uni-halle.de/download/logo/)
- Bundle packages frequently needed by students