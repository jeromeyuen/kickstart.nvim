local ls = require 'luasnip'
local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require 'luasnip.util.events'
-- local ai = require 'luasnip.nodes.absolute_indexer'
local extras = require 'luasnip.extras'
-- local l = extras.lambda
local rep = extras.rep
-- local p = extras.partial
-- local m = extras.match
-- local n = extras.nonempty
-- local dl = extras.dynamic_lambda
local fmt = require('luasnip.extras.fmt').fmt
-- local fmta = require('luasnip.extras.fmt').fmta
-- local conds = require 'luasnip.extras.expand_conditions'
-- local postfix = require('luasnip.extras.postfix').postfix
-- local types = require 'luasnip.util.types'
-- local parse = require('luasnip.util.parser').parse_snippet
-- local ms = ls.multi_snippet
-- local k = require('luasnip.nodes.key_indexer').new_key

-- Add luasnip snippets to typ (Typst) files
ls.add_snippets('typst', {
  s( -- Typst version of figure "environment"
    'fig',
    fmt(
      [[
        #figure(
          caption: [<>],
          <>
        ) <<<>>>
      ]],
      {
        i(1),
        i(3),
        i(2),
      },
      { delimiters = '<>' }
    )
  ),

  s( -- Typst version of figure "environment", for images
    'image',
    fmt(
      [[
        #figure(
          caption: [<>],
          image("<>", width: 70%)
        ) <<<>>>
      ]],
      {
        i(1),
        i(3),
        i(2),
      },
      { delimiters = '<>' }
    )
  ),

  s( -- For side by side image (but only shared caption)
    'image_side-by-side',
    fmt(
      [[
        #figure(
          caption: [<>],
          grid(
            columns: 2,
            gutter: 10pt,
            image("<>", width: 100%),
            image("<>", width: 100%),
            align(center)[(a)],
            align(center)[(b)],
          )
        ) <<<>>>
      ]],
      {
        i(1),
        i(3),
        i(4),
        i(2),
      },
      { delimiters = '<>' }
    )
  ),

  s( -- For a grid of images (can have individual captions)
    'grid-1-images',
    fmt(
      [[
        #grid(
          columns: 2,
          gutter: 10pt,
          [
            #figure(
              caption: [<>],
              image("<>", width: 100%)
            ) <<<>>>
          ],
          [
            #figure(
              caption: [<>],
              image("<>", width: 100%)
            ) <<<>>>
          ],
        )
      ]],
      {
        i(1),
        i(3),
        i(2),
        i(4),
        i(6),
        i(5),
      },
      { delimiters = '<>' }
    )
  ),

  s( -- image function only, meant to be used within "figure" function
    'image_only',
    fmt(
      [[
        image("<>", width: 70%)
      ]],
      {
        i(1),
      },
      { delimiters = '<>' }
    )
  ),

  s( -- "table" meant to be used inside "figure" environment
    'table_1_booktabs-style',
    fmt(
      [[
        table(
          columns: <>,
          stroke: none,
          table.hline(stroke: 0.7pt + black), // toprule
          table.header(
            <>
          ),
          table.hline(stroke: 0.3pt + black), // midrule
            <>
          table.hline(stroke: 0.7pt + black), // bottomrule
        )
      ]],
      {
        i(1),
        i(2),
        i(3),
      },
      { delimiters = '<>' }
    )
  ),

  s( -- shortcut for headings
    'heading',
    fmt(
      [[
        #heading(
          numbering: none,
          // depth: 1,
          // outlined: true
        )[<>]
      ]],
      {
        i(1),
      },
      { delimiters = '<>' }
    )
  ),

  s( -- shortcut for boilerplate (Page settings and LaTeX fonts)
    'boiler_general_1',
    fmt(
      [[
        // Page settings
        #set page(
          margin: 1in,
        )

        // LaTeX like fonts
        // #set text(font: "Latin Modern Roman")
        #set text(font: "New Computer Modern")
      ]],
      {},
      { delimiters = '<>' }
    )
  ),

  s( -- shortcut for boilerplate (pretty section headers)
    'boiler_general_2',
    fmt(
      [[
        // Prettify numbered and unnumbered section headers
        #let doc-heading-numbering = "1.1"
        #set heading(numbering: doc-heading-numbering)
        #show heading: it =>> {
          if it.numbering == doc-heading-numbering {
            block(
              width: 100%,
              above: 1.4em,
              below: 1em,
            )[#counter(heading).display() #h(10pt) #it.body]
          }
          else if it.numbering == none {
            block(
              width: 100%,
              above: 1.4em,
              below: 1em,
            )[#it]
          }
        }
      ]],
      {},
      { delimiters = '<>' }
    )
  ),

  s( -- shortcut for boilerplate (Pretty image and tables)
    'boiler_general_3',
    fmt(
      [[
        // Prettify image and tables (figure floats)
        #show figure.where(kind: image): it =>> block(
          above: 1.5em,
          below: 1em,
        )[#it.body
          #v(10pt)
          #text(size: 10pt)[#it.caption]
          #v(5pt)]
        #show figure.where(kind: table): set figure.caption(position: top)
        #show figure.where(kind: table): set figure(numbering: "I")
        #show table.cell.where(y: 0): strong // Bolds the first row in a table
        #show figure.where(kind: table): it =>> block(
          above: 1em,
          below: 1.5em,
        )[#v(5pt)
          #text(size: 10pt)[#it.caption]
          #v(10pt)
          #it.body]
      ]],
      {},
      { delimiters = '<>' }
    )
  ),

  s( -- shortcut for boilerplate (Pretty lists)
    'boiler_general_4',
    fmt(
      [[
        // Prettify unnumbered and numbered lists
        #set list(indent: 1em, spacing: 1em)
        #show list: it =>> block(
          width: 100%,
          above: 1em,
          below: 1em,
        )[#it]
        #set enum(indent: 1em, spacing: 1em)
        #show enum: it =>> block(
          width: 100%,
          above: 1em,
          below: 1em,
        )[#it]
      ]],
      {},
      { delimiters = '<>' }
    )
  ),

  s( -- shortcut for boilerplate (Math equation numbering)
    'boiler_general_5',
    fmt(
      [[
        // Give math equations numberings
        #set math.equation(numbering: "(1)")
      ]],
      {},
      { delimiters = '<>' }
    )
  ),

  s( -- shortcut for front matter (Reports)
    'frontmatter_1_reports_boiler',
    fmt(
      [[
        // Front matter starts
        #let title = [title]
        #let author = [Jerome Yuen]
        #let lastupdate = datetime(day: 1, month: 7, year: 2025)

        #align(center)[
          #v(40pt)
          #text(size: 16pt, weight: "thin")[#title]
          #v(10pt)
          #set text(size: 12pt)
          #author
          #v(5pt)
          Last Updated: #lastupdate.display("[day] [month repr:short] [year]")
          #v(15pt)
        ]
      ]],
      {},
      { delimiters = '<>' }
    )
  ),

  s( -- shortcut for table of contents
    'toc_boiler',
    fmt(
      [[
        // TOC
        #outline()

        // // List of figures
        // #outline(
        //   title: [List of Figures],
        //   target: figure.where(kind: image),
        // )

        // // List of tables
        // #outline(
        //   title: [List of Tables],
        //   target: figure.where(kind: table),
        // )
      ]],
      {},
      { delimiters = '<>' }
    )
  ),

  s( -- shortcut for main matter (general settings)
    'mainmatter_1_settings_boiler',
    fmt(
      [[
        // Main content starts (general settings)
        #pagebreak()
        #set page(numbering: "1") // Start numbering here (arabic numerals)
        #set par(leading: 0.55em, spacing: 0.55em, first-line-indent: 1.8em, justify: true)
      ]],
      {},
      { delimiters = '<>' }
    )
  ),

  s( -- shortcut for tables read in from CSV and (optionally) in landscape mode
    'table_2_csv',
    fmt(
      [[
        // Importing CSV and splitting into header and content
        #let <a> = csv("<>")
        #let <a>_header = <a>.slice(0, count:1)
        #let <a>_content = <a>.slice(1)

        // Manipulating header and content
        #let <a>_header = <a>_header.map(m =>> {
          // Write mapping function here.
          // Write "m" to leave CSV as is
          <>
        })
        #let <a>_content = <a>_content.map(m =>> {
          // Write mapping function here.
          // Write "m" to leave CSV as is
          <>
        })

        #show figure: set block(breakable: true)
        // #page(flipped: true)[
        #figure(
          caption: [<>],
          table(
            columns: <a>_header.flatten().len(),
            stroke: none,
            table.hline(stroke: 0.7pt + black), // toprule
            table.header( // If want to write your own, can too
              ..<a>_header.flatten()
            ),
            table.hline(stroke: 0.3pt + black), // midrule
              ..<a>_content.flatten(),
            table.hline(stroke: 0.7pt + black), // bottomrule
          )
        ) <<tab:<>>>
        // ]
        #show figure: set block(breakable: false)
      ]],
      {
        a = i(1), -- Typst variable name
        i(2), -- CSV file select
        i(5), -- CSV's header function
        i(6), -- CSV's content function
        i(3), -- Caption
        i(4), -- Label
      },
      { delimiters = '<>', repeat_duplicates = true }
    )
  ),

  s( -- shortcut for table cells
    'table_3_cells',
    fmt(
      [[
        table.cell(colspan: <>, rowspan: <>, align:(horizon + center))[<>]
      ]],
      {
        i(1),
        i(2),
        i(3),
      },
      { delimiters = '<>' }
    )
  ),

  s( -- shortcut for adding columns with dictionary
    'table_4_csv_dict_add_col',
    fmt(
      [[
        // Adding new columns by specifying a dictionary as ("row number": "content")
        #let dict = (<>)
        #let n = 0
        #while n << <a>.len() {
          if str(n) in dict { test.at(n).push(dict.at(str(n))) }
          else { <a>.at(n).push([<>]) }
          n = n + 1
        }
      ]],
      {
        a = i(1), -- Typst csv variable name
        i(2),
        i(3),
      },
      { delimiters = '<>', repeat_duplicates = true }
    )
  ),

  s( -- shortcut for adding columns by specifying row numbers
    'table_5_csv_row_add_col',
    fmt(
      [[
        // Adding new columns by specifying row numbers as strings e.g. ("1", "5")
        #let rows = (<>)
        #let n = 0
        #while n << <a>.len() { -- Contents to add to specified/unspecified rows (put empty string if nothing)
          if str(n) in rows { <a>.at(n).push([<>]) }
          else { <a>.at(n).push([<>]) }
          n = n + 1
        }
      ]],
      {
        a = i(1), -- Typst csv variable name
        i(2),
        i(3),
        i(4),
      },
      { delimiters = '<>', repeat_duplicates = true }
    )
  ),

  s( -- shortcut for adding fills parameter
    'table_6_fills',
    fmt(
      [[
        fill: (_, col) =>> {
          if col <<= 0 { white }
          else if col <<= 1 { gray.lighten(70%) }
          else if col <<= 3 { white }
          else if col <<= 4 { gray.lighten(70%) }
        },
      ]],
      {},
      { delimiters = '<>', repeat_duplicates = true }
    )
  ),

  s( -- shortcut for grid cells
    'grid-2-cells',
    fmt(
      [[
        grid.cell(colspan: <>, rowspan: <>, align:(horizon + center))[<>],
      ]],
      {
        i(1),
        i(2),
        i(3),
      },
      { delimiters = '<>' }
    )
  ),
})
