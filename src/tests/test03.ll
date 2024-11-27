declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@b = global [ 10 x i32 ] zeroinitializer
define void @foo( i32* %r100 ) {
bb1:
  %r101 = alloca i32
  store i32 0, i32* %r101
  br label %bb_while_5_13_cond

bb_while_5_13_cond:
  %r102 = load i32, i32* %r101
  %r103 = icmp slt i32 %r102, 10
  br i1 %r103, label %bb_while_5_13_whilestms, label %bb_while_5_13_bre

bb_while_5_13_whilestms:
  %r104 = load i32, i32* %r101
  %r105 = getelementptr i32, i32* %r100, i32 %r104
  %r106 = call i32 @getint()
  store i32 %r106, i32* %r105
  %r107 = load i32, i32* %r101
  %r108 = add i32 %r107, 1
  store i32 %r108, i32* %r101
  br label %bb_while_5_13_cond

bb_while_5_13_bre:
  ret void
}

define i32 @main( ) {
bb2:
  call void @_sysy_starttime(i32 13)
  %r109 = alloca i32
  store i32 0, i32* %r109
  %r110 = alloca i32
  store i32 0, i32* %r110
  %r111 = getelementptr [10 x i32 ], [10 x i32 ]* @b, i32 0, i32 0
  call void @foo(i32* %r111)
  br label %bb_while_5_25_cond

bb_while_5_25_cond:
  %r112 = load i32, i32* %r109
  %r113 = icmp slt i32 %r112, 10
  br i1 %r113, label %bb_while_5_25_whilestms, label %bb_while_5_25_bre

bb_while_5_25_whilestms:
  %r114 = load i32, i32* %r110
  %r115 = load i32, i32* %r109
  %r116 = getelementptr [10 x i32 ], [10 x i32 ]* @b, i32 0, i32 %r115
  %r117 = load i32, i32* %r116
  %r118 = add i32 %r114, %r117
  store i32 %r118, i32* %r110
  %r119 = load i32, i32* %r109
  %r120 = add i32 %r119, 1
  store i32 %r120, i32* %r109
  br label %bb_while_5_25_cond

bb_while_5_25_bre:
  %r121 = getelementptr [10 x i32 ], [10 x i32 ]* @b, i32 0, i32 0
  call void @putarray(i32 10, i32* %r121)
  %r122 = load i32, i32* %r110
  call void @putint(i32 %r122)
  call void @_sysy_stoptime(i32 24)
  ret i32 0
}

