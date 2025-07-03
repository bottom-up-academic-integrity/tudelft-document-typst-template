# Typst template for TU Delft for Integrity

This repository contains all the structure, layout and design elements for the TU Delft for Integrity documents. The content is meant to be written in a different repository.

### Setting up a new document with the template

To make a new document with this template, create a fresh repository, and add this template repo as a submodule with:

```cmd
git submodule add <git-clone-url> template
```

Where we name the template folder `template`, but it could really be anything you like.

In your fresh repository, you would need to add the following documents to make it work:

* `document-info.toml`: a simple TOML (plaintext) file that contains some metadata for the document that will be used in the layout. Things like the "title" would be listed there. See the format for the `.toml` in the section below.
* `content.typ`: a typst file (plaintext) that contains the *content* of the document. This is to be written with `typst` syntax. To learn the basic typst syntax, visit [their documentation](https://typst.app/docs/reference/syntax/)

In addition, there are the following items that you may want to include:

* `LICENCE`: specifying the use conditions of the document
* `README.md`:  general documentation about what the document is, who wrote it and other instructions etc.
* `.github/workflows/`: workflow description in case you use GitHub to host your repository. This can be used to automatically compile the latest pdf without having to have Typst installed or as an easy distribution system.

Taken together, a new document folder should look something like this:

```
new-document/
    ├─ .github/
    │  ├─ workflows/
    │  │  ├─ build-typst.yml
    ├─ template/
    │  ├─ ...
    LICENCE
    README.md
    content.typ
    document-info.toml
```

### Compiling the document

You can find commands to quickly compile the document in the [utils](utils) subdirectory. 

If you want to manually compile the document, you can run

```bash
typst watch template/main.typ document.typ --root ./ --input commit=<commit SHA>  
```

in your document repository (`new-document`) in diagram above. 

You can replace `<commit SHA>` with the first 8 characters of the current git commit. That makes tracking the version of the file very easy.  You can get the current SHA with `git rev-parse HEAD`.  Note that the scripts in `utils`, automatically take care of this.

### The fields of `document-info.toml`

