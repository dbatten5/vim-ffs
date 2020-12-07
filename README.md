# ffs.vim

Web searching based on the current filetype.

**ffs**: [F]iletype [F]ocused [S]earch

## Motivation

While I'm working in a python file, searching the word `Class` probably won't
give me helpful results; searching `python Class` probably will.

## Features

- `:FFS {query}` without a query to search the current word, with a query
to search for the query, all prefixed by the current filetype.

See the docs for configuration options.

## Installation

Use your favourite plugin manager to install this plugin. I like `vim-plug`:

```
Plug 'dbatten5/vim-ffs'
```
