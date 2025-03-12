# a. 
la   $t0, aa

# b.
lw   $t0, bb

# c.
lb   $t0, bb

# d.
lw   $t0, aa+4

# e.
la   $t1, cc
lw   $t0, ($t1)

# f.
la   $t1, cc
lw   $t0, 8($t1)

# g.
li   $t1, 8
lw   $t0, cc($t1)

# h. 
la   $t1, cc
lw   $t0, 2($t1)
