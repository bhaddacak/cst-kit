---
---

# Chaṭṭha Saṅgāyana Tipiṭaka Kit

This repository contains a restructured version of the Chaṭṭha Saṅgāyana Tipiṭaka (CST) prepared by J.R. Bhaddacak. The raw data kept here are the outcome of deliberate editing done manually. The editing includes:

- Reorganizing the collection, making it easier to find related texts
- Restructuring some texts by fixing the hierarchy of headers, making them easier to program and navigate
- Checking paragraph numbers and making them more systematically consistent (This is important because text relationship heavily depends on paragraph numbers)
- Fixing obvious typos (if any, the fixes will be reported)
- Removing some minor texts

> Note that there is no textual editing in the raw data, except some heading insertions, number fixes, and typo fixes (if any). This means the text is mostly identical to the original, but the structure and naming scheme are different.

To make the product versatile in uses, the program used for rendering the output is also exposed, so that those who have specific purposes can tinker the tool to fulfill their needs. This is the sense made by **Kit** here. The existing program has the following functions:

- Converting original XML to fixed XML, HTML, headless HTML, and plain text
- Removing references to publications embedded in the text
- Fixing ’nti (it should be n’ti not ’nti)
- Fixing quotation marks
- Fixing spaces

The available output formats are as follows:

1. **XML** The raw XML data will be operated with minimal fixes and new XML files are generated.
2. **HTML** The output will be full HTML with predefined structure, not the transformation from XSL. The user can change the structure by editing the sed-scripts. This can be opened directly in a browser.
3. **TXT** This means headless HTML, text format with some metadata preserved in tags. This format is not proper to be used directly, but it is suitable to be processed programmatically.
4. **GZ** This is the compressed version of TXT format, mainly used by [bhaddacak.github.io/cst](https://bhaddacak.github.io/cst).
5. **BARE** This is the real plain text format. All tags are removed, as well as the text structure.

> Apart from the raw XML data, the repository only hosts the GZ formatted files because they are used by the reader in [bhaddacak.github.io](https://bhaddacak.github.io/cst). Other formats can be generated by the program provided in the user's computer (see below).

## How to make CST data

Once this repository is cloned to the user's computer, the CST data in a specific format can be generated by the program called `makecst`. The only prerequisite is that you must have UNIX-like environment to run the program. Specifically, bash, GNU sed and gzip have to be present. This is common to most Linux distributions. Other types of OS have to be set up to meet this requirement. For example, in Windows `Cygwin` can be used, and in macOS `Homebrew` can be used.

There are two usecases described as follows:

### 1. Converting an individual file

To make an individual CST file, you have to know your target. This can be studied in `cstdata.json`. Once you have a file in mind, type this in the program's root directory:

```
$ ./makecst <output-format> <file>
```

The &lt;output-format&gt; can be either **xml**, **html**, **txt**, **gz**, and **bare**. And &lt;file&gt; must be the raw XML file provided. For example, to generate the Bhikkhunīvibhaṅga in HTML, type this to the (bash) shell:

```
$ ./makecst html raw/cst-v-biv.xml
```

This will create `cst-v-biv.html` in the program's root directory. Other formats can be done likewise.

### 2. Converting the whole collection

The entire conversion can be done easily by the following command, where &lt;output-format&gt; is the same as mentioned above:

```
$ ./makecst <output-format>
```

For example, this will make a new collection of fixed XML in directory `xml`. (Other formats have the output directory correspondingly.)

```
$ ./makecst xml
```

## The new structure explained

### External structure

Texts are arranged into 4 main groups in the original structure of CST, namely *Mūla* (main texts), *Aṭṭhakathā* (commentaries), *Ṭīkā* (subcommentaries), and *Añña* (others). Within the first three groups, the three baskets are divided, hence *Vinayapiṭaka*, *Suttapiṭaka*, and *Abhidhammapiṭaka*. By this arrangement, there are totally 10 subgroups as shown below.

```
CST (original)
 |
 |- Mūla
 |   |- Vinayapiṭaka
 |   |- Suttapiṭaka
 |   |- Abhidhammapiṭaka
 |
 |- Aṭṭhakathā
 |   |- Vinayapiṭaka
 |   |- Suttapiṭaka
 |   |- Abhidhammapiṭaka
 |
 |- Ṭīkā
 |   |- Vinayapiṭaka
 |   |- Suttapiṭaka
 |   |- Abhidhammapiṭaka
 |
 |- Añña

```

The relations between main texts, commentaries, and subcommentaries are maintained roughly by file-naming scheme (mainly using running numbers), without other metadata available. This causes difficulty when we deal with the texts both by manual selections and by programs.

Another problem is sometimes the line between main texts, commentaries, and subcommentaries is unclear, and classification is too rigid in some cases. For example, Bhikkhupātimokkha and Bhikkhunīpātimokkha are put unfittingly into ṭīkā group.

From the viewpoint of researchers and Tipiṭaka learners, not curators, the structure should facilitate the study, not to make it confusing. So, it should be modified to serve the learning purpose as the highest priority. The new structure of CST proposed here can be described below.

```
CST (restructured)
 |
 |- Vinayapiṭakaṃ
 |   |- Mūlaganthā (main texts)
 |   |- Aṭṭhakathā Ṭīkā ca (exegetical works)
 |
 |- Suttantapiṭakaṃ
 |   |- Mūlaganthā (main texts)
 |   |- Aṭṭhakathā Ṭīkā ca (exegetical works)
 |
 |- Abhidhammapiṭakaṃ
 |   |- Mūlaganthā (main texts)
 |   |- Aṭṭhakathā Ṭīkā ca (exegetical works)
 |
 |- Visesapakaraṇāni (other texts)

```

By this way of arrangement, related texts are put together. They can be linked by their relation using information provided. The information of data (metadata) is kept separately in `cstinfo.json`. This can help programmers dealing with the collection substantially.

Another point that the new structure addresses is the name of texts for referencing. We should have a consistent way to make references. With a well-organized structure, we can refer to them systematically (and it should be easy). To cope with this, each separate item of text is counted as a book. And each book has a unique name that can be used in referring.

To be precise, the structure of a book is shaped by textual content and paragraph numbers. Normally, if a new series of numbers is introduced, it will be separated as a new book. Only when the text has clearly distinct content, it will be a book on its own even if it uses numbers form another series. [Bhikkhunīvibhaņga](https://bhaddacak.github.io/cst?biv) is a marked example in this case. However, in rare cases, one book may utilize multiple number series, for instance, Bhikkhupātimokkha and Bhikkhunīpātimokkha.

The system of naming may not be well-settled yet because the collection is not completed. Also what will be included or excluded in other texts is yet to be decided.

### Internal structure

To be familiar with the data, let us see briefly how CST XML data are structured. There are only 4 tags in use, namely **&lt;p&gt;**, **&lt;hi&gt;**, **&lt;note&gt;**, and **&lt;pb&gt;**. The &lt;p&gt; tag is extensively used in the body of text with a variety of format by using **rend** attribute. Here are the list of original &lt;p&gt; tag's rendering options: nikaya, book, chapter, title, subhead, subsubhead, bodytext, hangnum, indent, unindented, centre, gatha1, gatha2, gatha3, and gathalast.

The &lt;hi&gt; tag has less use. It mostly defines the boldface portion of text, also marks paragraph numbers and dots (periods after the paragraph numbers). The &lt;note&gt; tag is used only for redactional notes. And the &lt;pb&gt; tag is about the data of references to publications.

Here are the treatments for the new structure:

1. Three rendering options are added for &lt;p&gt;, i.e., **group**, **subgroup**, and **strong**. The first two are used to group headings together by not upsetting the hierarchical structure of headings (*group* is for *title*, *subgroup* is for *subhead*). To get what this means, see Pācittiya section in [Bhikkhuvibhaṅga 2](https://bhaddacak.github.io/cst?buv2). The last one just marks the part as a heading but not in the hierarchical structure. These three are incorporated into the text manually.
2. Because the hierarchical structure of headings in the original is unsystematic and inconsistent, using the data programmatically is difficult. So, the massive changes of headings have been done manually in this manner:
    - Only *nikaya* and *book* appear at the top of the file (or a little below), not in other places. These are rendered as &lt;h2&gt; in HTML/TXT output.
    - *Chapter* is the first level of the hierarchy. This means if the document has sections, *chapter* has to be present first to be the base for lower levels (*title*, *subhead*, and so on). This is rendered as &lt;h3&gt; in HTML/TXT output.
    - *Title* is the second level. This is the base of *subhead* and rendered as &lt;h4&gt; in HTML/TXT output.
    - *Subhead* and *subsubhead* (rare) are the third and fourth level respectively. These are rendered as &lt;h5&gt; and &lt;h6&gt; in HTML/TXT output.
    - To stress, there will never be a lower level without a higher one. For example, *subhead* will never be present without *title*, so never *title* without *chapter*. If an off-structure heading has to be used at all, it should be of *strong* (see above).
3. The data presented in the &lt;pb&gt; tag will be all removed after rendition. Those who want to use these data have to resort to the original XML.

Other noted renditions in HTML/TXT output are:

- The &lt;note&gt; tag data are converted to text in square brackets ([...]). No tag is used.
- All rendering options, except *bodytext* and *hangnum*, are converted to &lt;div&gt; tag with corresponding class names.
- The tag of *bodytext* and *hangnum* (mere paragraph number) are removed in TXT output, but converted to &lt;p&gt; in HTML.
- The &lt;hi&gt; tag with *bold* is changed to &lt;b&gt; tag. Other options are removed.
- Only in the text body do &lt;b&gt; tags appear, whereas &lt;strong&gt; tags are used only with headings.

One marked characteristic of TXT output is paragraph numbers are only numbers appear at the beginning of the lines. These numbers can be extracted easily by programmatic means.

## The tree of text relationship

Showing a tree-like structure of text relationship can give a quick picture and better understanding. So, the following diagrams are added here. This part also appears in [CST page](https://bhaddacak.github.io/cstpage). For some more information, including a referencing guide, please see that page.

```
============
Vinayapiṭaka
============
  |- Bhikkhuvibhaṅga 1 (Buv1)
  |   |- Samantapāsādikā 1 (Sp1)
  |       |- Sāratthadīpanī 1 (Sd1)
  |       |- Vimativinodanī 1 (Vmv1)
  |       |- Vajirabuddhi 1 (Vjb1)
  |
  |- Bhikkhuvibhaṅga 2 (Buv2)
  |   |- Samantapāsādikā 2 (Sp2)
  |       |- Sāratthadīpanī 2 (Sd2)
  |       |- Vimativinodanī 2 (Vmv2)
  |       |- Vajirabuddhi 2 (Vjb2)
  |       |- Pācityādiyojanā (Pc-y)
  |
  |- Bhikkhunīvibhaṅga (Biv)
  |   |- Samantapāsādikā 3 (Sp3)
  |       |- Sāratthadīpanī 3 (Sd3)
  |       |- Vimativinodanī 3 (Vmv3)
  |       |- Bhikkhunīvibhaṅgayojanā (Biv-y)
  |
  |- Mahāvagga (Mv)
  |   |- Samantapāsādikā 4 (Sp4)
  |       |- Sāratthadīpanī 4 (Sd4)
  |       |- Vimativinodanī 4 (Vmv4)
  |       |- Vajirabuddhi 4 (Vjb4)
  |       |- Mahāvaggayojanā (Mv-y)
  |
  |- Cūḷavagga (Cv)
  |   |- Samantapāsādikā 5 (Sp5)
  |       |- Sāratthadīpanī 5 (Sd5)
  |       |- Vimativinodanī 5 (Vmv5)
  |       |- Vajirabuddhi 5 (Vjb5)
  |       |- Cūḷavaggayojanā (Cv-y)
  |
  |- Parivāra (Pvr)
  |   |- Samantapāsādikā 6 (Sp6)
  |       |- Sāratthadīpanī 6 (Sd6)
  |       |- Vimativinodanī 6 (Vmv6)
  |       |- Vajirabuddhi 6 (Vjb6)
  |       |- Parivārayojanā (Pvr-y)
  |
  |- Bhikkhupātimokkha (Bup)
  |   |- Kaṅkhāvitaraṇī (Kkh1)
  |       |- Kaṅkhāvitaraṇī-purāṇaṭīkā (Kkh-pt1)
  |       |- Kaṅkhāvitaraṇī-abhinavaṭīkā (Kkh-nt1)
  |
  |- Bhikkhunīpātimokkha (Bip)
      |- Kaṅkhāvitaraṇī (Kkh2)
          |- Kaṅkhāvitaraṇī-purāṇaṭīkā (Kkh-pt2)
          |- Kaṅkhāvitaraṇī-abhinavaṭīkā (Kkh-nt2)

  ----------------------------------------
  Independent Vinaya Exegeses/Compositions
  ----------------------------------------
      |- Vinayasaṅgaha (Vns)
      |   |- Vinayālaṅkāra (Vnl)
      |
      |- Vinayavinicchaya (Vnv)
      |   |- Vinayavinicchayaṭīkā (Vnv-t)
      |
      |- Uttaravinicchaya (Utv)
      |   |- Uttaravinicchayaṭīkā (Utv-t)
      |
      |- Khuddasikkhā (Khds)
      |   |- Khuddasikkhā-purāṇaṭīkā (Khds-pt)
      |   |- Khuddasikkhā-abhinavaṭīkā (Khds-nt)
      |
      |- Mūlasikkhā (Mls)
          |- Mūlasikkhāṭīkā (Mls-t)

==============
Suttantapiṭaka
==============
  |- Dīghanikāya Sīlakkhandhavagga (D1)
  |   |- Sumaṅgalavilāsinī 1 (Smv1)
  |       |- Līnatthappakāsanā 1 (Lpa 1)
  |       |- Sīlakkhandhavagga-abhinavaṭīkā (Sv-nt)
  |
  |- Dīghanikāya Mahāvagga (D2)
  |   |- Sumaṅgalavilāsinī 2 (Smv2)
  |       |- Līnatthappakāsanā 2 (Lpa 2)
  |
  |- Dīghanikāya Pāthikavagga (D3)
  |   |- Sumaṅgalavilāsinī 3 (Smv3)
  |       |- Līnatthappakāsanā 3 (Lpa 3)
```

## Notes on displaying the data

For XML data, they can be shown in a browser using XSL transformation. The original XML has `tipitaka_latn.xsl` and `tipitaka_latn.css` for this purpose. The files are retained and modified. For the detail of using, please consult other sources.

For HTML/TXT data, they can be shown in preferred styles by using CSS classes. Or they can be modified by text manipulation using regular expressions. The reader in [bhaddacak.github.io/cst](https://bhaddacak.github.io/cst) uses the latter method.

## Notes on further developments

To all Buddhists and students of Pāli, this collection of texts is highly valuable. It should be made available, reliable, and systematically consistent. With this inauguration, the author hopes that the collection will be improved constantly, not kept untouched as a sacred artifact. The tidier structure we have, the more powerful tools we can create. With powerful tools, the learning will be more fruitful and enjoyable.

So, the author encourages everyone who has capability (or a will to learn new and difficult things) study the collection and the tools provided, then make them even better.

Typo data and other errors in texts can be sent directly to the author. Or if it is possible, the improvement can be done by *pull request* mechanism.

## Credits

- The original data of Chaṭṭha Saṅgāyana Tipiṭaka come from [tipitaka.org](https://tipitaka.org/romn).

## Licenses

- The programs written in bash-script and sed-script, as well as the metadata in JSON, are [unlicensed](http://unlicense.org/). They can be used and modified freely.
- The raw XML texts and the products of conversion done by the programs are licensed under [CC BY-SA 4.0](http://creativecommons.org/licenses/by-sa/4.0/).
