# devops.tex

This is a collection of LaTeX classes and styles for use at DevOps Utrecht.
They are intended for use in minutes, and to provide shared font settings
for other documents in LaTeX.

Forked from [this repository](https://github.com/svsticky/sticky.tex).

## Versioning

The classes in this package follow [`semver`](http://semver.org/).

## Dependencies

These files require LaTeX2e. Older versions are not supported.

`devops_typography.cls` dependencies:

 - `bitstream-charter`
 - `carlito`
 - `fontenc`
 - `titlesec`

`devops_minutes.cls` dependencies:

 - `devops_typography`
 - `fancyhdr`
 - `lastpage`
 - `multido`
 - `xspace`

## Installation

Make sure you have the dependencies installed. After that there are two ways of
installing these styles:

 1. Put the `.cls` files in the same directory as your `.tex` file, you're done. Easy
    for simple, one-off documents.
 1. Install these classes in your `TEXMFHOME`. This is more involved, but after you
    have done this, you never have to copy the style files again.

### `TEXMFHOME` installation

Run the following command to find your `TEXMFHOME`. This should work both on Windows
and UNIX-y systems.

```
kpsewhich -var-value=TEXMFHOME
```

This will probably show a value like `C:/Users/<user>/texmf` or `~/texmf`. Place the
files you want in `TEXMFHOME/tex/latex/commonstuff`. Create the directory if you must.

For example, if your `TEXMFHOME` is `C:/Users/duijf/texmf`, you should place the `.cls`
files in `C:/Users/duijf/texmf/tex/latex/commonstuff`. After that, they should get
picked up. You can verify the installation with the `kpsewhich` command. For example:

```
kpsewhich devops_minutes.cls
```

## Usage

Here is a basic document that shows off the basic package API:

```latex
\documentclass[a4paper]{devops_minutes}
% Set the document language. The devops_minutes.cls file supports Dutch and English
\usepackage[english]{babel}

% Set the metadata of the meeting:
\committee{Trivial matters committee}
\members{John Doe, Mike Smith, Mark Williams, Sofia Thompson, Emily Young, Amanda Walker}
\absent{Mike Smith}
\guests{Maria Scott}
\notetaker{Sofia Thompson}
\date{2015-02-17}

\begin{document}

\header

\section{Opening}

The chairman opens the meeting on 15:01.

\section{Announcements}

Emily says [..]

Mark tells [..]

\section{Open issues}

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec interdum felis nec dui
cursus, vitae tempor urna volutpat. Donec pretium dapibus lacus, et molestie felis
convallis eget.

\action{Sofia}{2015-03-01}{Prepare a presentation for the thing.}

Nunc nec erat dictum mi varius finibus. Phasellus porta fermentum eros
a iaculis. Quisque viverra, justo a laoreet consequat, eros metus pretium velit, sit
amet blandit lorem enim non tellus.

\action{Mike}{tomorrow}{Talk to Steven about the other thing.}

Fusce facilisis at tellus ut tempor. Curabitur eleifend augue eu lorem molestie
semper. Sed fringilla laoreet malesuada. Sed vulputate blandit orci, sit amet
pellentesque ante lacinia id. Pellentesque ac tortor egestas, gravida nibh ut,
dapibus est. In dapibus tristique enim non accumsan. Nulla vulputate lacus in lorem
mattis hendrerit.

\action{Sofia}{2015-02-24}{Make sure that the other other thing happens}

\section{Closing}

The chairman closes the meeting at 16:30.

\appendix
\actionlist

\end{document}
```

The above can also be found in `demo.tex`. This will produce a document with an
action list as appendix that sorts the action items per person as seen here:

![Action list demo](demo.png)

## API reference

Here is a list of all of the commands that are intended for author use in this
package.

| English               | Dutch                     | Description                                   |
| --------------------- | ------------------------- | --------------------------------------------- |
| `\committee{[name]}`  | `\commissie`, `\orgaan`   | The name of the committee of the minutes.     |
| `\members{[names]}`   | `\leden`                  | The members of the committee.                 |
| `\chair{[name]}`      | `\voorzitter`             | The chair of the committee.                   |
| `\absent{[names]}`    | `\afwezig`                | The persons that are absent.                  |
| `\guests{[names]}`    | `\gasten`                 | Guests to the meeting.                        |
| `\notetaker{[name]}`  | `\notulist`               | The author of the meeting minutes.            |
| `\date{[date]}        | `\datum`                  | The date of the meeting.                      |
| `\action{[name]}{[due]}{[content]}`
                        | `\ap`                     | Records an action item for a person.          |
| `\actionlist`         | `\actiepunten`            | Prints a sorted action list of the meeting.   |

## License

MIT with parts of the code under CC-BY-SA 3.0 unported because of their origin on
Stack Exchange. These sections are marked by comments, where you will also find
attribution. In the future the full list will be in this README as well.

See `LICENSE.md` for the MIT license and [here][cc-by-sa] for the relevant Creative
Commons License.

  [cc-by-sa]:https://creativecommons.org/licenses/by-sa/3.0/
