declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@a = global i32 1
define i32 @foo( i32 %r100 ) {
bb1:
  %r101 = alloca i32
  store i32 %r100, i32* %r101
  %r102 = load i32, i32* %r101
  store i32 %r102, i32* @a
  ret i32 1
}

define i32 @main( ) {
bb2:
  call void @_sysy_starttime(i32 9)
  %r103 = alloca i32
  store i32 1, i32* %r103
  %r104 = call i32 @foo(i32 2)
  %r105 = icmp sgt i32 %r104, 0
  br i1 %r105, label %bb_if_5_19_true, label %bb25_19_next

bb25_19_next:
  %r106 = call i32 @foo(i32 3)
  %r107 = icmp sgt i32 %r106, 0
  br i1 %r107, label %bb_if_5_19_true, label %bb_if_5_19_false

bb_if_5_19_true:
  store i32 2, i32* %r103
  br label %bb_if_5_19_end

bb_if_5_19_false:
  br label %bb_if_5_19_end

bb_if_5_19_end:
  %r108 = load i32, i32* @a
  call void @putint(i32 %r108)
  %r109 = load i32, i32* %r103
  call void @putint(i32 %r109)
  call void @_sysy_stoptime(i32 17)
  ret i32 0
}

