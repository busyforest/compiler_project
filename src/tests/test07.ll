declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define i32 @main( ) {
bb1:
  %r104 = alloca i32
  call void @_sysy_starttime(i32 2)
  %r100 = alloca i32
  store i32 0, i32* %r100
  %r101 = alloca i32
  store i32 1, i32* %r101
  br label %bb_while_5_13_cond

bb_while_5_13_cond:
  %r102 = load i32, i32* %r100
  %r103 = icmp slt i32 %r102, 1000000
  br i1 %r103, label %bb_while_5_13_whilestms, label %bb_while_5_13_bre

bb_while_5_13_whilestms:
  store i32 0, i32* %r104
  %r105 = load i32, i32* %r100
  %r106 = add i32 %r105, 1
  store i32 %r106, i32* %r100
  br label %bb_while_5_13_cond

bb_while_5_13_bre:
  %r107 = load i32, i32* %r101
  call void @putint(i32 %r107)
  call void @_sysy_stoptime(i32 10)
  ret i32 0
}

