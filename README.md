# ffs.vim

Google searching based on the current filetype.

**ffs**: [F]iletype [F]ocused [S]earch

## Motivation

While I'm working in a python file, Googling the word `Class` probably won't
give me helpful results. Googling `python Class` probably will.

## Features

- `:FFS {query}` without a query to Google the current word, with a query
to search for the query, all prefixed by the current filetype.

## Installation

Use your favourite plugin manager to install this plugin. I like `vim-plug`.

```
Plug 'dbatten5/vim-ffs'
```
