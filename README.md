# 📄 mluexercise

[LaTeX](https://www.latex-project.org/) class for exercises/homework, maintained by the [Computer Science Student's Council](https://fachschaft.mathinf.uni-halle.de) at [Martin Luther University Halle-Wittenberg])(https://uni-halle.de).

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

## Goals

* Usability for first semester students with rather little LaTeX experience
* Consistency with [Martin Luther University's](https://uni-halle.de/) [brand guidelines](https://www.pr.uni-halle.de/download/logo/)