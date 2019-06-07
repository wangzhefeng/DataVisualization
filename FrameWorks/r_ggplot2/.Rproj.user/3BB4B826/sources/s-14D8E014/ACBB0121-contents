# ==========================
# Data type and structure
# ==========================
# vector
    # numeric
    # character
    # logical
    # interger
    # double
    # datatime
    # factor
# array
    # matrix
    # array
# list
# data.frame


# ==========================
# Global options set
options(stringsAsFactors = FALSE)
# =======================
a = c(1, 2, 3, 4)
1:10
rep(1:3, each = 4)
rep(1:3, times = 4)
seq(from = 1, to = 100, by = 5)
seq(from = 1, by = 5, length = 20)
seq(to = 10, by = 5, length = 20)
letters
LETTERS
sample(1:10, size = 10, replace = FALSE)
sprintf("%.2f%%", 1:10)
sca::percent(seq(0, 0.1, 0.01), d = 2, sep = "")
scales::percent(runif(10, 0.1))

vector()
matrix()
array()
list()
data.frame()
# ====================
str()
typeof()
mode()
class()

is.complex()
is.call()
is.element()
is.empty.model()
is.environment()
is.expression()
is.finite()
is.function()
is.infinite()
is.language()
is.leaf()
is.loaded()
is.na()


is.character()
is.numeric()
is.integer()
is.double()
is.logical()

as.character()
as.numeric()
as.integer()
as.double()
as.logical()

is.vector()
is.matrix()
is.array()
is.data.frame()
is.list()

as.vector()
as.matrix()
as.array()
as.data.frame()
as.list()

# ======================
factor(x = c(), levels = c(), labels = c(), ordered = FALSE)

is.factor()
as.factor()


# =====================
a = c(23L, 24L)
typeof(a)
mode(a)
class(a)

# =====================
fact = cut(
    x = sample(1:100, size = 100, replace = TRUE),
    breaks = c(0, 20, 40, 60, 80, 100),
    labels = c('0~20', '20~40', '40~60', '60~80', '80~100'),
    include.lowest = TRUE,
    ordered = TRUE
)

values = sample(1:100, size = 100, replace = TRUE)
qa = quantile(
    x= values,
    probs = seq(0, 1, 0.2)
)
fact = cut(
    x = values,
    breaks = qa,
    labels = c('0~20', '20~40', '40~60', '60~80', '80~100'),
    include.lowest = TRUE,
    ordered = TRUE
)


