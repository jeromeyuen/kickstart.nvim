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
-- local extras = require 'luasnip.extras'
-- local l = extras.lambda
-- local rep = extras.rep
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

-- Add luasnip snippets to tex/latex files
ls.add_snippets('tex', {
  s(
    'fig',
    fmt(
      [[
        \begin{figure}[htbp]
          \centering
          \includegraphics[width=0.7\textwidth]{<>}
          \caption{<>}
          \label{fig:<>}
        \end{figure}

      ]],
      {
        i(3),
        i(1),
        i(2),
      },
      { delimiters = '<>' }
    )
  ),

  s(
    'tab',
    fmt(
      [[
        \begin{table}[!ht]
          \centering
          \caption{<>}
          \label{tab:<>}
          % \vspace{1em}
          <>
        \end{table}

      ]],
      {
        i(1),
        i(2),
        i(3),
      },
      { delimiters = '<>' }
    )
  ),

  s(
    'tabx',
    fmt(
      [[
        \begin{tabularx}{()}{
		>{\raggedright\arraybackslash}X
		>{\raggedright\arraybackslash}X
		>{\raggedright\arraybackslash}X
		>{\raggedright\arraybackslash}X}
          \toprule
          ()
          \midrule
          ()
          \bottomrule
        \end{tabularx}
      ]],
      {
        i(1, '0.9\\textwidth'),
        i(2),
        i(3),
      },
      { delimiters = '()' }
    )
  ),

  s(
    'boiler_text_1',
    fmt(
      [[
        \usepackage[margin=1in]{geometry}
        \usepackage{parskip}
        \usepackage{setspace}
        \usepackage{microtype}
        \usepackage{lmodern}
        <>
      ]],
      { i(1) },
      {
        delimiters = '<>',
      }
    )
  ),

  s(
    'boiler_table_1',
    fmt(
      [[
        \usepackage{booktabs}
        % \usepackage[table]{xcolor}
        % \usepackage{array}
        <>
      ]],
      { i(1) },
      {
        delimiters = '<>',
      }
    )
  ),

  s(
    'boiler_table_2',
    fmt(
      [[
        \usepackage{tabularx}
        % \newcolumntype{Y}{>{\centering\arraybackslash}X}
        % \newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
        % \newcolumntype{R}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
        ()
      ]],
      { i(1) },
      {
        delimiters = '()',
      }
    )
  ),

  s(
    'boiler_hyperref_1',
    fmt(
      [[
        \usepackage{hyperref}
        \hypersetup{
            colorlinks=true,
            linktocpage=true,
            linkcolor=blue,
            filecolor=magenta,
            urlcolor=cyan,
            pdftitle={<>}
        }
        <>
      ]],
      { i(1, 'PDF Title'), i(2) },
      {
        delimiters = '<>',
      }
    )
  ),

  s('boiler_circuitikz_1', {
    t '\\usepackage[american, RPvoltages, siunitx]{circuitikz}',
  }),

  s(
    'boiler_circuitikz_2',
    fmt(
      [[
      \usetikzlibrary{calc}
      % \usetikzlibrary{arrows.meta}
      % \usetikzlibrary{positioning}
      % \usetikzlibrary{fit}
      <>
      ]],
      { i(1) },
      {
        delimiters = '<>',
      }
    )
  ),

  s(
    'boiler_circuitikz_3',
    fmt(
      [[
    % Used to define and show coordinates to help drawing (p. 23 of circuitikz manual)
    \def\normalcoord(#1){coordinate(#1)}
    \def\showcoord(#1){coordinate(#1) node[circle, red, draw, inner sep=1pt,
    pin={[red, overlay, inner sep=0.5pt, font=\tiny, pin distance=0.1cm,
    pin edge={red, overlay}]45:#1}](){}}
    \let\coord=\normalcoord
    \let\coord=\showcoord
    <>
  ]],
      { i(1) },
      {
        delimiters = '<>',
      }
    )
  ),

  s(
    'boiler_circuitikz_4',
    fmt(
      [[
    % Circuitikz formatting:
    \ctikzset{diodes/scale=0.6}
    \ctikzset{bipoles/crossing/size=0.4}
    % \ctikzset{resistors/scale=0.6}
    % \ctikzset{inductors/scale=0.7}
    % \ctikzset{capacitors/scale=0.6}
    % \ctikzset{monopoles/vcc/arrow={Bar[width=13pt]}}
    % \ctikzset{label/align=straight}
    <>
  ]],
      { i(1) },
      {
        delimiters = '<>',
      }
    )
  ),

  s(
    'qty',
    fmt(
      [[
        \qty{<>}{<>}<>
      ]],
      {
        i(1),
        i(2),
        i(0),
      },
      { delimiters = '<>' }
    )
  ),
})
