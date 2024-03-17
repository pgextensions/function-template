# Postgres Function Extension Template

This repository contains a template for creating a Postgres function. The goal of this template is to provide a starting point for the creation of functions for Postgres.

This extension template implements the [Soundex Algorithm](https://en.wikipedia.org/wiki/Soundex) as a function.

## Getting started

First step to getting started is to create your own repo from this template by clicking `Use this template`. Then clone your new repository using

```sh
git clone https://github.com/<you>/<your-new-extension-repo>.git
```

## Building

### Build steps

To build the extension, run:

```sh
make
```

The binary that will be built and the other components of the extension are:

```sh
./soundex-function--1.0.0.sql
./soundex-function.control
./soundex-function.so
```

- `soundex-function--1.0.0.sql` is the SQL definition that creates the function.
- `soundex-function.control` is the control file that describes the extension to Postgres.
- `soundex-function.so` is the shared object that is created that is the heart of the extension.

### Installation

To install the extension, run:

```sh
make install
```

## Using the extension

To use the extension:

```sql
CREATE EXTENSION "soundex-function";
```

We can then run the function that the extension created:

```sql
SELECT soundex('postgres');
 soundex
---------
 P232
(1 row)
```

## Running the tests

Tests can be executed after the extension is installed:

```sh
make installcheck
```

The tests that are run are stored in the `./sql` directory, and specified in the `Makefile`.

## Distributing your extension

There are multiple ways to distribute your extension, and this template contains the metadata files for [PGXMAN](https://pgxman.com) and [PGXN](https://pgxn.org).

- `META.json` - the metadata file for `PGXN`.
- `extension.yaml` - the build-kit file for `PGXMAN`.

## Files

- `Makefile` is the build system file that sets up the build using the Postgres build system.
- `soundex-function--1.0.0.sql` is the SQL definition that creates the function.
- `soundex-function.control` is the control file that describes the extension to Postgres.
- `src/function.c` is the main function definition in `C`.
- `src/soundex.c` is the Soundex implementation in `C`.
- `src/soundex.h` is the header file for `soundex.c`.
- `sql/soundex_function.sql` is the file to be executed for tests.
- `expected/soundex_function.sql` is the file that the results of the tests are compared to.
