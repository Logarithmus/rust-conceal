" Remove the keywords. We'll re-add them below. Use silent in case the group
" doesn't exist.
silent! syntax clear rustOperator
silent! syntax clear rustRepeat

" Raised dot for static members
syntax match rustOperator "::" conceal cchar=°

" I want the semicolons to fade into the background.
" syntax match rustOperator ';' conceal cchar=𐤟
syntax match rustOperator '\v\zs;\ze(\s*//.*)?$' conceal cchar=♢

" TODO try dimming curly braces (or you could conceal them completely because
" they only denote *scope*, unlike parens
"XXX cchar= (regular space)
" syntax match rustOperator '\v(\{ ?)|(\} ?)' conceal cchar=♢
syntax match rustOperator '\v(\{ ?)|(\} ?)' conceal

" Matches x0 -> x₀ A2 -> A₂ word2 -> word₂
" Use ms=s+1 to avoid concealing the letter before the number

syntax match Normal '\v[^[:digit:]]\zs\.0\ze[^[:digit:]]?' conceal cchar=₀
syntax match Normal '\v[^[:digit:]]\zs\.1\ze[^[:digit:]]?' conceal cchar=₁
syntax match Normal '\v[[:digit:]]\zs\.2\ze[^[:digit:]]?' conceal cchar=₂
syntax match Normal '\v<[[:alpha:]_]+0>'ms=e conceal cchar=₀
syntax match Normal '\v<[[:alpha:]_]+1>'ms=e conceal cchar=₁
syntax match Normal '\v<[[:alpha:]_]+2>'ms=e conceal cchar=₂
syntax match Normal '\v<[[:alpha:]_]+3>'ms=e conceal cchar=₃
syntax match Normal '\v<[[:alpha:]_]+4>'ms=e conceal cchar=₄
syntax match Normal '\v<[[:alpha:]_]+5>'ms=e conceal cchar=₅
syntax match Normal '\v<[[:alpha:]_]+6>'ms=e conceal cchar=₆
syntax match Normal '\v<[[:alpha:]_]+7>'ms=e conceal cchar=₇
" the ranges avoid f8, u8,i8
syntax match Normal '\v<[a-eg-hj-tv-z_]+8>'ms=e conceal cchar=₈
syntax match Normal '\v<[[:alpha:]_]+9>'ms=e conceal cchar=₉

" Numbers
syntax match Normal '\v[^_]\zs_0\ze>' conceal cchar=₀
syntax match Normal '\v[^_]\zs_1\ze>' conceal cchar=₁
syntax match Normal '\v[^_]\zs_2\ze>' conceal cchar=₂
syntax match Normal '\v[^_]\zs_3\ze>' conceal cchar=₃
syntax match Normal '\v[^_]\zs_4\ze>' conceal cchar=₄
syntax match Normal '\v[^_]\zs_5\ze>' conceal cchar=₅
syntax match Normal '\v[^_]\zs_6\ze>' conceal cchar=₆
syntax match Normal '\v[^_]\zs_7\ze>' conceal cchar=₇
syntax match Normal '\v[^_]\zs_8\ze>' conceal cchar=₈
syntax match Normal '\v[^_]\zs_9\ze>' conceal cchar=₉
" Letters
syntax match Normal '\v[^_]\zs_[aA]\ze>' conceal cchar=ₐ
syntax match Normal '\v[^_]\zs_[lL]\ze>' conceal cchar=ₗ
syntax match Normal '\v[^_]\zs_[pP]\ze>' conceal cchar=ₚ
syntax match Normal '\v[^_]\zs_[rR]\ze>' conceal cchar=ᵣ
syntax match Normal '\v[^_]\zs_[sS]\ze>' conceal cchar=ₛ
syntax match Normal '\v[^_]\zs_[uU]\ze>' conceal cchar=ᵤ
syntax match Normal '\v[^_]\zs_[vV]\ze>' conceal cchar=ᵥ
syntax match Normal '\v[^_]\zs_[xX]\ze>' conceal cchar=ₓ	
syntax match Normal '\v[^_]\zs_[hH]\ze>' conceal cchar=ₕ
syntax match Normal '\v[^_]\zs_[iI]\ze>' conceal cchar=ᵢ
syntax match Normal '\v[^_]\zs_[jJ]\ze>' conceal cchar=ⱼ
syntax match Normal '\v[^_]\zs_[kK]\ze>' conceal cchar=ₖ
syntax match Normal '\v[^_]\zs_[nN]\ze>' conceal cchar=ₙ
syntax match Normal '\v[^_]\zs_[mM]\ze>' conceal cchar=ₘ
syntax match Normal '\v[^_]\zs_[tT]\ze>' conceal cchar=ₜ

syntax match rustOperator '<<' conceal cchar=≺
syntax match rustOperator '>>' conceal cchar=≻
syntax match rustOperator '\^' conceal cchar=⊕
syntax match rustOperator '\v\.\.\=' conceal cchar=…
syntax match rustOperator '&&' conceal cchar=∧
" Space is required to distinguish this from empty closure
syntax match rustOperator '[^=,] \zs||\ze ' conceal cchar=∨

syntax match rustOperator "<=" conceal cchar=≤
syntax match rustOperator ">=" conceal cchar=≥

" syntax match rustOperator "->" conceal cchar=→
" syntax match rustOperator "=>" conceal cchar=⇒

syn match rustRightArrowHead contained ">" conceal
syn match rustRightArrowTail contained "-" conceal cchar=→
syn match rustOperator "->" contains=rustRightArrowHead,rustRightArrowTail

syn match rustFatRightArrowHead contained ">" conceal
syn match rustFatRightArrowTail contained "=" conceal cchar=⇒
syn match rustOperator "=>" contains=rustFatRightArrowHead,rustFatRightArrowTail

syntax match rustOperator '\<\@!_\(_*\>\)\@=' conceal cchar=′

syntax match rustOperator '\s=\s'ms=s+1,me=e-1 conceal cchar=←
syntax match rustOperator '\S=\S'ms=s+1,me=e-1 conceal cchar=←

" only conceal “==” if alone, to avoid concealing merge conflict markers
syntax match rustOperator "=\@<!===\@!" conceal cchar=≝

" Has to be ! before != for it to work since rules are matched one after the
" other, so the last one "wins".
syntax match rustOperator '!' conceal cchar=¬
syntax match rustOperator '!=' conceal cchar=≠

syntax match rustOperator '\( \|\)\*\*\( \|\)2\>' conceal cchar=²
syntax match rustOperator '\( \|\)\*\*\( \|\)n\>' conceal cchar=ⁿ
" only conceals when theres one space on each side of the star, making it
" unambiguous with pointer dereferencing
syntax match rustOperator '\s\*\s'ms=s+1,me=e-1 conceal cchar=∙
" TODO conceal map operator
" TODO conceal that awful arrow typeclass notation with idiom brackets

" Most specific goes last since conceal run top to bottom
syntax match rustOperator '\v\.iter\(\)' conceal cchar=↑
syntax match rustOperator '\v\.enumerate\(\)' conceal cchar=⇡
syntax match rustOperator '\v\.iter\(\)\.enumerate\(\)' conceal cchar=⇡

syntax keyword rustKeyword alpha ALPHA conceal cchar=α
syntax keyword rustKeyword beta BETA conceal cchar=β
syntax keyword rustKeyword Gamma conceal cchar=Γ
syntax keyword rustKeyword gamma GAMMA conceal cchar=γ
syntax keyword rustKeyword Delta conceal cchar=Δ
syntax keyword rustKeyword delta DELTA conceal cchar=δ
syntax keyword rustKeyword epsilon EPSILON conceal cchar=ε
syntax keyword rustKeyword zeta ZETA conceal cchar=ζ
syntax keyword rustKeyword eta ETA conceal cchar=η
syntax keyword rustKeyword Theta conceal cchar=ϴ
syntax keyword rustKeyword theta THETA conceal cchar=θ
syntax keyword rustKeyword kappa KAPPA conceal cchar=κ
syntax keyword rustKeyword lambda LAMBDA lambda_ _lambda conceal cchar=λ
syntax keyword rustKeyword mu MU conceal cchar=μ
syntax keyword rustKeyword nu NU conceal cchar=ν
syntax keyword rustKeyword Xi conceal cchar=Ξ
syntax keyword rustKeyword xi XI conceal cchar=ξ
syntax keyword rustKeyword Pi conceal cchar=Π
syntax keyword rustKeyword rho RHO conceal cchar=ρ
syntax keyword rustKeyword sigma SIGMA conceal cchar=σ
syntax keyword rustKeyword tau TAU conceal cchar=τ
syntax keyword rustKeyword upsilon UPSILON conceal cchar=υ
syntax keyword rustKeyword Phi conceal cchar=Φ
syntax keyword rustKeyword phi PHI conceal cchar=φ
syntax keyword rustKeyword chi CHI conceal cchar=χ
syntax keyword rustKeyword Psi conceal cchar=Ψ
syntax keyword rustKeyword psi PSI conceal cchar=ψ
syntax keyword rustKeyword Omega conceal cchar=Ω
syntax keyword rustKeyword omega OMEGA conceal cchar=ω
syntax keyword rustKeyword nabla NABLA conceal cchar=∇

" like APL
syntax keyword rustOperator in conceal cchar=∈
" we don't use syn keyword in order to swallow the space after.
" syntax match rustOperator '\v<pub ' conceal cchar=“
syntax match rustOperator '\v<pub ' conceal cchar=“
"traits and their impls are sections of a paragraph
syntax keyword rustOperator impl conceal cchar=※
syntax keyword rustOperator struct conceal cchar=✕
syntax keyword rustOperator enum conceal cchar=+
syntax keyword rustOperator trait conceal cchar=§
" TODO consider using the pointer symbol for the borrow op/ref op
syntax keyword rustOperator let conceal cchar=⇨
" syntax match rustOperator 'let ' conceal
syntax keyword rustKeyword Some conceal cchar=✔
syntax keyword rustConstant None conceal cchar=∅
" http://www.fileformat.info/info/unicode/block/geometric_shapes/images.htm
syntax keyword rustConstant break conceal cchar=◁
syntax keyword rustKeyword continue conceal cchar=↻
syntax keyword rustKeyword return conceal cchar=◀
syntax keyword rustKeyword match conceal cchar=▸
syntax keyword rustKeyword if conceal cchar=▸
syntax match rustKeyword 'else if' conceal cchar=▹
syntax keyword rustKeyword else conceal cchar=▪
syntax keyword rustConstant true conceal cchar=⊤
syntax keyword rustConstant false conceal cchar=⊥
" TODO conceal only on lines that don't contain `impl` using \zs and \ze
syntax match rustKeyword '^\%(.*impl\)\@!.*\zsfor' conceal cchar=∀
" syntax keyword rustKeyword for conceal cchar=∀
" syntax match rustKeyword '\v(impl .+)@! \zsfor\ze' conceal cchar=∀
syntax keyword rustKeyword while conceal cchar=⥁
syntax keyword rustKeyword loop conceal cchar=∞
syntax keyword rustKeyword unsafe conceal cchar=☡
syntax keyword rustKeyword fn conceal cchar=λ
" syntax keyword rustKeyword Err conceal cchar=✘
syntax keyword rustKeyword self conceal cchar=⚕

syntax keyword rustType bool conceal cchar=𝔹
syntax keyword rustType char conceal cchar=∁

syntax keyword rustType f32 conceal cchar=ℝ
syntax keyword rustType f64 conceal cchar=ℝ

syntax keyword rustType i32 conceal cchar=ℤ
syntax keyword rustType i64 conceal cchar=ℤ
syntax keyword rustType isize conceal cchar=ℤ

syntax keyword rustType u32 conceal cchar=ℕ
syntax keyword rustType u64 conceal cchar=ℕ
syntax keyword rustType usize conceal cchar=ℕ

syntax keyword rustType str String conceal cchar=𝐒
syntax match rustType '\v\&(str|String)' conceal cchar=𝐒

syntax keyword rustType Vec conceal cchar=𝕍
syntax match rustType '\v\zsvec!\ze\[' conceal cchar=𝕍
syntax keyword rustKeyword where conceal cchar=∵

highlight! link rustBuiltin rustOperator
highlight! link rustOperator Operator
highlight! link rustStatement Statement
highlight! link rustKeyword Keyword
highlight! link rustComment Comment
highlight! link rustConstant Constant
highlight! link rustSpecial Special
highlight! link rustIdentifier Identifier
highlight! link rustType Type

" changing this changes the color of vim's conceal
highlight! link Conceal Normal
" highlight! link Conceal PreProc

setlocal conceallevel=2

