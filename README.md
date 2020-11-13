[![GitHub Actions](https://img.shields.io/github/workflow/status/fsrmatheinfo/mluexercise/CI?style=flat-square)](https://github.com/fsrmatheinfo/mluexercise/actions?query=workflow%3A"CI")

# 📄 mluexercise

[LaTeX](https://www.latex-project.org/) class for exercises/homework, maintained by the [Computer Science Student's Council](https://fachschaft.mathinf.uni-halle.de) at [Martin Luther University Halle-Wittenberg](https://uni-halle.de).

This class is _work in progress_ and subject to changes without prior notice. Development language is English for code readability reasons.

## Usage

At the moment, the `mluexercise` class is not distributed on [CTAN](https://ctan.org/).
Instead you should download the `mluexercise.cls` file from [releases](https://github.com/fsrmatheinfo/mluexercise/releases) and place it in the same folder as your LaTeX document.

## Development

The `mluexercise` class is written and documented in [`mluexercise.dtx`](mluexercise.dtx), which can then be used to generate `.ins` and `.sty` files as well as the class' documentation PDF:

```shell script
make
```

In the `.dtx` file, class code is written between the `%<*class>` and `%</class>` tags, whereas the package documentation can be mixed in by prefixing the line with a single `%`.
