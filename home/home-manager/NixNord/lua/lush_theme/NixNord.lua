--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--
-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require('lush')
local hsl = lush.hsl

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
	-----------------
	-- Nord Scheme:
	-----------------
	--
	-- hsl(220,16,22)
	-- hsl(220,16,28)
	-- hsl(220,17,32)
	-- hsl(220,16,36)
	--
	-- hsl(219,28,88)
	-- hsl(218,27,92)
	-- hsl(218,27,94)
	--
	-- hsl(179,25,65)
	-- hsl(193,43,67)
	-- hsl(210,34,63)
	-- hsl(213,32,52)
	--
	-- hsl(354,42,56)
	-- hsl(14,51,63)
	-- hsl(40,71,73)
	-- hsl(92,28,65)
	-- hsl(311,20,63)
    --
    ColorColumn    { bg = hsl(354,42,56) }, -- Columns set with 'colorcolumn'
    -- Conceal        { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    -- Cursor         { }, -- Character under the cursor
    CurSearch      { bg = hsl(220,16,50), fg = hsl(218,27,94) }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
    -- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
    -- CursorColumn   { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    -- CursorLine     { }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory      { fg = hsl(219,28,80) }, -- Directory names (and other special names in listings)
    DiffAdd        { bg = hsl(218,27,94), fg = hsl(220,16,10) }, -- Diff mode: Added line |diff.txt|
    DiffChange     { bg = hsl(354,42,56), fg = hsl(220,16,10) }, -- Diff mode: Changed line |diff.txt|
    DiffDelete     { bg = hsl(354,42,56), fg = hsl(220,16,10) }, -- Diff mode: Deleted line |diff.txt|
    DiffText       { bg = hsl(218,27,94), fg = hsl(220,16,10) }, -- Diff mode: Changed text within a changed line |diff.txt|
    -- EndOfBuffer    { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    TermCursor     { fg = hsl(218,27,94), bg = hsl(213,32,53) }, -- Cursor in a focused terminal
    -- TermCursorNC   { }, -- Cursor in an unfocused terminal
    ErrorMsg       { bg = hsl(354,42,56), fg = hsl(220,16,10) }, -- Error messages on the command line
    -- VertSplit      { }, -- Column separating vertically split windows
   	Folded         { fg = hsl(193,42,67), bg = hsl(219,28,20) }, -- Line used for closed folds
   	FoldColumn     { fg = hsl(193,42,67), bg = hsl(219,28,20) }, -- 'foldcolumn'
   	SignColumn     { fg = hsl(193,42,67), bg = hsl(219,28,20) }, -- Column where |signs| are displayed
   	IncSearch      { fg = hsl(218,27,94), bg = hsl(213,32,53) }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute     { fg = hsl(220,16,50), bg = hsl(218,27,94) }, -- |:substitute| replacement text highlighting
    LineNr		{ fg = hsl(193,43,67) }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    LineNrAbove    { fg = hsl(213,32,53) }, -- Line number for when the 'relativenumber' option is set, above the cursor line
	LineNrBelow    { fg = hsl(213,32,53) }, -- Line number for when the 'relativenumber' option is set, below the cursor line
    CursorLineNr   { fg = hsl(193,43,67) }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    CursorLineFold { fg = hsl(193,42,67), bg = hsl(219,28,20) }, -- Like FoldColumn when 'cursorline' is set for the cursor line
    CursorLineSign { fg = hsl(193,42,67), bg = hsl(219,28,20) }, -- Like SignColumn when 'cursorline' is set for the cursor line
    MatchParen     { gui = "bold", fg = hsl(218,27,94), bg = hsl(213,32,50) }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- ModeMsg        { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea        { }, -- Area for messages and cmdline
    -- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg        { fg = hsl(92,28,65) }, -- |more-prompt|
    NonText        { fg = hsl(213,32,50) }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal		{ fg = hsl(218,27,94) }, -- Normal text
    NormalFloat    { fg = hsl(218,27,94), bg = hsl(213,32,50) }, -- Normal text in floating windows.
    -- FloatBorder    { }, -- Border of floating windows.
    -- FloatTitle     { }, -- Title of floating windows.
    -- NormalNC       { }, -- normal text in non-current windows
    Pmenu          { fg = hsl(218,27,94), bg = hsl(213,32,50) }, -- Popup menu: Normal item.
    PmenuSel       { bg = hsl(220,16,32), gui = "underline" }, -- Popup menu: Selected item.
    PmenuKind      { fg = hsl(218,27,94), bg = hsl(213,32,50) }, -- Popup menu: Normal item "kind"
    PmenuKindSel   { bg = hsl(220,16,32), gui = "underline" }, -- Popup menu: Selected item "kind"
    PmenuExtra     { fg = hsl(218,27,94), bg = hsl(213,32,50) }, -- Popup menu: Normal item "extra text"
    PmenuExtraSel  { bg = hsl(220,16,32), gui = "underline" }, -- Popup menu: Selected item "extra text"
    PmenuSbar      { bg = hsl(220,16,32) }, -- Popup menu: Scrollbar.
    -- PmenuThumb     { }, -- Popup menu: Thumb of the scrollbar.
    Question       { fg = hsl(92,28,65) }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search         { fg = hsl(220,16,50), bg = hsl(218,27,94) }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    SpecialKey     { fg = hsl(219,28,80) }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad       { gui = "undercurl", fg = hsl(354,42,56) }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap       { gui = "undercurl", fg = hsl(213,32,53) }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal     { gui = "undercurl", fg = hsl(92,28,65) }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare      { gui = "undercurl", fg = hsl(311,20,63) }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    StatusLine     { gui = "bold", bg = hsl(220,16,50), fg = hsl(218,27,94) }, -- Status line of current window
    StatusLineNC   {  bg = hsl(220,16,50), fg = hsl(218,27,94) }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine        { bg = hsl(220,16,32), gui = "underline" }, -- Tab pages line, not active tab page label
    TabLineFill    { bg = hsl(220,16,50), fg = hsl(218,27,94) }, -- Tab pages line, where there are no labels
    -- TabLineSel     { }, -- Tab pages line, active tab page label
    Title          { fg = hsl(218,27,94) }, -- Titles for output from ":set all", ":autocmd" etc.
    Visual         { bg = hsl(220,16,50), fg = hsl(218,27,94) }, -- Visual mode selection
    -- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg     { fg = hsl(354,42,56) }, -- Warning messages
    Whitespace     { fg = hsl(193,43,67) }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- Winseparator   { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    WildMenu       { bg = hsl(220,16,50), fg = hsl(218,27,94) }, -- Current match in 'wildmenu' completion
    -- WinBar         { }, -- Window bar of current window
    -- WinBarNC       { }, -- Window bar of not-current windows

    Comment        { fg = hsl(210,34,63) }, -- Any comment

    Constant       { fg = hsl(92,28,65) }, -- (*) Any constant
    -- String         { }, --   A string constant: "this is a string"
    -- Character      { }, --   A character constant: 'c', '\n'
    -- Number         { }, --   A number constant: 234, 0xff
    -- Boolean        { }, --   A boolean constant: TRUE, false
    -- Float          { }, --   A floating point constant: 2.3e10

    Identifier     { fg = hsl(193,43,67) }, -- (*) Any variable name
    -- Function       { }, --   Function name (also: methods for classes)

    Statement      { fg = hsl(219,28,80) }, -- (*) Any statement
    -- Conditional    { }, --   if, then, else, endif, switch, etc.
    -- Repeat         { }, --   for, do, while, etc.
    -- Label          { }, --   case, default, etc.
    -- Operator       { }, --   "sizeof", "+", "*", etc.
    -- Keyword        { }, --   any other keyword
    -- Exception      { }, --   try, catch, throw

    PreProc        { fg = hsl(219,28,80) }, -- (*) Generic Preprocessor
    -- Include        { }, --   Preprocessor #include
    -- Define         { }, --   Preprocessor #define
    -- Macro          { }, --   Same as Define
    -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

    Type           { fg = hsl(179,25,65) }, -- (*) int, long, char, etc.
    -- StorageClass   { }, --   static, register, volatile, etc.
    -- Structure      { }, --   struct, union, enum, etc.
    -- Typedef        { }, --   A typedef

    Special        { fg = hsl(311,20,63) }, -- (*) Any special symbol
    -- SpecialChar    { }, --   Special character in a constant
    -- Tag            { }, --   You can use CTRL-] on this
    -- Delimiter      { }, --   Character that needs attention
    -- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
    -- Debug          { }, --   Debugging statements

    Underlined     { gui = "underline", fg = hsl(14,51,63) }, -- Text that stands out, HTML links
    -- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    Error          { bg = hsl(354,42,56), fg = hsl(220,16,10) }, -- Any erroneous construct
    Todo           { bg = hsl(218,27,94), fg = hsl(220,16,10) }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- LspReferenceText            { } , -- Used for highlighting "text" references
    -- LspReferenceRead            { } , -- Used for highlighting "read" references
    -- LspReferenceWrite           { } , -- Used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    DiagnosticError            { fg = hsl(354,42,56) } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn             { fg = hsl(14,51,63) } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo             { fg = hsl(179,25,65) } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint             { fg = hsl(218,27,94) } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticOk               { fg = hsl(92,28,65) } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    -- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
    DiagnosticUnderlineError   { gui = "underline", fg = hsl(354,42,56) } , -- Used to underline "Error" diagnostics.
    DiagnosticUnderlineWarn    { gui = "underline", fg = hsl(14,51,63) } , -- Used to underline "Warn" diagnostics.
    DiagnosticUnderlineInfo    { gui = "underline", fg = hsl(179,25,65) } , -- Used to underline "Info" diagnostics.
    DiagnosticUnderlineHint    { gui = "underline", fg = hsl(218,27,94) } , -- Used to underline "Hint" diagnostics.
    DiagnosticUnderlineOk      { gui = "underline", fg = hsl(92,28,65) } , -- Used to underline "Ok" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
    -- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

    -- Tree-Sitter syntax groups.

    -- sym"@text.literal"      { }, -- Comment
    -- sym"@text.reference"    { }, -- Identifier
    -- sym"@text.title"        { }, -- Title
    -- sym"@text.uri"          { }, -- Underlined
    -- sym"@text.underline"    { }, -- Underlined
    -- sym"@text.todo"         { }, -- Todo
    -- sym"@comment"           { }, -- Comment
    -- sym"@punctuation"       { }, -- Delimiter
    -- sym"@constant"          { }, -- Constant
    -- sym"@constant.builtin"  { }, -- Special
    -- sym"@constant.macro"    { }, -- Define
    -- sym"@define"            { }, -- Define
    -- sym"@macro"             { }, -- Macro
    -- sym"@string"            { }, -- String
    -- sym"@string.escape"     { }, -- SpecialChar
    -- sym"@string.special"    { }, -- SpecialChar
    -- sym"@character"         { }, -- Character
    -- sym"@character.special" { }, -- SpecialChar
    -- sym"@number"            { }, -- Number
    -- sym"@boolean"           { }, -- Boolean
    -- sym"@float"             { }, -- Float
    -- sym"@function"          { }, -- Function
    -- sym"@function.builtin"  { }, -- Special
    -- sym"@function.macro"    { }, -- Macro
    -- sym"@parameter"         { }, -- Identifier
    -- sym"@method"            { }, -- Function
    -- sym"@field"             { }, -- Identifier
    -- sym"@property"          { }, -- Identifier
    -- sym"@constructor"       { }, -- Special
    -- sym"@conditional"       { }, -- Conditional
    -- sym"@repeat"            { }, -- Repeat
    -- sym"@label"             { }, -- Label
    -- sym"@operator"          { }, -- Operator
    -- sym"@keyword"           { }, -- Keyword
    -- sym"@exception"         { }, -- Exception
    -- sym"@variable"          { }, -- Identifier
    -- sym"@type"              { }, -- Type
    -- sym"@type.definition"   { }, -- Typedef
    -- sym"@storageclass"      { }, -- StorageClass
    -- sym"@structure"         { }, -- Structure
    -- sym"@namespace"         { }, -- Identifier
    -- sym"@include"           { }, -- Include
    -- sym"@preproc"           { }, -- PreProc
    -- sym"@debug"             { }, -- Debug
    -- sym"@tag"               { }, -- Tag
}
end)

return theme
