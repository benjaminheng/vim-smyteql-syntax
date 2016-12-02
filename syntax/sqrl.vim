" Vim syntax file
" Language:	Smyte Query and Rules Language (SQRL)
" Maintainer:	Benjamin Heng
" Last Change:	2016-11-07

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn keyword sqrlFunction rateLimited patternMatches hasLabel
syn keyword sqrlFunction count countUnique
syn keyword sqrlFunction length
syn keyword sqrlFunction relationsWithLabel

" Case insensitive matches below
syn case ignore

" Keywords:
syn match sqrlStatement "^\s*CREATE\s\+RULE\s\+"
syn match sqrlStatement "^\s*WHEN\s\+RULES*\s\+"
syn match sqrlStatement "\v(^|\s)WITH\s+REASON\s+"
syn match sqrlStatement "\v(^|\s)ROLLOUT\s+TO\s+"
syn match sqrlStatement "\v(^|\s)MANUAL\s\+ADD\s+"
syn match sqrlStatement "\v(^|\s)MANUAL\s+REMOVE\s+"
syn match sqrlStatement "\v(^|\s)GROUP\s+BY\s+"
syn match sqrlStatement "\v(^|\s)PENDING"
syn keyword sqrlStatement let
syn keyword sqrlStatement where and or in by contains
syn keyword sqrlStatement block whitelist
syn keyword sqrlStatement add to
syn keyword sqrlStatement last
syn keyword sqrlStatement month months
syn keyword sqrlStatement week weeks
syn keyword sqrlStatement day days
syn keyword sqrlStatement hour hours
syn keyword sqrlStatement minute minutes
syn keyword sqrlStatement second seconds

" Operators:
syn match sqrlOperator "\V:="
syn match sqrlOperator "\V!="
syn match sqrlOperator "\V*"
syn match sqrlOperator "\V+"
syn match sqrlOperator "\V-"
syn match sqrlOperator "\V/"
syn match sqrlOperator "\V<"
syn match sqrlOperator "\V<="
syn match sqrlOperator "\V="
syn match sqrlOperator "\V>"
syn match sqrlOperator "\V>="

" Strings and characters:
syn region sqrlString start=+"+ skip=+\\\\\|\\"+ end=+"+
syn region sqrlString start=+'+ skip=+\\\\\|\\'+ end=+'+

" Numbers:
syn match sqrlNumber "-\=\<\d*\.\=[0-9_]\>"

" Comments:
syn match sqrlComment "#.*$" contains=sqrlTodo,@Spell

" Todo:
syn keyword sqrlTodo TODO FIXME XXX DEBUG NOTE contained

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_sql_syn_inits")
  if version < 508
    let did_sql_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink sqrlStatement	Statement
  HiLink sqrlOperator   Operator
  HiLink sqrlTodo       Todo
  HiLink sqrlComment    Comment
  HiLink sqrlString     String
  HiLink sqrlFunction   Function
  HiLink sqrlNumber     Number

  delcommand HiLink
endif

let b:current_syntax = "sqrl"
